//
//  ProfileViewController.h
//  Project
//
//  Created by Siddharth Kucheria on 7/20/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"


@interface ProfileViewController : UIViewController
<RNFrostedSidebarDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *profileView;
- (IBAction)onBurger:(id)sender;

@end
