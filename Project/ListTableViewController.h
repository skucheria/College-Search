//
//  ListTableViewController.h
//  Project
//
//  Created by Siddharth Kucheria on 7/13/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LoadingIndicatorView.h"



@interface ListTableViewController : UITableViewController  <UITableViewDelegate, UITableViewDataSource>
- (IBAction)onOptions:(id)sender;
- (IBAction)onReload:(id)sender;


@end
