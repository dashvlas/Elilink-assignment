//
//  CitiesController.h
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@interface CitiesController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *citiesTableView;
@property (weak, nonatomic) IBOutlet HeaderView *headerView;

@end
