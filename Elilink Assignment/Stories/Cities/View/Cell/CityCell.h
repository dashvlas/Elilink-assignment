//
//  CityCell.h
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellProtocol.h"

@interface CityCell : UITableViewCell <TableViewCellProtocol>

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end
