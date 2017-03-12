//
//  WeatherManager.h
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWMWeatherAPI.h"
#import "City+CoreDataClass.h"

@interface WeatherManager : NSObject

+ (instancetype)sharedManager;

- (void)getTemperatureFromCity:(City *)city success:(void(^)(double weather))success error:(void(^)(NSString *error))failure;

@end
