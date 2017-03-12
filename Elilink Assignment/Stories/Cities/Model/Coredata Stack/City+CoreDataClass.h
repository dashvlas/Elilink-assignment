//
//  City+CoreDataClass.h
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSManagedObject

+ (NSArray *)model;
+ (void)createEntityFromDictionary:(NSDictionary *)dictionary InContext:(NSManagedObjectContext *)localContex;

@end

NS_ASSUME_NONNULL_END

#import "City+CoreDataProperties.h"
