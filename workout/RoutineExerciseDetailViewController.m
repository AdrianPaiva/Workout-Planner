//
//  RoutineExerciseDetailViewController.m
//  workout
//
//  Created by adrian on 4/9/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import "RoutineExerciseDetailViewController.h"
#import "AppDelegate.h"

@interface RoutineExerciseDetailViewController ()

@end

@implementation RoutineExerciseDetailViewController
{
    AppDelegate *appDelegate ;
    NSManagedObjectContext *context;
}

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
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    double weight = [_exercise.weight doubleValue];
    double reps = [_exercise.reps doubleValue];
    
    _weightValue.value = weight;
    _repsValue.value = reps;
    
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",weight];
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",reps];}

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
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",_weightValue.value];}

- (IBAction)repsAction:(id)sender {
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",_repsValue.value];}

- (IBAction)edit:(id)sender {
    
    //create new exercise
    Exercise *newExercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise"inManagedObjectContext:self->context];
    NSNumber *weight = [NSNumber numberWithInteger:_weightValue.value];
    NSNumber *reps = [NSNumber numberWithInteger:_repsValue.value];
    NSString * timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] *1000];
    
    newExercise.name = _exercise.name;
    newExercise.reps = reps;
    newExercise.weight = weight;
    newExercise.time = timestamp;
    
    //remove old exercise from routine
    [_routine removeHeldByObject:_exercise];
    
    //add new exercise
    [_routine addHeldByObject:newExercise];

    NSError *error = nil;
    [self->context save:&error];
    
}

- (IBAction)delete:(id)sender {
    
    
    [_routine removeHeldByObject:_exercise];
    NSError *error = nil;
    [self->context save:&error];
}
@end
