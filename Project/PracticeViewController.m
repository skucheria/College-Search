//
//  PracticeViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/25/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "PracticeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SettingsViewController.h"
#import <RNFrostedSidebar/RNFrostedSidebar.h>


@interface PracticeViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;


@end

@implementation PracticeViewController




- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blackColor];
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    
    self.title = @"Main";
    
//    self.view.backgroundColor = [UIColor blackColor];
    
    
}



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
    callout.width = 200;
    callout.showFromRight = NO;
    callout.delegate = self;
    //    callout.showFromRight = YES;
    [callout show];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 3) {
        [sidebar dismissAnimated:YES];
    }
    if (index == 0) {
        
        UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *main=[mainstoryboard instantiateViewControllerWithIdentifier:@"main"];
        
        [self presentViewController:main animated:NO completion:nil];
        
        [sidebar dismissAnimated:YES];

    }
    if(index==1){
        UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *settings=[mainstoryboard instantiateViewControllerWithIdentifier:@"Profile"];
        
        [self presentViewController:settings animated:NO completion:nil];
        
        [sidebar dismissAnimated:YES];

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

@end
