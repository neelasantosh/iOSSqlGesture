//
//  DatabaseHelper.m
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "DatabaseHelper.h"
#import <sqlite3.h>
#import "Subject.h"
#import "Questions.h"

@implementation DatabaseHelper
+(NSString *)dbPath
{
    //to find the path in the bundle
    
    NSBundle *bundle = [NSBundle mainBundle];
    //dbFile Path is Source path,we have to move it to destination
    NSString *dbFilePath = [bundle pathForResource:@"cdac" ofType:@"sqlite"];
    
    NSLog(@"db path is:%@",dbFilePath);
    //move db file from bundle to document dir
    
    NSArray *arrayPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *appDocDirPath = [arrayPath objectAtIndex:0];
    //dbpathInDocdir is destination path,dbfilepath is moved into this
    NSString *dbPathInDocdir = [NSString stringWithFormat:@"%@/%@",appDocDirPath,@"cdac.sqlite"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL exist = [fileManager fileExistsAtPath:dbPathInDocdir];
    if (!exist) {
        [fileManager copyItemAtPath:dbFilePath toPath:dbPathInDocdir error:nil];
    }
    NSLog(@"The new path is:%@",dbPathInDocdir);
    
    return dbPathInDocdir;
}


+(NSMutableArray *)getAllSubjects
{
    NSMutableArray *arraySubjects = [[NSMutableArray alloc]init];
    
    //execute SQL on DataBase to get Student table
    
    NSString *query = @"select * from subject";
    
    //open the database,sqlite3 is structure
    
    sqlite3 *database;
    
    int result = sqlite3_open([[DatabaseHelper dbPath] UTF8String], &database);
    
    if (result == SQLITE_OK)//sucess
    {
        sqlite3_stmt *stmt;
        //execute query
        int selectResult = sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, NULL);
        if (selectResult == SQLITE_OK)//sucess
        {
            //read one row at a time
            while(sqlite3_step(stmt) == SQLITE_ROW) //sucess in moving to next row
            {
                //read data of current row
                int subjectcode = sqlite3_column_int(stmt, 0);
                const unsigned char *subjecttitle = sqlite3_column_text(stmt, 1);
                int totalquestions = sqlite3_column_int(stmt, 2);
                
                Subject *s1 = [[Subject alloc]init];
                s1.subject_code = subjectcode;
                s1.subject_title = [NSString stringWithUTF8String:subjecttitle];
                s1.total_questions = totalquestions;
                
                [arraySubjects addObject:s1];
                
                
            }//eof while
        }//eof if
    }//eof if
    sqlite3_close(database);
    return arraySubjects;
    
}

+(NSMutableArray *)getAllQuestions
{
    NSMutableArray *arrayQuestions = [[NSMutableArray alloc]init];
    
    //execute SQL on DataBase to get Student table
    
    NSString *query = @"select * from questions";
    
    //open the database,sqlite3 is structure
    
    sqlite3 *database;
    
    int result = sqlite3_open([[DatabaseHelper dbPath] UTF8String], &database);
    
    if (result == SQLITE_OK)//sucess
    {
        sqlite3_stmt *stmt;
        //execute query
        int selectResult = sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, NULL);
        if (selectResult == SQLITE_OK)//sucess
        {
            //read one row at a time
            while(sqlite3_step(stmt) == SQLITE_ROW) //sucess in moving to next row
            {
                //read data of current row
                int subjectcode = sqlite3_column_int(stmt, 0);
                int questionno = sqlite3_column_int(stmt, 1);
                const  char *questiontext = sqlite3_column_text(stmt, 2);
                 const  char *option1text = sqlite3_column_text(stmt, 3);
                 const  char *option2text = sqlite3_column_text(stmt, 4);
                 const  char *option3text = sqlite3_column_text(stmt, 5);
                 const  char *option4text = sqlite3_column_text(stmt, 6);
                const  char *rightoption = sqlite3_column_text(stmt, 7);
                
                Questions *s1 = [[Questions alloc]init];
                s1.subject_code = subjectcode;
                s1.question_no = questionno;
                s1.question_text = [NSString stringWithUTF8String:questiontext];
                s1.option1_text= [NSString stringWithUTF8String:option1text];
                s1.option2_text = [NSString stringWithUTF8String:option2text];
                s1.option3_text = [NSString stringWithUTF8String:option3text];
                s1.option4_text = [NSString stringWithUTF8String:option4text];
                s1.correct_option = [NSString stringWithUTF8String:rightoption];
               
                
                [arrayQuestions addObject:s1];
                
                
            }//eof while
        }//eof if
    }//eof if
    sqlite3_close(database);
    return arrayQuestions;

}
@end
