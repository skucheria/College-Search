//
//  RegisterViewController.h
//  Project
//
//  Created by Siddharth Kucheria on 7/9/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

@property (strong, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)registerButtonPressed:(id)sender;

@end
