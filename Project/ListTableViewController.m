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

@end

@implementation ListTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
    addButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = infoButtonItem;
     */
    
    self.view.backgroundColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.title = @"Colleges";
    
    _allSchools = [[NSArray array] init];
    _fistArray = [[NSMutableArray array] init];
    _optionColleges = [[NSArray array] init];
    
    
    PFQuery *collegeFromLocal = [PFQuery queryWithClassName:@"Colleges"];
//    [collegeFromLocal fromLocalDatastore];
//    collegeFromLocal  whereKey:@"name" notEqualTo:@"poop"];
    [collegeFromLocal whereKey:@"name" notEqualTo:@"poop"];
    [collegeFromLocal setLimit:1000];
    [collegeFromLocal findObjectsInBackgroundWithBlock:^(NSArray* objects, NSError* error) {
        if (!error) {
            for(int i=0; i<objects.count; ++i){
                NSString *collegeName;
                collegeName = [objects[i] objectForKey:@"name"];
                [_fistArray addObject:collegeName];
//                _test = [_fistArray objectAtIndex:i];
//                NSLog(@" %@", _test);
            }
//            NSLog(@" %@", _fistArray);
            
            _allSchools = [_fistArray copy];
//            NSLog(@" %@", _allSchools);
            

            
//              _gpa = [[[objects firstObject]objectForKey:@"gpa"]doubleValue];
//            NSLog(@" %f", _gpa);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        }
        else{
            NSLog(@"Error in periodsQuery: %@ %@",error,error.userInfo);
        }
    }
     ];
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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allSchools.count;
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
    
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *name = [_allSchools objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    


    

    
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
