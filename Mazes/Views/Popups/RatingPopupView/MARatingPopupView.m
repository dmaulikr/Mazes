//
//  MARatingPopupView.m
//  Mazes
//
//  Created by Andre Muis on 10/11/12.
//  Copyright (c) 2013 Andre Muis. All rights reserved.
//

#import "MARatingPopupView.h"

#import "MAButton.h"
#import "MARatingPopupStyle.h"
#import "MAStyles.h"

@interface MARatingPopupView ()

@property (readonly, strong, nonatomic) MAStyles *styles;

@property (weak, nonatomic) IBOutlet MARatingView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet MAButton *cancelButton;

@property (readonly, strong, nonatomic) UIView *parentView;
@property (readonly, assign, nonatomic) float rating;

@end

@implementation MARatingPopupView

+ (MARatingPopupView *)ratingPopupViewWithParentView: (UIView *)parentView
                                              rating: (float)rating
{
    MARatingPopupView *ratingPopupView = [[[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner: nil options: nil] objectAtIndex: 0];
    
    
    return ratingPopupView;
}

- (id)initWithCoder: (NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    
    if (self)
    {
        _styles = [MAStyles styles];
    }
    
    return self;
}

- (void)setupWithParentView: (UIView *)parentView
                     rating: (float)rating
{
    [super setupWithParentView: parentView];
    
    _parentView = parentView;
    _rating = rating;
}

- (void)showWithDismissedHandler: (PopupViewDismissedHandler)dismissedHandler
{
    [super showWithDismissedHandler: dismissedHandler];
    
    self.ratingView.backgroundColor = [UIColor clearColor];
    
    self.messageLabel.backgroundColor = [UIColor clearColor];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    
    self.messageLabel.textColor = self.styles.ratingPopup.textColor;
    self.messageLabel.font = self.styles.ratingPopup.font;

    self.cancelButton.titleEdgeInsets = self.styles.ratingPopup.cancelButtonTitleEdgeInsets;
    
    CGFloat cancelButtonWidth = [self cancelButtonWidth: self.cancelButton];

    self.cancelButton.frame = CGRectMake((self.bounds.size.width - cancelButtonWidth) / 2.0,
                                         self.cancelButton.frame.origin.y,
                                         cancelButtonWidth,
                                         self.cancelButton.frame.size.height);
    
    [self centerInParentView];
    [self animateUp];
}

- (void)ratingView: (MARatingView *)ratingView ratingChanged: (float)newRating
{
    [self animateDown];
}

- (IBAction)cancelButtonTouchDown: (id)sender
{
    [self animateDown];
}

@end





















