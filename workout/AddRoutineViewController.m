//
//  SecondViewController.m
//  workout
//
//  Created by adrian on 3/28/2015.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//
#import "AppDelegate.h"
#import "AddRoutineViewController.h"
#import "Routine.h"
#import "Exercise.h"
#import "RoutineTableViewController.h"

@interface AddRoutineViewController ()

@end

@implementation AddRoutineViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

// close keyboard on background press
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_routineName isFirstResponder] && [touch view] != _routineName) {
        [_routineName resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addRoutine:(id)sender {
    
    if([_routineName.text length] != 0)
    {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        //NSEntityDescription *entityRoutine = [NSEntityDescription entityForName:@"Routine" inManagedObjectContext:context];
        //Routine *newRoutine = [[Routine alloc] initWithEntity:entityRoutine insertIntoManagedObjectContext:context ];
        
        Routine *newRoutine = [NSEntityDescription insertNewObjectForEntityForName:@"Routine" inManagedObjectContext:context];
        
        newRoutine.name = _routineName.text;
        
        NSError* error = nil;
        [context save:&error];
    }
    else
    {
        
        _errorLabel.text = @"Please enter a name!";
    }
    
    
    
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"backToRoutines"])
    {
        RoutineTableViewController *dest = segue.destinationViewController;

    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([_routineName.text length] != 0)
    {
        return YES;
    }
    return NO;
    
}


@end
