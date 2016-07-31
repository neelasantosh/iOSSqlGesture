//
//  TestControllerViewController.h
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestControllerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *labelQuestion;
@property (strong, nonatomic) IBOutlet UITextField *labelA;
@property (strong, nonatomic) IBOutlet UITextField *labelB;
@property (strong, nonatomic) IBOutlet UITextField *labelC;
@property (strong, nonatomic) IBOutlet UITextField *labelD;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentSelect;
- (IBAction)segmentAction:(id)sender;
-(void)onSwipe:(UISwipeGestureRecognizer *)gesture;
@property (strong, nonatomic) IBOutlet UIView *uiSwipe;
@property int currentPositon;
@property NSMutableArray *arrayQuestions;
@end
