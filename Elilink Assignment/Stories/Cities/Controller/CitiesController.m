//
//  CitiesController.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import "CitiesController.h"
#import "CityCell.h"
#import "City+CoreDataClass.h"

typedef NS_ENUM(NSInteger, HeaderViewHeightStatus) {
    HeaderViewHeightDefault,
    HeaderViewHeightExposed
};

@interface CitiesController () <UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) HeaderViewHeightStatus status;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeightDefault;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeightExposed;

@end

@implementation CitiesController

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [City model].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityCell *cityCell = [tableView dequeueReusableCellWithIdentifier:[CityCell reuseIdentifier] forIndexPath:indexPath];
    return cityCell;
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell conformsToProtocol:@protocol(TableViewCellProtocol)]) {
        UITableViewCell <TableViewCellProtocol>*correctCell = (UITableViewCell <TableViewCellProtocol>*)cell;
        [correctCell configureWithItem:[City model][indexPath.row]];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.headerView configureWithItem:[City model][indexPath.row]];
}

#pragma mark - Gestures

- (void)updateConstraints {
    switch (self.status) {
        case HeaderViewHeightDefault:
            self.headerViewHeightDefault.active = NO;
            self.headerViewHeightExposed.active = YES;
            self.status = HeaderViewHeightExposed;
            break;
        case HeaderViewHeightExposed:
            self.headerViewHeightExposed.active = NO;
            self.headerViewHeightDefault.active = YES;
            self.status = HeaderViewHeightDefault;
            break;
    }
}

- (IBAction)showFullHeader:(UITapGestureRecognizer *)sender {
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.2 animations:^{
        [self updateConstraints];
        [self.view layoutIfNeeded];
    }];
}

@end
