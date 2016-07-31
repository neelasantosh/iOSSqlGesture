//
//  ViewController.m
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseHelper.h"
#import "Subject.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize pickerSubjects,arraySubjects,selctedSubject;
- (void)viewDidLoad {
    [super viewDidLoad];
    arraySubjects=[DatabaseHelper getAllSubjects];
    
    pickerSubjects.dataSource=self;
    pickerSubjects.delegate=self;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    selctedSubject = [arraySubjects objectAtIndex:row];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arraySubjects.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *rowdata=@"";
    rowdata=[[arraySubjects objectAtIndex:row] description];
    return rowdata;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTest:(id)sender {
}
@end
