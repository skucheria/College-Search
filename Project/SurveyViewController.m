//
//  SurveyViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/11/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "SurveyViewController.h"

@interface SurveyViewController ()

@property NSArray *surveyArray;

@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
    self.title = @"Survey";
    
    UITextField *q1Field = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height/2-200,150, 50)];
    q1Field.placeholder = @"Small, Medium, or Large";
    q1Field.layer.borderColor =[[UIColor redColor ]CGColor];
    [self.view addSubview:q1Field];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(handleSaveButton:)];
    saveButton.tintColor = [UIColor greenColor];
    self.navigationItem.rightBarButtonItem = saveButton;

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancelButton:)];
    cancelButton.tintColor = [UIColor colorWithRed:0.88 green:0.40 blue:0.40 alpha:1.0];
    self.navigationItem.leftBarButtonItem = cancelButton;

    
    
    // Do any additional setup after loading the view.
}

- (void)handleSaveButton:(id)sender{
    
    
    
    
}

- (void)handleCancelButton:(id)sender{
    
    
}
    
    // picker customization..
    



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
