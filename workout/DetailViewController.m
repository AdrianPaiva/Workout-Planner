//
//  DetailViewController.m
//  workout
//
//  Created by adrian on 4/4/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "CalendarViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    /*
    exercise.name = event.title;
    exercise.date = event.date;
    exercise.reps = [event.info objectForKey:@"reps"];
    exercise.weight = [event.info objectForKey:@"weight"];
    exercise.time = [event.info objectForKey:@"time"];
    */
    
    double weight = [[_exercise.info objectForKey:@"weight"] doubleValue];
    double reps = [[_exercise.info objectForKey:@"reps"] doubleValue];
    
    _weightValue.value = weight;
    _repsValue.value = reps;
    
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",weight];
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",reps];
    
    
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

- (IBAction)editExercise:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    
    for (NSManagedObject *obj in objects) {
        
        if([[obj valueForKey:@"time"] isEqualToString: [_exercise.info objectForKey:@"time"]])
        {
            
            NSNumber *weight = [NSNumber numberWithInteger:_weightValue.value];
            NSNumber *reps = [NSNumber numberWithInteger:_repsValue.value];
            
            [obj setValue: reps forKey:@"reps"];
            [obj setValue: weight forKey:@"weight"];
        }
        
        
    }
    
    [context save:&error];
    
    CalendarViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (IBAction)deleteExercise:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    
    for (NSManagedObject *obj in objects) {
        
        if([[obj valueForKey:@"time"] isEqualToString: [_exercise.info objectForKey:@"time"]])
        {
                [context deleteObject:obj];
        }
        
        
    }
    
    [context save:&error];
    
    CalendarViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    [self.navigationController pushViewController:controller animated:YES];
    
}

- (IBAction)weightStepperAction:(id)sender {
    _weightValueLabel.text = [NSString stringWithFormat:@"%.f",_weightValue.value];
}

- (IBAction)repsStepperAction:(id)sender {
    _repsValueLabel.text = [NSString stringWithFormat:@"%.f",_repsValue.value];
}
@end
