//
//  MATopMazeTableViewCell.m
//  Mazes
//
//  Created by Andre Muis on 4/18/10.
//  Copyright 2010 Andre Muis. All rights reserved.
//

#import "MATopMazeTableViewCell.h"

#import "AppDelegate.h"
#import "MAConstants.h"
#import "MAMaze.h"
#import "MAMazeSummary.h"
#import "MARatingView.h"
#import "MARatingPopoverStyle.h"
#import "MAStyles.h"
#import "MATopMazesScreenStyle.h"
#import "MAUtilities.h"

@interface MATopMazeTableViewCell ()

@property (readonly, strong, nonatomic) id<MATopMazeTableViewCellDelegate> delegate;

@property (readonly, strong, nonatomic) MAStyles *styles;

@property (readonly, strong, nonatomic) MAMazeSummary *mazeSummary1;
@property (readonly, strong, nonatomic) MAMazeSummary *mazeSummary2;

@end

@implementation MATopMazeTableViewCell

- (id)initWithCoder: (NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    
    if (self)
	{
        _styles = [MAStyles styles];
        
        _mazeSummary1 = nil;
        _mazeSummary2 = nil;
        
        _selectedColumn = 0;
    }
	
	return self;
}

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(handleTapFrom:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self addGestureRecognizer: tapGestureRecognizer];
}

- (void)setupWithDelegate: (id<MATopMazeTableViewCellDelegate>)delegate
             mazeSummary1: (MAMazeSummary *)mazeSummary1
             mazeSummary2: (MAMazeSummary *)mazeSummary2
{
    self.backgroundColor = [UIColor clearColor];

    _delegate = delegate;
    
    _mazeSummary1 = mazeSummary1;
    _mazeSummary2 = mazeSummary2;
 
    self.name1Label.textColor = self.styles.topMazesScreen.textColor;
    self.name1Label.text = self.mazeSummary1.name;
    
    self.date1Label.textColor = self.styles.topMazesScreen.textColor;
    self.date1Label.text = self.mazeSummary1.modifiedAtFormatted;
    
    self.ratingCount1Label.textColor = self.styles.topMazesScreen.textColor;

    if (self.mazeSummary1.averageRating == -1.0)
    {
        self.averageRating1View.hidden = YES;
        
        self.ratingCount1Label.text = @"";
    }
    else
    {
        self.averageRating1View.hidden = NO;
        
        [self.averageRating1View setupWithDelegate: self
                                            rating: self.mazeSummary1.averageRating
                                              type: MARatingViewDisplayOnly
                                         starColor: self.styles.topMazesScreen.averageRatingStarColor];
        
        self.ratingCount1Label.text = [NSString stringWithFormat: @"%d ratings", self.mazeSummary1.ratingCount];
    }
    
    if (self.mazeSummary1.userStarted == NO)
    {
        self.userRating1View.hidden = YES;
    }
    else
    {
        self.userRating1View.hidden = NO;
        
        [self.userRating1View setupWithDelegate: self
                                         rating: self.mazeSummary1.rating
                                           type: MARatingViewEditable
                                      starColor: self.styles.topMazesScreen.userRatingStarColor];
    }
    
    if (self.mazeSummary2 != nil)
    {
        self.name2Label.textColor = self.styles.topMazesScreen.textColor;
        self.name2Label.text = self.mazeSummary2.name;
        
        self.date2Label.textColor = self.styles.topMazesScreen.textColor;
        self.date2Label.text = self.mazeSummary2.modifiedAtFormatted;
        
        self.ratingCount2Label.textColor = self.styles.topMazesScreen.textColor;
        if (self.mazeSummary2.averageRating == -1.0)
        {
            self.averageRating2View.hidden = YES;
            
            self.ratingCount2Label.text = @"";
        }
        else
        {
            self.averageRating2View.hidden = NO;
            
            [self.averageRating2View setupWithDelegate: self
                                                rating: self.mazeSummary2.averageRating
                                                  type: MARatingViewDisplayOnly
                                             starColor: self.styles.topMazesScreen.averageRatingStarColor];
            
            
            self.ratingCount2Label.text = [NSString stringWithFormat: @"%d ratings", self.mazeSummary2.ratingCount];
        }
        
        if (self.mazeSummary2.userStarted == NO)
        {
            self.userRating2View.hidden = YES;
        }
        else
        {
            self.userRating2View.hidden = NO;
            
            [self.userRating2View setupWithDelegate: self
                                             rating: self.mazeSummary2.rating
                                               type: MARatingViewEditable
                                          starColor: self.styles.topMazesScreen.userRatingStarColor];
        }
    }
    else
    {
        self.background2ImageView.hidden = YES;
        
        self.name2Label.text = @"";
        self.date2Label.text = @"";
        
        self.averageRating2View.hidden = YES;        
        self.ratingCount2Label.text = @"";
        
        self.userRating2View.hidden = YES;
    }
}

- (void)handleTapFrom: (UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint tapPoint = [tapGestureRecognizer locationInView: self];
    
    if (tapPoint.x < self.frame.size.width / 2.0)
    {
		self.selectedColumn = 1;
    }
	else
    {
		self.selectedColumn = 2;
    }
}

- (void)ratingView: (MARatingView *)ratingView ratingChanged: (float)newRating
{
    NSString *mazeId = nil;
    NSString *mazeName = nil;
    
    if (ratingView == self.userRating1View)
    {
        mazeId = self.mazeSummary1.mazeId;
        mazeName = self.mazeSummary1.name;
    }
    else if (ratingView == self.userRating2View)
    {
        mazeId = self.mazeSummary2.mazeId;
        mazeName = self.mazeSummary2.name;
    }
    else
    {
        [MAUtilities logWithClass: [self class]
                          message: @"Rating view cannot be selectable."
                       parameters: @{@"ratingView" : ratingView}];
    }
    
    [self.delegate topMazeTableViewCell: self
                        didUpdateRating: newRating
                          forMazeWithId: mazeId
                                   name: mazeName];
}

@end






















