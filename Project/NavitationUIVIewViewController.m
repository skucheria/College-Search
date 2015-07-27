//
//  NavitationUIVIewViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/27/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "NavitationUIVIewViewController.h"


@interface NavitationUIVIewViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;


@end

@implementation NavitationUIVIewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImage *menuImage = [UIImage imageNamed:@"burger.png"];//[UIColor colorWithRed:0.88 green:0.40 blue:0.40 alpha:1.0]
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setFrame:CGRectMake(20, 30, 25, 25)];
    [menuButton setBackgroundImage:menuImage forState:UIControlStateNormal];
    [menuButton addTarget:self.navigationController.parentViewController action:@selector(onBurger:) forControlEvents:UIControlEventTouchDown];
    //    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc]initWithCustomView:menuButton];
    //    self.navigationItem.leftBarButtonItem = menuBarButton;
    [self.view addSubview:menuButton];

    
    
    // Do any additional setup after loading the view.
}


- (void)onBurger:(id)sender{
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


- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 3) {
        [sidebar dismissAnimated:YES];
    }
    if (index == 0) {
        [sidebar dismissAnimated:YES];
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

@end
