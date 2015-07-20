//
//  ResetViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/19/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "ResetViewController.h"

@interface ResetViewController ()
@property NSString *enteredEmail;

@end


@implementation ResetViewController
@synthesize enteredEmail;
@synthesize emailTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sendEmailButton:(id)sender {
    enteredEmail = emailTextField.text;
    [PFUser requestPasswordResetForEmailInBackground:enteredEmail block:^(BOOL succeeded, NSError *error) {
        if(!error)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Sent" message:@"An email has been sent. You can reset your password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];

            NSLog(@"Ok");
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The email entered is not associated with any user. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
                
        }
    }];

    
    
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
