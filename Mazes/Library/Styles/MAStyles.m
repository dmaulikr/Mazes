//
//  MAStyles.m
//  Mazes
//
//  Created by Andre Muis on 1/30/11.
//  Copyright 2011 Andre Muis. All rights reserved.
//

#import "MAStyles.h"

#import "MAActivityIndicatorStyle.h"
#import "MAButtonStyle.h"
#import "MAConstants.h"
#import "MACreateScreenStyle.h"
#import "MADesignScreenStyle.h"
#import "MAFloorPlanStyle.h"
#import "MAFoundExitPopupStyle.h"
#import "MAGameScreenStyle.h"
#import "MAMainScreenStyle.h"
#import "MAMapStyle.h"
#import "MAPopupStyle.h"
#import "MARatingPopupStyle.h"
#import "MATopMazesScreenStyle.h"

@implementation MAStyles

+ (MAStyles *)styles
{
    MAStyles *styles = [[MAStyles alloc] init];
    return styles;
}

- (id)init
{
    self = [super init];
	
	if (self) 
	{
        _defaultFont = [UIFont systemFontOfSize: [UIFont labelFontSize]];
        
        _activityIndicator = [MAActivityIndicatorStyle activityIndicatorStyle];
        _button = [MAButtonStyle buttonStyle];
        _createScreen = [MACreateScreenStyle createScreenStyle];
        _designScreen = [MADesignScreenStyle designScreenStyle];
        _floorPlan = [MAFloorPlanStyle floorPlanStyle];
        _foundExitPopup = [MAFoundExitPopupStyle foundExitPopupStyle];
        _gameScreen = [MAGameScreenStyle gameScreenStyle];
        _mainScreen = [MAMainScreenStyle mainScreenStyle];
        _map = [MAMapStyle mapStyle];
        _popup = [MAPopupStyle popupStyle];
        _ratingPopup = [MARatingPopupStyle ratingPopupStyle];
        _topMazesScreen = [MATopMazesScreenStyle topMazesScreenStyle];
    }
	
    return self;
}

@end
