//
//  CollegeProfileViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/23/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "CollegeProfileViewController.h"
#import <Parse/Parse.h>
#import "ListTableViewController.h"

@interface CollegeProfileViewController ()

@end

@implementation CollegeProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height/2-220,170, 20)];
//    nameLabel.text  = activeCollege;
//    nameLabel.text = current.username;
    nameLabel.layer.borderWidth=2;
    nameLabel.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:nameLabel];
    
    
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
