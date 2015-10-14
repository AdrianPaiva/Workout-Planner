//
//  SecondViewController.h
//  workout
//
//  Created by adrian on 3/28/2015.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRoutineViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UIButton *addRoutine;
@property (weak, nonatomic) IBOutlet UITextField *routineName;
- (IBAction)addRoutine:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;


@end
