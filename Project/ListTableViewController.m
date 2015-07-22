//
//  ListTableViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/13/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "ListTableViewController.h"
#import <Parse/Parse.h>

@interface ListTableViewController ()

@property double gpa;

@property NSUInteger numSchools;

@property NSArray* allSchools;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *collegeQuery = [PFQuery queryWithClassName:@"Colleges"];
    [collegeQuery whereKey:@"name" notEqualTo:@"poop"];
    [collegeQuery setLimit:1000];
    [collegeQuery findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if (!error) {
            _numSchools = objects.count;
             _allSchools = [NSArray arrayWithObjects:objects, nil];
            NSLog(@" %@", _allSchools);
            

            
//              _gpa = [[[objects firstObject]objectForKey:@"gpa"]doubleValue];
//            NSLog(@" %f", _gpa);
            
        }
        else{
            NSLog(@"Error in periodsQuery: %@ %@",error,error.userInfo);
        }
    }
     ];
}


    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 32;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
  
    
    NSLog(@"Pressed a College");
    
    /*
    NSDictionary *friend = [self.userFriends objectAtIndex:indexPath.row];
    FriendPeriodViewController *periodsList = [[FriendPeriodViewController alloc] init];
    [periodsList setLoggedInFreesArray:self.freesArray];
    [periodsList setActiveFriend:friend];
    [periodsList setDayOfCycle:self.dayOfCycleUS];
    NSLog(@"in didSelect dayOfCycleUS = %d",self.dayOfCycleUS);
    [self.navigationController pushViewController:periodsList animated:(YES)];
    
    */
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name" forIndexPath:indexPath];
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name"];
    
    
    NSString *college = [self.allSchools objectAtIndex:indexPath.row];
    cell.textLabel.text = college;
    

    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"name"];
//    }
    
    
    
    cell.backgroundColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];

    
    // Configure the cell...
    
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
