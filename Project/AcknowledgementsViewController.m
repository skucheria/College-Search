//
//  AcknowledgementsViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/17/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "AcknowledgementsViewController.h"
#import "SettingsViewController.h"

@interface AcknowledgementsViewController ()

@end

@implementation AcknowledgementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"Acknowledgements";
//    [self.view setBackgroundColor:[UIColor colorWithRed:.26 green:.26 blue:.26 alpha:1.0]];
    
    int topOffSet = self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y;
    UILabel *creatorsLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, topOffSet, self.view.frame.size.width-20, 50)];
    [creatorsLabel setText:@"Created by Siddharth Kucheria"];
    [creatorsLabel setTextColor:[UIColor whiteColor]];
    creatorsLabel.numberOfLines = 0;
    [self.view addSubview:creatorsLabel];
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
