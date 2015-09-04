//
//  SettingsViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/17/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "SettingsViewController.h"
#import "AcknowledgementsViewController.h"
#import "SurveyViewController.h"
#import "RNFrostedSidebar.h"
#import <Parse/Parse.h>
@interface SettingsViewController ()

@property (nonatomic, strong) NSMutableIndexSet *optionIndices;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];

    self.title = @"Settings";
    self.view.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0];

    
    self.tableView.alwaysBounceVertical = false;

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 2;
        
    }
    else if(section == 1){
        return 1;
    }
    else{
        return 1;
        
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0 ){
        return @"My Account";
    }
    else if(section==1){
        return @"Other";
    }
    
    else {
        return @"Logout";
    }
    
    
}

/*
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    if (section == 0){
        [headerView setBackgroundColor:[UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0]];
    }
    else{
        [headerView setBackgroundColor:[UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0]];
}
    return headerView;

    
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"setting"];
    }
    cell.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0];
    cell.textLabel.textColor = [UIColor blackColor];
    if(indexPath.section==0){
    if (indexPath.row==0){
        cell.textLabel.textColor = [UIColor blackColor];

        cell.textLabel.text = @"Survey";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    else if (indexPath.row==1){
        cell.textLabel.textColor = [UIColor blackColor];
        
        cell.textLabel.text = @"Email and Password";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    }
    
    if(indexPath.section ==1){
        
        if(indexPath.row==0){
            cell.textLabel.textColor = [UIColor blackColor];

            cell.textLabel.text = @"About";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    if(indexPath.section==2){
        
    
     if(indexPath.row==0){
        cell.textLabel.textColor = [UIColor blackColor];

        cell.textLabel.text = @"Logout";
        cell.textLabel.textColor = [UIColor colorWithRed:0.88 green:0.40 blue:0.40 alpha:1.0];
    }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section==0){
    if (indexPath.row==0) {
        UIViewController *surveyController = [[SurveyViewController alloc] init];
        [self.navigationController pushViewController:surveyController animated:true];
        
        //edit free periods
//        FreeSelectionViewController *freeSelection = [[FreeSelectionViewController alloc]init];
//        [freeSelection setReferer:@"settings"];
//        [self.navigationController pushViewController:freeSelection animated:true];
        /*PeriodSelectionViewController *periodsController = [[PeriodSelectionViewController alloc] initWithStyle:UITableViewStylePlain];
         [periodsController setReferer:@"settings"];
         [self.navigationController pushViewController:periodsController animated:YES];*/
        
        
        NSLog(@"Survey is pressed");
        
    }
    else if(indexPath.row==1){
        //change campus
//        UITableViewController *campusController = [[CampusSelectionViewController alloc] initWithStyle:UITableViewStylePlain];
//        [self.navigationController pushViewController:campusController animated:true];
//        NSLog(@"Select Campus pressed");
    }
    }
    else if(indexPath.section==1){
     if (indexPath.row==0){
        //Acknowledgements
       UIViewController *ackController = [[AcknowledgementsViewController alloc]init];
       [self.navigationController pushViewController:ackController animated:true];
        NSLog(@"Acknowledgments button pressed");
        
    }
    }
    else{

    
     if(indexPath.row==0){
        //logout of facebook
//        PFUser *current = [PFUser currentUser];
//        NSString *username =
        NSString *logoutString = [NSString stringWithFormat:@"You are logged in as %@.\nAre you sure you want to logout?",[PFUser currentUser][@"username"]];
        UIAlertController *logoutAlert = [UIAlertController alertControllerWithTitle:nil message:logoutString preferredStyle:UIAlertControllerStyleActionSheet];
        [logoutAlert addAction:[UIAlertAction actionWithTitle:@"Logout" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
            [PFUser logOut];
            UIStoryboard *mainstoryboard = self.storyboard;
            
            UIViewController *loginvc=[mainstoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
//            navController.navigationBarHidden = true;
            [self presentViewController:loginvc animated:NO completion:nil];
            NSLog(@"LOGGED OUT!");
        }]];
        [logoutAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            NSLog(@"Cancel action selected");
        }]];
        [self presentViewController:logoutAlert animated:true completion:nil];
        
        
        

       
        
        //CATransition* transition = [CATransition animation];
        //transition.duration = 0.2;
        //transition.type = kCATransitionFade;
        //[self.view.window.layer addAnimation:transition forKey:kCATransition];
        

        
        NSLog(@"Logout pressed");
        
//        NSLog(@" %@", [PFUser currentUser]);
    
        
        
    }
    }
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
- (IBAction)onBurger:(id)sender {
    
    NSLog(@"burger pressed");
    NSArray *images = @[
                        [UIImage imageNamed:@"graduation-cap2.png"],
                        [UIImage imageNamed:@"profile@2x.png"],
                        [UIImage imageNamed:@"gear@2x.png"],
                        [UIImage imageNamed:@"11759428_993383067362045_1836886512_n.png"],
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
    //    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
    //    callout.showFromRight = YES;
    [callout show];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %lu",(unsigned long)index);
    if (index == 3) {
        [sidebar dismissAnimated:YES completion:nil];
    }
    if (index == 0) {
        [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            if(finished){
        UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *main=[mainstoryboard instantiateViewControllerWithIdentifier:@"main"];
        
        [self presentViewController:main animated:NO completion:nil];
        
            }
        }];
    }
    if(index==1){
        
        [sidebar dismissAnimated:YES completion:^(BOOL finished) {
            if(finished){
        UIStoryboard *mainstoryboard = self.storyboard;
        
        UIViewController *settings=[mainstoryboard instantiateViewControllerWithIdentifier:@"Profile"];
        
        [self presentViewController:settings animated:NO completion:nil];
        
            }
        }];
    }
    if (index == 2) {
        
        [sidebar dismissAnimated:YES completion:nil];
        
//        UIStoryboard *mainstoryboard = self.storyboard;
        
//        UIViewController *settings=[mainstoryboard instantiateViewControllerWithIdentifier:@"Settings"];
        
//        [self presentViewController:settings animated:NO completion:nil];
    }
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
    }
    else {
        [self.optionIndices removeIndex:index];
    }
}
 *?

*/

    
    
    @end
