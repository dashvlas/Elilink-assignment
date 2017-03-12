//
//  TableViewCellProtocol.h
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 11.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TableViewCellProtocol <NSObject>

@required
+ (NSString *)reuseIdentifier;

@optional
- (void)configureWithItem:(id)item;

@end
