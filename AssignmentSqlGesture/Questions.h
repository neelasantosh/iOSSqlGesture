//
//  Questions.h
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Questions : NSObject
@property int subject_code;
@property int question_no;
@property NSString *question_text;
@property NSString *option1_text;
@property NSString *option2_text;
@property NSString *option3_text;
@property NSString *option4_text;
@property NSString *correct_option;
@property NSMutableArray *arrayQuestions;
@end
