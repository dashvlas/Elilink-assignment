//
//  City+CoreDataClass.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "City+CoreDataClass.h"

@implementation City

+ (NSArray *)model {
    return [City MR_findAllSortedBy:@"name" ascending:YES];
}

+ (void)createEntityFromDictionary:(NSDictionary *)dictionary InContext:(NSManagedObjectContext *)localContext {
    City *city = [City MR_createEntityInContext:localContext];
    city.name = dictionary[@"name"];
    city.code = dictionary[@"code"];
    city.info = dictionary[@"description"];
}

@end
