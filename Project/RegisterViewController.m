//
//  RegisterViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/9/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>


@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.45 green:0.40 blue:0.74 alpha:1.0];

    //HERE I WILL GET THE TEXT FOR LOGIN AND PASSWORD AND STORE IT IN PARSE.I WILL ALSO STORE THE EMAIL AND FIRST AND LAST NAME. 
    
    // Do any additional setup after loading the view.
}

- (void)registerNewUser{

    PFUser *newUser = [PFUser user];
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (!error){
            NSLog(@"Registration Complete");
            //[self performSegueWithIdentifier:@"login" sender:self];
            
            
            // UIWindow *mywindow = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
                    //CATransition* transition = [CATransition animation];
            //transition.duration = 0.2;
            //transition.type = kCATransitionFade;
            //[self.view.window.layer addAnimation:transition forKey:kCATransition];
        }
    }
     ];
    
    PFObject *userSave = [PFObject objectWithClassName:@"User"];
    [userSave setObject:_nameField.text forKey:@"fullname"];
    
    [newUser saveInBackground];
    
    //self.window=mywindow;
    UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *loginvc=[mainstoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
    

    [self presentViewController:loginvc animated:NO completion:nil];
   
    /*{
        if (error) {
            NSLog(@"error in name save: %@ %@",error,error.userInfo);
        }else{
            NSLog(@"No error in free save");
        }
        
//        [loadingView.loadingIndicator stopAnimating];
//        [loadingView removeFromSuperview];
        
        //check referer, return to previous VC or push to next VC
//        if ([_referer isEqualToString:@"settings"]) {
//            [self.navigationController popViewControllerAnimated:true];
//        }
//        else{
//            UITableViewController *tableViewController = [[FriendViewController alloc] initWithStyle:UITableViewStyleGrouped];
//            UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:tableViewController];
//            [self presentViewController:controller animated:NO completion:nil];
     }];

*/

    

}

- (IBAction)registerButtonPressed:(id)sender {
    NSLog(@"resigster pressed");
    [self registerNewUser];
    
}
@end

