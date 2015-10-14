//
//  Routine.h
//  workout
//
//  Created by adrian on 4/5/2015.
//  Copyright (c) 2015 adrian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Routine : NSManagedObject

@property (nonatomic, retain) NSString * name; // Routine Name
@property (nonatomic, retain) NSSet *heldBy; // exercises in routine
@end

@interface Routine (CoreDataGeneratedAccessors)

- (void)addHeldByObject:(NSManagedObject *)value; // add exercise to routine
- (void)removeHeldByObject:(NSManagedObject *)value; // remove exercise from routine
- (void)addHeldBy:(NSSet *)values; // add multiple exercises to routine
- (void)removeHeldBy:(NSSet *)values; // remove multiple exercises from routine

@end
