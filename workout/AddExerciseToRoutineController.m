//
//  AddExerciseToRoutineController.m
//  workout
//
//  Created by adrian on 4/9/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import "AddExerciseToRoutineController.h"
#import "AppDelegate.h"
#import "RoutineExerciseTableViewController.h"

@interface AddExerciseToRoutineController ()

@end

@implementation AddExerciseToRoutineController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)weightAction:(id)sender {
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",_weightValue.value];
}
- (IBAction)repsAction:(id)sender {
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",_repsValue.value];
}

- (IBAction)save:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    Exercise *newExercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:context];
    
    
    NSNumber *weight = [NSNumber numberWithInteger:_weightValue.value];
    NSNumber *reps = [NSNumber numberWithInteger:_repsValue.value];
    NSString * timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] *1000];
    
    newExercise.name = _exercise;
    newExercise.weight = weight;
    newExercise.reps =reps;
    newExercise.time = timestamp;
    
    //add created exercise to routine
    [_routine addHeldByObject:newExercise];
    
    NSError* error = nil;
    [context save:&error];
    
    /*
    
    RoutineExerciseTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"routineExerciseTableViewController"];
    
    controller.routine = _routine;
    [self.navigationController pushViewController:controller animated:YES];
     
    */
    
}

- (IBAction)clear:(id)sender {
    double empty = 1;
    double empty2 = 5;
    _weightValue.value = empty2;
    _repsValue.value = empty;
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",empty2];
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",empty];
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"backToRoutineSegue"])
    {
        RoutineExerciseTableViewController *dest = segue.destinationViewController;
        dest.routine = _routine;
        dest.title = dest.routine.name;
        
        
    }
}
*/

@end
