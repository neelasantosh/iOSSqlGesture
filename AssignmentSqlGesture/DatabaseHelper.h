//
//  DatabaseHelper.h
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseHelper : NSObject
+(NSString *)dbPath;

+(NSMutableArray *)getAllQuestions;

//methaod that will read data from db
+(NSMutableArray *)getAllSubjects;
@end
