//
//  HeaderView.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import "HeaderView.h"
#import "City+CoreDataClass.h"

@implementation HeaderView

#pragma mark - Interface methods

- (void)configureWithItem:(id)item {
    City *city = item;
    self.cityLabel.text = city.name;
    self.countryCodeLabel.text = city.code;
    self.cityDescriptionLabel.text = city.info;
    __weak __typeof(self) wself = self;
    if(city.lastWeatherUpdate) {
        self.temperatureLabel.text = [NSString stringWithFormat: @"%.f C",city.temperature];
    } else {
        self.temperatureLabel.text = [NSString stringWithFormat: @"Updating ... "];
        [[WeatherManager sharedManager]getTemperatureFromCity:city
          success:^(double weather) {
              dispatch_async(dispatch_get_main_queue(), ^{
                  [UIView animateWithDuration:0.4 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
                      wself.temperatureLabel.text = [NSString stringWithFormat:@"%.f C", weather];
                  } completion:nil];
              });
        } error:^(NSString *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                wself.temperatureLabel.text = error;
            });
        }];
    }
}

@end
