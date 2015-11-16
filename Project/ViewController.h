//
//  ViewController.h
//  Project
//
//  Created by Siddharth Kucheria on 7/9/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface ViewController : UIViewController
@property (strong, nonatomic)  UITextField *username;

@property (strong, nonatomic)  UITextField *password;

@property (strong, nonatomic) IBOutlet UIButton *loginB;

@property (strong, nonatomic) IBOutlet UIButton *registerB;

@property NSMutableArray *selectedFilters;


- (IBAction)loginButtonPressed:(id)sender;






@end
