//
//  ViewController.h
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Subject.h"
@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *pickerSubjects;

@property Subject *selctedSubject;

- (IBAction)startTest:(id)sender;

@property NSMutableArray *arraySubjects;


@end

