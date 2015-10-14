//
//  AddExercise3ViewController.m
//  workout
//
//  Created by adrian on 4/3/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import "AddExercise3ViewController.h"
#import "AppDelegate.h"
#import "Exercise.h"
#import "AddExerciseController.h"
#import "CalendarViewController.h"

@interface AddExercise3ViewController ()

@end

@implementation AddExercise3ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    _context = [appDelegate managedObjectContext];
    
    /*
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd/yyyy"];
    NSString *result = [df stringFromDate:_date];
    */
    
    //_dateLabel.text = result;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation


- (IBAction)weightStepperAction:(id)sender {
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",_weightStepper.value];
}

- (IBAction)repsStepperAction:(id)sender {
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",_repsStepper.value];
}

- (IBAction)clearData:(id)sender {
    double empty = 1;
    double empty2 = 5;
    _weightStepper.value = empty2;
    _repsStepper.value = empty;
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",empty2];
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",empty];
}

- (IBAction)saveData:(id)sender {
    
    
     // add exercise
     
     //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
     
     //NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
     Exercise *newExercise;
    
     newExercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:self.context];
    
    
    
      NSNumber *weight = [NSNumber numberWithInteger:_weightStepper.value];
      
      NSNumber *reps = [NSNumber numberWithInteger:_repsStepper.value];
    
    /*
     [newExercise setValue: self.title forKey:@"name"];
     [newExercise setValue: _date forKey:@"date"];
     [newExercise setValue: reps forKey:@"reps"];
     [newExercise setValue: weight forKey:@"weight"];
    */
    
    
      NSString * timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] *1000];
      //[newExercise setValue:timestamp forKey:@"time"];
    
    newExercise.name = self.title;
    newExercise.date = _date;
    newExercise.weight = weight;
    newExercise.reps =reps;
    newExercise.time = timestamp;
    
    NSError* error = nil;
    [self.context save:&error];
    
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"backToCalendar"])
    {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CalendarViewController *dest = segue.destinationViewController;
        
        
        
    }}
@end
