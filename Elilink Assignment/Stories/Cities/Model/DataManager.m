//
//  DataManager.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import "DataManager.h"
#import "City+CoreDataClass.h"

static NSString * const kEntitiesCreated = @"";

@implementation DataManager

#pragma mark - Interface methods

+ (instancetype)sharedManager {
    static DataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[DataManager alloc]init];
    });
    return sharedManager;
}

- (void)setDatabase {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kEntitiesCreated]) {
        NSDictionary *citiesDict = [[DataManager sharedManager]parseJsonFromFile:@"Cities.json"];
        NSArray *citiesArray = [citiesDict objectForKey:@"cities"];
    
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext * _Nonnull localContext) {
            for (NSDictionary *dictionary in citiesArray) {
                [City createEntityFromDictionary:dictionary InContext:localContext];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kEntitiesCreated];
            }
        }];
    }
}

#pragma mark - Private methods

- (NSDictionary *)parseJsonFromFile:(NSString *)file {
    NSString *fileLocation = [[NSBundle mainBundle] pathForResource:[file stringByDeletingPathExtension] ofType:[file pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:fileLocation];
    NSError* error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        return nil;
    }
    return result;
}

@end
