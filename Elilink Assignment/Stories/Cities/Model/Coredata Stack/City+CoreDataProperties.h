//
//  City+CoreDataProperties.h
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "City+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *info;
@property (nullable, nonatomic, copy) NSDate *lastWeatherUpdate;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) double temperature;

@end

NS_ASSUME_NONNULL_END
