//
//  SurveyViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/11/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "SurveyViewController.h"

@interface SurveyViewController ()


@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] init];
    
    // button customization
    
    [btn addTarget:self action:@selector(showPickerView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)showPickerView:(UIButton*)sender
{
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.tag = 998998;
    
    // picker customization..
    
    [self.view insertSubview:picker aboveSubview:self.view];
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

@end
