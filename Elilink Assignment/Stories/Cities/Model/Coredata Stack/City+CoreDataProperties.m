//
//  City+CoreDataProperties.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "City+CoreDataProperties.h"

@implementation City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"City"];
}

@dynamic code;
@dynamic info;
@dynamic lastWeatherUpdate;
@dynamic name;
@dynamic temperature;

@end
