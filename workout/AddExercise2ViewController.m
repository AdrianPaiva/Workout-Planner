//
//  AddExercise2ViewController.m
//  workout
//
//  Created by adrian on 4/3/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import "AddExercise2ViewController.h"
#import "AddExercise3ViewController.h"
#import "AddExerciseToRoutineController.h"

@interface AddExercise2ViewController ()

@end

@implementation AddExercise2ViewController
{
    NSArray *shoulders;
    NSArray *triceps;
    NSArray *biceps;
    NSArray *chest;
    NSArray *back;
    NSArray *legs;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    shoulders = [NSArray arrayWithObjects:@"Arnold Dumbbell Press",@"Cable Face Pull", nil];
    triceps = [NSArray arrayWithObjects:@"Cable Overhead Triceps Extension",@"Barbell Bench Press", nil];
    biceps = [NSArray arrayWithObjects:@"Barbell Curl",@"Cable Curl", nil];
    chest = [NSArray arrayWithObjects:@"Cable Crossover",@"Decline Barbell Bench Press", nil];
    back = [NSArray arrayWithObjects:@"Barbell Row",@"Deadlift", nil];
    legs = [NSArray arrayWithObjects:@"Barbell Squat",@"Leg Press", nil];
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    
    if([_category isEqualToString:@"Shoulders"])
    {
        return [shoulders count];
    }
    else if([_category isEqualToString:@"Triceps"])
    {
        return [triceps count];
    }
    else if([_category isEqualToString:@"Biceps"])
    {
        return [biceps count];
    }
    else if([_category isEqualToString:@"Chest"])
    {
        return [chest count];
    }
    else if([_category isEqualToString:@"Back"])
    {
        return [back count];
    }
    else if([_category isEqualToString:@"Legs"])
    {
        return [legs count];
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleIdentifier = @"exerciseCell2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
        
    }
    if([_category isEqualToString:@"Shoulders"])
    {
        cell.textLabel.text = [shoulders objectAtIndex:indexPath.row];
    }
    else if([_category isEqualToString:@"Triceps"])
    {
        cell.textLabel.text = [triceps objectAtIndex:indexPath.row];
    }
    else if([_category isEqualToString:@"Biceps"])
    {
        cell.textLabel.text = [biceps objectAtIndex:indexPath.row];
    }
    else if([_category isEqualToString:@"Chest"])
    {
        cell.textLabel.text = [chest objectAtIndex:indexPath.row];
    }
    else if([_category isEqualToString:@"Back"])
    {
        cell.textLabel.text = [back objectAtIndex:indexPath.row];
    }
    else if([_category isEqualToString:@"Legs"])
    {
        cell.textLabel.text = [legs objectAtIndex:indexPath.row];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"addExerciseFinal"])
    {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AddExercise3ViewController *dest = segue.destinationViewController;
        
        dest.date = _date;
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        if([_category isEqualToString:@"Shoulders"])
        {
            dest.exercise = [shoulders objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Triceps"])
        {
            dest.exercise = [triceps objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Biceps"])
        {
            dest.exercise = [biceps objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Chest"])
        {
            dest.exercise = [chest objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Back"])
        {
            dest.exercise = [back objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Legs"])
        {
            dest.exercise = [legs objectAtIndex:indexPath.row];
        }
        
    
        dest.title = dest.exercise;
        
    }
    
    if([segue.identifier isEqualToString:@"routineExerciseSegue"])
    {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AddExerciseToRoutineController *dest = segue.destinationViewController;
        
        
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        if([_category isEqualToString:@"Shoulders"])
        {
            dest.exercise = [shoulders objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Triceps"])
        {
            dest.exercise = [triceps objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Biceps"])
        {
            dest.exercise = [biceps objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Chest"])
        {
            dest.exercise = [chest objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Back"])
        {
            dest.exercise = [back objectAtIndex:indexPath.row];
        }
        else if([_category isEqualToString:@"Legs"])
        {
            dest.exercise = [legs objectAtIndex:indexPath.row];
        }
        
        
        dest.title = dest.exercise;
        dest.routine = _routine;
        
        
    }
}




@end
