//
//  RoutineExerciseTableViewController.m
//  workout
//
//  Created by adrian on 4/5/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import "RoutineExerciseTableViewController.h"
#import "Exercise.h"
#import "AppDelegate.h"
#import "RoutineTableViewController.h"
#import "AddExerciseController.h"
#import "RoutineExerciseDetailViewController.h"

@interface RoutineExerciseTableViewController ()

@end

@implementation RoutineExerciseTableViewController

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
    UIImage *buttonImage = [UIImage imageNamed:@"add_image_filled-50"];
    UIBarButtonItem *deleteBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteRoutineAction:)];
    
    UIBarButtonItem *addBarButtonItem = [[UIBarButtonItem alloc] initWithImage:buttonImage style:UIBarButtonItemStylePlain target:self action:@selector(addExerciseAction:)];
    
    


    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:deleteBarButtonItem, addBarButtonItem, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addExerciseAction:(id)sender
{
    AddExerciseController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"addExerciseToRoutine"];
    controller.routine = _routine;
    [self.navigationController pushViewController:controller animated:YES];
    
}
- (IBAction)deleteRoutineAction:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    [context deleteObject:_routine];
    
    NSError* error = nil;
    [context save:&error];
    
    //RoutineTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"RoutineTableViewController"];
    //[self.navigationController pushViewController:controller animated:YES];
    
    [self performSegueWithIdentifier:@"unwindToContainerVC" sender:self];
    
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
    return [[_routine.heldBy allObjects] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleIdentifier = @"exerciseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleIdentifier];
        
    }
    // get all exercises in routine
    NSArray *all = [_routine.heldBy allObjects];
    
    Exercise *temp = [all objectAtIndex:indexPath.row];
    cell.textLabel.text = temp.name;
    
    
    NSString *weightString = [temp.weight stringValue];
    NSString *repsString = [temp.reps stringValue];
    
    NSString *final = [NSString stringWithFormat:@"%@%@%@%@%@", @"Weight: ", weightString,@"      ", @"Reps: ", repsString];
    [[cell detailTextLabel] setText:final];
    cell.detailTextLabel.text = final;
    
    return cell;
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"routineExerciseDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RoutineExerciseDetailViewController *dest = segue.destinationViewController;
        
        NSArray *all = [_routine.heldBy allObjects];
        dest.routine = _routine;
        dest.exercise = [all objectAtIndex:indexPath.row];
        dest.title = dest.exercise.name;
        
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
