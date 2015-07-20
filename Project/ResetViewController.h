//
//  ResetViewController.h
//  Project
//
//  Created by Siddharth Kucheria on 7/19/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface ResetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)sendEmailButton:(id)sender;

@end
