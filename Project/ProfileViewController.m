//
//  ProfileViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/20/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "PracticeViewController.h"

@interface ProfileViewController ()
@property UILabel *name;
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

@property int height;
//@property UIImageView* profileView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];

    
    self.view.backgroundColor =[UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
 
    self.title = @"Profile";
    
    UIImageView *profileView;
    profileView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 90, 80, 80)];
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
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height/2-220,170, 20)];
    nameLabel.text = current.username;
    nameLabel.layer.borderWidth=2;
    nameLabel.layer.borderColor = [[UIColor whiteColor]CGColor];

    nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:nameLabel];
    
    
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 3) {
        [sidebar dismissAnimated:YES];
    }
    if (index == 0) {
        [sidebar dismissAnimated:YES];
        
        
        UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *main=[mainstoryboard instantiateViewControllerWithIdentifier:@"main"];
        
        [self presentViewController:main animated:NO completion:nil];
    }
    if(index==1){
        [sidebar dismissAnimated:YES];
        
//                UIViewController *profile = [[ProfileViewController alloc] init];
//                [self.navigationController pushViewController:profile animated:YES];
    
        
       UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *settings=[mainstoryboard instantiateViewControllerWithIdentifier:@"Profile"];
    
        [self presentViewController:settings animated:NO completion:nil];
    }
    if (index == 2) {
        
        [sidebar dismissAnimated:YES];
        
        UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *settings=[mainstoryboard instantiateViewControllerWithIdentifier:@"Settings"];
        
        [self presentViewController:settings animated:NO completion:nil];
    }
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
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

- (IBAction)onBurger:(id)sender {
    
    NSLog(@"burger pressed");
    NSArray *images = @[
                        [UIImage imageNamed:@"graduation-cap2.png"],
                        [UIImage imageNamed:@"profile@2x.png"],
                        [UIImage imageNamed:@"gear@2x.png"],
                        [UIImage imageNamed:@"11759428_993383067362045_1836886512_n.png"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
    //    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    //    callout.showFromRight = YES;
    [callout show];

}
@end
