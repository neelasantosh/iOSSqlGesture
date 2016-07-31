//
//  Questions.m
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "Questions.h"

@implementation Questions
@synthesize subject_code,question_no,question_text,option1_text,option2_text,option3_text,option4_text,correct_option,arrayQuestions;



-(NSString *)description
{
    NSString *str=[NSString stringWithFormat:@"%d%d%@%@%@%@%@%@",subject_code,question_no,question_text,option1_text,option2_text,option3_text,option4_text,correct_option];
    return str;
}
@end
