//
//  AddExerciseController.h
//  workout
//
//  Created by adrian on 4/3/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routine.h"
@interface AddExerciseController : UITableViewController


@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) Routine *routine;

@end
