//
//  Subject.m
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "Subject.h"

@implementation Subject
@synthesize subject_code,subject_title,total_questions;

-(NSString *)description
{
    NSString *str=[NSString stringWithFormat:@"%d%@%d",subject_code,subject_title,total_questions];
    return str;
}
@end
