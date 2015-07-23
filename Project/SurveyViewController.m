//
//  SurveyViewController.m
//  Project
//
//  Created by Siddharth Kucheria on 7/11/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "SurveyViewController.h"
#import <Parse/Parse.h>
#import "SettingsViewController.h"

@interface SurveyViewController ()

@property NSArray *surveyArray;
@property NSMutableArray *firstArrayToAddStuffTo;
@property (strong, nonatomic) UIPickerView  *testPicker;
@property NSArray *pickerData;

@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithRed:0.38 green:0.58 blue:0.92 alpha:1.0];
    self.title = @"Survey";
    _firstArrayToAddStuffTo = [NSMutableArray array];
    
    
    // Picker View Stuff
    /*
    
    _pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    self.testPicker.dataSource = self;
    self.testPicker.delegate = self;
    
    
    // The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        return 1;
    }
    
    // The number of rows of data
    - (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
        return _pickerData.count;
    }
    
    // The data to return for the row and component (column) that's being passed in
    - (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {
        return _pickerData[row];
    }
    
    
    
    
    
    */
    
    
    
    
    //Question 1
    UIButton *q1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height/2-200,150, 50)];
    [q1 addTarget:self
               action:@selector(q1Pressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [q1 setTitle:@"Choose..." forState:UIControlStateNormal];
//    [q1 setTitle:@" %@", _firstArrayToAddStuffTo[0] forState:UIControlStateHighlighted];
    [q1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:q1];
    
    //Question 2
    UIButton *q2 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height/2-140,150, 50)];
    [q2 addTarget:self
           action:@selector(q2Pressed:)
 forControlEvents:UIControlEventTouchUpInside];
    [q2 setTitle:@"Choose..." forState:UIControlStateNormal];
    [q2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:q2];
    
    //Question 3
    UIButton *q3 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height/2-80,150, 50)];
    [q3 addTarget:self
           action:@selector(q3Pressed:)
 forControlEvents:UIControlEventTouchUpInside];
    [q3 setTitle:@"Choose..." forState:UIControlStateNormal];
    [q3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:q3];
    
    //Question 4
    /*
    UIButton *q4 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height/2-20,150, 50)];
    [q4 addTarget:self
           action:@selector(q4Pressed:)
 forControlEvents:UIControlEventTouchUpInside];
    [q4 setTitle:@"Choose..." forState:UIControlStateNormal];
    [q4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:q4];
    */
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(handleSaveButton:)];
    saveButton.tintColor = [UIColor greenColor];
    self.navigationItem.rightBarButtonItem = saveButton;

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancelButton:)];
    cancelButton.tintColor = [UIColor colorWithRed:0.88 green:0.40 blue:0.40 alpha:1.0];
    self.navigationItem.leftBarButtonItem = cancelButton;

    
    
    // Do any additional setup after loading the view.
}

- (void)handleSaveButton:(id)sender{
    
    PFUser *currentUser = [PFUser currentUser];
    
    
    
    
//    PFQuery *questionsQuery = [PFQuery queryWithClassName:@"User"];
//    [questionsQuery whereKey:@"surveyAnswers" notEqualTo:foo];
    
    _surveyArray = [NSArray arrayWithArray:_firstArrayToAddStuffTo];
    [currentUser setObject:_surveyArray forKey:@"surveyAnswers"];
    [[PFUser currentUser]saveInBackgroundWithBlock:^(BOOL succeeded, NSError* error){
        if (!error) {
            NSLog(@"Survey Answers Saved!");
        }
    }];
    
//    UITableViewController *settings = [[SettingsViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController popViewControllerAnimated:true];
    
    
}

- (void)handleCancelButton:(id)sender{
    
//    UITableViewController *settings = [[SettingsViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController popViewControllerAnimated:true];
    
    
}

- (void)q1Pressed:(id)sender{
    int i = 0;
     NSString *message = [NSString stringWithFormat:@"School Size?"];
    UIAlertController *locationSelector = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Small" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"small";
        [((UIButton* )sender) setTitle:@"Small School" forState:UIControlStateNormal];
        
    }]];
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Medium" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"medium";
        [((UIButton* )sender) setTitle:@"Medium School" forState:UIControlStateNormal];


    }]];
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Large" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"large";
        [((UIButton* )sender) setTitle:@"Large School" forState:UIControlStateNormal];


    }]];
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:locationSelector animated:true completion:nil];

}

- (void)q2Pressed:(id)sender{
    int i = 1;
    NSString *message = [NSString stringWithFormat:@"Public or Private?"];
    UIAlertController *locationSelector = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Public" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"public";
        [((UIButton* )sender) setTitle:@"Public University" forState:UIControlStateNormal];

    }]];
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Private" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"private";
        [((UIButton* )sender) setTitle:@"Private University" forState:UIControlStateNormal];

    }]];
 
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:locationSelector animated:true completion:nil];
    
}

- (void)q3Pressed:(id)sender{
    int i = 2;
    NSString *message = [NSString stringWithFormat:@"In State or Out of State"];
    UIAlertController *locationSelector = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"In State" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"in";
        [((UIButton* )sender) setTitle:@"In-State University" forState:UIControlStateNormal];


        NSLog(@"Small Chose!");
    }]];
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Out of State" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        _firstArrayToAddStuffTo[i] = @"out";
        [((UIButton* )sender) setTitle:@"Out-of-State University" forState:UIControlStateNormal];


        NSLog(@"Medium Chose!");
    }]];

    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:locationSelector animated:true completion:nil];
    
}
/*
- (void)q4Pressed:(id)sender{
    int i = 3;
    NSString *message = [NSString stringWithFormat:@"Please choose a school size"];
    UIAlertController *locationSelector = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Small" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Small Chose!");
    }]];
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Medium" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Medium Chose!");
    }]];
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Large" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSLog(@"Large Chose!");
    }]];
    
    [locationSelector addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:locationSelector animated:true completion:nil];
    
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
