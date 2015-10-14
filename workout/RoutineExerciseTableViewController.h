//
//  RoutineExerciseTableViewController.h
//  workout
//
//  Created by adrian on 4/5/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routine.h"

@interface RoutineExerciseTableViewController : UITableViewController

@property(nonatomic,strong) Routine *routine;
- (IBAction)addExerciseAction:(id)sender;
- (IBAction)deleteRoutineAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addBarButtontem;
@property (weak, nonatomic) IBOutlet UIButton *deleteBarButtontem;
@end
