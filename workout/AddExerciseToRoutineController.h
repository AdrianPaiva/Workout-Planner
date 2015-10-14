//
//  AddExerciseToRoutineController.h
//  workout
//
//  Created by adrian on 4/9/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routine.h"
#import "Exercise.h"

@interface AddExerciseToRoutineController : UIViewController


@property(nonatomic,strong) Routine *routine;
@property(nonatomic,strong) NSString *exercise;
@property (weak, nonatomic) IBOutlet UILabel *weightValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsValueLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightValue;
@property (weak, nonatomic) IBOutlet UIStepper *repsValue;
- (IBAction)weightAction:(id)sender;
//@property (weak, nonatomic) IBOutlet UIStepper *repsAction;
- (IBAction)repsAction:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)clear:(id)sender;

@end
