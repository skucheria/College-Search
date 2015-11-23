//
//  FiltersViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 8/4/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "FiltersViewController.h"
#import "OptionsViewController.h"

@interface FiltersViewController ()

@end

@implementation FiltersViewController
@synthesize English, b1, b2, b3;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *physics = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, 130, 40)];
    [physics setTitle:@"Physics" forState:UIControlStateNormal];
    [[physics layer] setBorderWidth:2.0f];
    [[physics layer] setBorderColor:[UIColor blackColor].CGColor];

    physics.tintColor = [UIColor blackColor];
    [self.view addSubview:physics];
    

    
    
    // Do any additional setup after loading the view.
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
