//
//  ListTableViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/13/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "ListTableViewController.h"
#import "CollegeProfileViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "Global.h"
#import "OptionsViewController.h"




@interface ListTableViewController ()

@property double gpa;

@property NSUInteger numSchools;

@property NSArray* allSchools;

@property NSString *test;

@property NSMutableArray *fistArray;

@property NSArray *optionColleges;

@property NSArray *collegesObjects;
@property NSMutableArray *tierMutableArray;
@property NSArray *tier1Final;

@property LoadingIndicatorView *loadingView;
@property int finishedLoadingCount;


@end

@implementation ListTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    _finishedLoadingCount = 0;
    
    [self setNeedsStatusBarAppearanceUpdate];
/*
    PFQuery *collegeFromLocal = [PFQuery queryWithClassName:@"Colleges"];
    [collegeFromLocal setLimit:1000];
    [collegeFromLocal findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if (!error) {
            
            [PFObject pinAllInBackground:objects];
        }
    }];
    */
    /*
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    addButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = infoButtonItem;
     */
//    self.view.backgroundColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.title = @"Colleges";
    
    _allSchools = [[NSArray array] init];
    _fistArray = [[NSMutableArray array] init];
    _optionColleges = [[NSArray array] init];
    _tierMutableArray = [[NSMutableArray array] init];
    _tier1Final = [[NSArray array] init];

    _loadingView = [[LoadingIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 75, 75)];
    [_loadingView setCenter:self.navigationController.view.center];
    [_loadingView.loadingIndicator startAnimating];
    [self.view addSubview:_loadingView];
    
    // This is for both querying local datastore and pulling from online everytime. 
    PFQuery *collegeFromLocal = [PFQuery queryWithClassName:@"Colleges"];
    [collegeFromLocal orderByAscending:@"tier"];
    [collegeFromLocal orderByAscending:@"name"];

    [collegeFromLocal setLimit:1000];
    [collegeFromLocal findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if (!error) {
            for(int i=0; i<objects.count; ++i){
                _collegesObjects = [objects copy];
                NSString *collegeName;
                collegeName = [objects[i] objectForKey:@"name"];
                [_fistArray addObject:collegeName];
                
            }
            for(int i=0; i<objects.count; ++i){
                NSNumber *tierNumber;
                tierNumber = [objects[i] objectForKey:@"tier"];
//                NSLog(@" %@", tierNumber);
                if([tierNumber intValue] == 1){
                    [_tierMutableArray addObject:objects[i]];
                }
            }
            _tier1Final = [_tierMutableArray copy];
            _allSchools = [_fistArray copy];
            

            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            [_loadingView.loadingIndicator stopAnimating];
            [_loadingView removeFromSuperview];
            
        }
        else{
            NSLog(@"Error in periodsQuery: %@ %@",error,error.userInfo);
        }
    }
     ];

    /*
    PFQuery *queryFromLocal = [PFQuery queryWithClassName:@"Colleges"];
    [queryFromLocal setLimit:1000];
//    [queryFromLocal fromLocalDatastore];
    [queryFromLocal orderByAscending:@"name"];
    [queryFromLocal findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        
        if (!error) {
            for(int i=0; i<objects.count; ++i){
                _collegesObjects = [objects copy];
                NSLog(@" %@", _collegesObjects);
                NSString *collegeName;
                collegeName = [objects[i] objectForKey:@"name"];
                [_fistArray addObject:collegeName];
                          }
            //            NSLog(@" %@", _fistArray);
            
            _allSchools = [_fistArray copy];
            //            NSLog(@" %@", _allSchools);
            
            
            
            //              _gpa = [[[objects firstObject]objectForKey:@"gpa"]doubleValue];
            //            NSLog(@" %f", _gpa);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            [_loadingView.loadingIndicator stopAnimating];
            [_loadingView removeFromSuperview];
        }
        else{
            NSLog(@"Error in periodsQuery: %@ %@",error,error.userInfo);
        }
    }];
     */

    
    NSLog(@" %@", _tier1Final);
    NSLog(@" %@", _tierMutableArray);
    
    self.view.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)onOptions:(id)sender{
    
    _optionColleges = [_allSchools copy];
    
    UITableViewController *options = [[OptionsViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:options animated:YES];
    
    
}


    
- (void)addItem:(id)sender{
    
    NSLog(@"Add Pressed");
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return _tier1Final.count;

    }
    else if(section == 1){
        return _allSchools.count;
        
    }
    else{
        return _allSchools.count;
        
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0 ){
        return @"Tier 1";
    }
    else if(section==1){
        return @"Tier 2";
    }
    
    else {
        return @"Tier 3";
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
   UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//

    [Global sharedManager].someProperty = cell.textLabel.text;
    NSLog(@" %@", [Global sharedManager].someProperty);
    UIViewController *collegeProfile =[[CollegeProfileViewController alloc] init];
    [self.navigationController pushViewController:collegeProfile animated:true];
    
    
    NSLog(@"Pressed a College");

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"name"];
    }
//    NSLog(@" %@", _tier1Final);

    cell.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    NSString *name = [_allSchools objectAtIndex:indexPath.row];
//    cell.textLabel.text = name;
//
    if(indexPath.section == 0){
//        NSNumber * tier = [[_collegesObjects objectAtIndex:176]objectForKey:@"tier"];
//        NSLog(@" TIER NUMBER %@", tier);
//        if([tier intValue] == 1){
//            NSString *name = [_tier1Mutable objectAtIndex:indexPath.row];
//           cell.textLabel.text = name;
        
//        }
//        }
//        else{
//            NSLog(@"Not Tier 1!");
    
        
       NSString *name = [[_tierMutableArray objectAtIndex:indexPath.row]objectForKey:@"name"];
        cell.textLabel.text = name;
    }
    
    else if(indexPath.section == 1){
        NSString *name = [_allSchools objectAtIndex:indexPath.row];
        cell.textLabel.text = name;
    }
    
    else if(indexPath.section == 2){
        NSString *name = [_allSchools objectAtIndex:indexPath.row];
        cell.textLabel.text = name;
    }
    
//    name=[[array objectAtIndex:indexPath.row]objectForKey:@"fullname"];


    return cell;
}


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

@end
