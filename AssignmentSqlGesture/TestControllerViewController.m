//
//  TestControllerViewController.m
//  AssignmentSqlGesture
//
//  Created by Rajesh on 16/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "TestControllerViewController.h"
#import "ViewController.h"
#import "Subject.h"
#import "Questions.h"
#import "DatabaseHelper.h"
@interface TestControllerViewController ()

@end

@implementation TestControllerViewController
@synthesize arrayQuestions,labelQuestion,labelA,labelB,labelC,labelD,segmentSelect,uiSwipe,currentPositon;
- (void)viewDidLoad {
    [super viewDidLoad];
    arrayQuestions = [DatabaseHelper getAllQuestions];
        ViewController *viewCon = [[self.navigationController viewControllers]objectAtIndex:0];
    Subject *sub = viewCon.selctedSubject;
    self.navigationItem.title = sub.subject_title;
    
    UIBarButtonItem *buttonAdd = [[UIBarButtonItem alloc]initWithTitle:@"Result" style:UIBarButtonItemStylePlain target:self action:@selector(result)];
    self.navigationItem.rightBarButtonItem = buttonAdd;
    
    Questions *test = [[Questions alloc]init];
    
    test = [arrayQuestions objectAtIndex:0];
    labelQuestion.text = test.question_text;
    labelA.text = test.option1_text;
    labelB.text = test.option2_text;
    labelC.text = test.option3_text;
    labelD.text = test.option4_text;
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onSwipe:)];
    
    swipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
    
    [uiSwipe addGestureRecognizer:swipeGesture];
    [uiSwipe setUserInteractionEnabled:true];

}
-(void)onSwipe:(UISwipeGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        NSLog(@"Swipe done");
        currentPositon++;
        if(currentPositon>=arrayQuestions.count)
        {
            currentPositon=0;
        }
        Questions *t=[[Questions alloc]init];
        t=[arrayQuestions objectAtIndex:currentPositon];
        
        labelQuestion.text=t.question_text;
        //labelQNo.text=[NSString stringWithFormat:@"Question %d /%lu",t.question_no,arrayTestQue.count];
       labelA.text=t.option1_text;
        labelB.text=t.option1_text;
        labelC.text=t.option1_text;
        labelD.text=t.option1_text;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentAction:(id)sender {
}
@end
