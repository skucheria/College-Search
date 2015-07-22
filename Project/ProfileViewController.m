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
//@property UIImageView* profileView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
 
    
    
    UIImageView *profileView;
    profileView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40, 80, 80)];
    profileView.layer.cornerRadius = (80)/2;
    profileView.layer.masksToBounds = true;
    profileView.layer.borderColor = (__bridge CGColorRef)([UIColor whiteColor]);
//    profileView.image = [UIImage imageNamed:@"Male_profile_user_shadow_512"];
    profileView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:profileView];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    PFUser *current = [PFUser currentUser];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 20, 100, 200)];
    nameLabel.text = current.username;

    nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:nameLabel];
    


    
    
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
