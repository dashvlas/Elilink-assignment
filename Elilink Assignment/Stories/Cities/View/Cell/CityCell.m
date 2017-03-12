//
//  CityTableCell.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import "CityCell.h"
#import "City+CoreDataClass.h"

@implementation CityCell

#pragma mark - Protocol methods

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)configureWithItem:(id)item {
    City *city = item;
    self.cityLabel.text = [NSString stringWithFormat:@"%@",city.name];
}

@end
