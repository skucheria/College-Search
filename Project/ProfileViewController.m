//
//  ProfileViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/20/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()
@property UILabel *name;
@property int height;

@end

@implementation ProfileViewController
@synthesize profileView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
 

    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    PFUser *current = [PFUser currentUser];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 200)];
    nameLabel.text = current.username;

    nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:nameLabel];
    
    profileView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40, 120, 120)];
    profileView.layer.cornerRadius = (120)/2;
    profileView.layer.masksToBounds = true;
    profileView.backgroundColor = [UIColor blackColor];


    
    
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
