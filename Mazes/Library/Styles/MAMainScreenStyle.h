//
//  MAMainScreenStyle.h
//  Mazes
//
//  Created by Andre Muis on 12/28/12.
//  Copyright (c) 2012 Andre Muis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAMainScreenStyle : NSObject

@property (nonatomic, assign, readonly) NSTimeInterval transitionDuration;

+ (MAMainScreenStyle *)mainScreenStyle;

@end
