//
//  FirstViewController.m
//  workout
//
//  Created by adrian on 3/28/2015.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "CalendarViewController.h"
#import "NSCalendarCategories.h"
#import "NSDate+Components.h"
#import "CalendarKit/CalendarKit.h"
#import "AppDelegate.h"
#import "AddExerciseController.h"
#import "DetailViewController.h"
#import "RoutineTableViewController.h"
#import "ScheduleRoutineTableViewController.h"

@interface CalendarViewController ()<CKCalendarViewDelegate, CKCalendarViewDataSource>
@property (nonatomic, strong) NSMutableDictionary *data;
@end

@implementation CalendarViewController
{
    CKCalendarView *calendar;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [[self view]setNeedsDisplay];
    
    
    
    calendar.displayMode = 1;
    
    self.data = [[NSMutableDictionary alloc] init];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    NSMutableArray *calendarObjects = [[NSMutableArray alloc]init];
    
    if (error != nil) {
        
        //Deal with failure
    }
    else {
        // create CKCalendarEvent objects from core data objects for use in Calendar
        for (NSManagedObject *exercise in objects) {
            
            NSString *title = NSLocalizedString([exercise valueForKey:@"name"], @"");
            NSDate *date = [exercise valueForKey:@"date"];
            
            NSNumber *reps = [exercise valueForKey:@"reps"];
            NSNumber *weight = [exercise valueForKey:@"weight"];
            
            
            NSString *time = [exercise valueForKey:@"time"];
            
            NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:reps, @"reps",weight, @"weight",time,@"time", nil];
            
            // only add scheduled exercises
            if(date != nil)
            {
                CKCalendarEvent *event = [CKCalendarEvent eventWithTitle:title andDate:date andInfo:info];
                
                [calendarObjects addObject: event];
            }
            
            
        }
        // group calendar objects so that events relate to date keys
        for(CKCalendarEvent *event in calendarObjects)
        {
            
            NSDate *date = event.date;
            NSMutableSet *exercises = [_data objectForKey:date];
            
            if (!exercises) {
                
                exercises = [[NSMutableSet alloc]init];
                
                [exercises addObject:event];
                
                NSMutableArray *movedExercises = [NSMutableArray arrayWithArray:[exercises allObjects]];
                [self.data setObject:movedExercises forKey:date];
                
            }
            
            [exercises addObject:event];
            
        }
    }
    
}
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 1. Instantiate a CKCalendarView
    calendar = [CKCalendarView new];
    
    // 2. set up the datasource and delegates
    [calendar setDelegate:self];
    [calendar setDataSource:self];
    
    // 3. Present the calendar
    [[self view] addSubview:calendar];
    calendar.displayMode = 1;    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showCategories"]) {
        
        AddExerciseController *destViewController = segue.destinationViewController;
        destViewController.date = calendar.date;
        destViewController.title = @"Categories";
    }
    else if ([segue.identifier isEqualToString:@"scheduleRoutine"]) {
        
        ScheduleRoutineTableViewController *destViewController = segue.destinationViewController;
        destViewController.title = @"Schedule Routine";
        destViewController.date = calendar.date;
    }
    
}

#pragma mark - CKCalendarViewDataSource

- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date
{
    return [self data][date];
}

#pragma mark - CKCalendarViewDelegate

// Called before/after the selected date changes
- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date
{
    
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date
{
    
}

//  A row is selected in the events table. (Use to push a detail view or whatever.)
- (void)calendarView:(CKCalendarView *)CalendarView didSelectEvent:(CKCalendarEvent *)event
{
    DetailViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    
    
    controller.title = event.title;
    
    controller.exercise = event;
    
    [self.navigationController pushViewController:controller animated:YES];
    
}
- (IBAction)unwindToCalendar:(UIStoryboardSegue *)segue {
    
}

@end
