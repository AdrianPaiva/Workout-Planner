//
//  DetailViewController.h
//  workout
//
//  Created by adrian on 4/4/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "NSCalendarCategories.h"
#import "NSDate+Components.h"
#import "CalendarKit/CalendarKit.h"

@interface DetailViewController : UIViewController

@property(nonatomic,strong) CKCalendarEvent *exercise;
@property (weak, nonatomic) IBOutlet UILabel *weightValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsValueLabel;

@property (weak, nonatomic) IBOutlet UIStepper *weightValue;
@property (weak, nonatomic) IBOutlet UIStepper *repsValue;
- (IBAction)editExercise:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteExercise;
- (IBAction)deleteExercise:(id)sender;
- (IBAction)weightStepperAction:(id)sender;
- (IBAction)repsStepperAction:(id)sender;
@end
