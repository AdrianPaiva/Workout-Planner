//
//  Exercise.h
//  workout
//
//  Created by adrian on 4/5/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Routine;

@interface Exercise : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) Routine *inRoutine; // routine that exercise belongs to

@end
