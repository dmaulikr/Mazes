//
//  MAFloorPlanView.h
//  Mazes
//
//  Created by Andre Muis on 1/31/11.
//  Copyright 2011 Andre Muis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MAConstants.h"
#import "MAMaze.h"

@class MALocation;
@class MATextureManager;

@interface MAFloorPlanView : UIView

@property (readwrite, strong, nonatomic) MAMaze *maze;

- (void)refresh;

- (MALocation *)locationWithTouchPoint: (CGPoint)touchPoint;
- (MAWall *)wallWithTouchPoint: (CGPoint)touchPoint;

@end