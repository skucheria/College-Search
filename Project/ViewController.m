//
//  ViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/9/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "RegisterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"




@interface ViewController ()

@property NSArray *userArray;


@end

@implementation ViewController
@synthesize loginB;
@synthesize registerB;
//@synthesize registerButton;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
    
    loginB.frame = CGRectMake(self.view.frame.size.width/2-200, self.view.frame.size.height - 350, 400, 120);
    loginB.layer.cornerRadius = 10;
    loginB.layer.masksToBounds = true;
    loginB.layer.borderWidth=1;
    loginB.layer.borderColor=[UIColor whiteColor].CGColor;
    [loginB setTitle:@"Login" forState:UIControlStateNormal];
    [loginB.titleLabel setTextAlignment: NSTextAlignmentCenter];
    
    registerB.frame = CGRectMake(self.view.frame.size.width/2-200, self.view.frame.size.height - 260, 40, 120);
    registerB.layer.cornerRadius = 10;
    registerB.layer.masksToBounds = true;
    registerB.layer.borderWidth=1;
    registerB.layer.borderColor=[UIColor whiteColor].CGColor;
    [registerB setTitle:@"Register" forState:UIControlStateNormal];
    [registerB.titleLabel setTextAlignment: NSTextAlignmentCenter];
    _password.placeholder = @"Password";
    
    
    PFQuery *collegeQuery = [PFQuery queryWithClassName:@"Colleges"];
    [collegeQuery whereKey:@"name" notEqualTo:@"poop"];
    [collegeQuery setLimit:1000];
    [collegeQuery findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if (!error) {
            [PFObject pinAllInBackground:objects];
        }
    }];

    
    
    //FOR PARSE STUFF, I WILL CHECK THE TEXT IN THE USERNAME AND PASSWORD TEXT FIELDS AND IF IT MATCHES SOMETHNG ON PARSE, IT WILL LOGIN.
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewDidAppear:(BOOL)animated{
    PFUser *user = [PFUser currentUser];
    if (user.username !=nil){
        UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *loginvc=[mainstoryboard instantiateViewControllerWithIdentifier:@"tabViewController"];
        [self presentViewController:loginvc animated:NO completion:nil];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonPressed:(id)sender {
    
    
/*
     NSString *enteredUsername;
     enteredUsername = _username.text;
     NSString *enteredPassword;
     enteredPassword = _password.text;
     
     
     NSLog(@" %@", _username.text);
     PFQuery *loginQuery = [PFQuery queryWithClassName:@"User"];
     
     [loginQuery whereKey:@"username" equalTo:_password.text];
     [loginQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError* error){
     if (!error){
     if(objects.count==1)
     {
     UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     
     UIViewController *loginvc=[mainstoryboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
     
     [self presentViewController:loginvc animated:NO completion:nil];
     
     }
     
    }
}
];
     
*/

    
    [PFUser logInWithUsernameInBackground:_username.text password:_password.text block:^(PFUser *user, NSError *error){
        if (!error) {
            NSLog(@"Login User");
            //            [self performSegueWithIdentifier:@"login" sender:self];
            //
            //UIWindow *mywindow = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
            //self.window=mywindow;
            UIStoryboard *mainstoryboard = self.storyboard;
            
            UIViewController *loginvc=[mainstoryboard instantiateViewControllerWithIdentifier:@"tabViewController"];
            
            //CATransition* transition = [CATransition animation];
            //transition.duration = 0.2;
            //transition.type = kCATransitionFade;
            //[self.view.window.layer addAnimation:transition forKey:kCATransition];
            [self presentViewController:loginvc animated:NO completion:nil];
            NSLog(@"Going to next view");

            
        }
        if (error){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops" message:@"Your username or password is incorrect" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];

        }
        [sender resignFirstResponder];
        
    }];
    
    
}

@end



