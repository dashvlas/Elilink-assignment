//
//  WeatherManager.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import "WeatherManager.h"

@interface WeatherManager ()

@property(nonatomic, strong) OWMWeatherAPI *weatherAPI;

@end

@implementation WeatherManager

#pragma mark - NSObject methods

- (instancetype)init {
    self = [super init];
    if(self) {
        _weatherAPI = [[OWMWeatherAPI alloc] initWithAPIKey:@"eba47effea88b18d5b67eae531209447"];
        [_weatherAPI setTemperatureFormat:kOWMTempCelcius];
    }
    return self;
}

#pragma mark - Interface methods

+ (instancetype)sharedManager {
    static WeatherManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[WeatherManager alloc]init];
    });
    return sharedManager;
}

- (void)getTemperatureFromCity:(City *)city success:(void(^)(double weather))success  error:(void(^)(NSString *error))failure {
    if ([self isUpdatedMoreThanAnHourAgo:city]) {
        [self.weatherAPI currentWeatherByCityName:city.name withCallback:^(NSError *error, NSDictionary *result) {
            if (error) {
                failure(@"Check internet connection");
                return;
            }
            NSNumber *temperature = result[@"main"][@"temp"];
            
            [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
                City *cityInLocalContext = [City MR_findFirstByAttribute:@"name" withValue:city.name inContext:localContext];
                if (temperature != nil) {
                    cityInLocalContext.temperature = [temperature doubleValue];
                    cityInLocalContext.lastWeatherUpdate = [NSDate date];
                    success(cityInLocalContext.temperature);
                }
            } completion:nil];
        }];
    }
}

#pragma mark - Private methods

- (BOOL)isUpdatedMoreThanAnHourAgo:(City *)city {
    return [[NSDate date] timeIntervalSince1970] - [city.lastWeatherUpdate timeIntervalSince1970] > 3600 ? YES : NO;
}

@end

