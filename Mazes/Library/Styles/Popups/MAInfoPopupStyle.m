//
//  MAInfoPopupStyle.m
//  Mazes
//
//  Created by Andre Muis on 10/20/13.
//  Copyright (c) 2013 Andre Muis. All rights reserved.
//

#import "MAInfoPopupStyle.h"

#import "MAColors.h"

@implementation MAInfoPopupStyle

+ (MAInfoPopupStyle *)infoPopupStyle
{
    MAInfoPopupStyle *infoPopupStyle = [[MAInfoPopupStyle alloc] init];
    return infoPopupStyle;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        MAColors *colors = [MAColors colors];

        _textColor = colors.darkBrown2Color;
        _font = [UIFont boldSystemFontOfSize: 18.0];
        
        _cancelButtonTitleEdgeInsets = UIEdgeInsetsMake(0.0, 15.0, 0.0, 15.0);
    }
    
    return self;
}

@end
