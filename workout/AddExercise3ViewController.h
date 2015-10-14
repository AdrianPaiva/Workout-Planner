//
//  AddExercise3ViewController.h
//  workout
//
//  Created by adrian on 4/3/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddExercise3ViewController : UIViewController

@property (weak, nonatomic) IBOutlet NSManagedObjectContext *context;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) NSDate *date;
@property(nonatomic,strong) NSString *exercise;

@property (weak, nonatomic) IBOutlet UILabel *weightValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsValueLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightStepper;
@property (weak, nonatomic) IBOutlet UIStepper *repsStepper;


- (IBAction)weightStepperAction:(id)sender;
- (IBAction)repsStepperAction:(id)sender;


- (IBAction)clearData:(id)sender;
- (IBAction)saveData:(id)sender;



@end
