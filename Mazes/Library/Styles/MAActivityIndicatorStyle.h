//
//  MAActivityIndicatorStyle.h
//  Mazes
//
//  Created by Andre Muis on 4/28/12.
//  Copyright (c) 2012 Andre Muis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MAColors;

@interface MAActivityIndicatorStyle : NSObject

@property (readonly, strong, nonatomic) UIColor *color;

+ (MAActivityIndicatorStyle *)activityIndicatorStyle;

@end
