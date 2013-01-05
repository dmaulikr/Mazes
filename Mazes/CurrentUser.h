//
//  CurrentUser.h
//  Mazes
//
//  Created by Andre Muis on 1/3/13.
//  Copyright (c) 2013 Andre Muis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentUser : NSObject
{
    NSString *userIdKey;
}

@property (assign, nonatomic) int id;

+ (CurrentUser *)shared;

@end
