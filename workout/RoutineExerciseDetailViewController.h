//
//  RoutineExerciseDetailViewController.h
//  workout
//
//  Created by adrian on 4/9/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routine.h"
#import "Exercise.h"

@interface RoutineExerciseDetailViewController : UIViewController

@property (nonatomic, strong) Exercise *exercise;
@property (nonatomic, strong) Routine *routine;
@property (weak, nonatomic) IBOutlet UILabel *weightValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsValueLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightValue;
@property (weak, nonatomic) IBOutlet UIStepper *repsValue;
- (IBAction)weightAction:(id)sender;
- (IBAction)repsAction:(id)sender;
- (IBAction)edit:(id)sender;
- (IBAction)delete:(id)sender;


@end
