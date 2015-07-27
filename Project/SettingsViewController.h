//
//  SettingsViewController.h
//  Project
//
//  Created by Siddharth Kucheria on 7/17/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"


@interface SettingsViewController : UITableViewController
<RNFrostedSidebarDelegate>

- (IBAction)onBurger:(id)sender;
@end
