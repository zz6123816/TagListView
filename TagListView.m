//
//  TagListView.m
//  GiftBox
//
//  Created by 康健 on 15/4/24.
//  Copyright (c) 2015年 xinyihezi. All rights reserved.
//

#import "TagListView.h"
#import <QuartzCore/QuartzCore.h>

#define BORDER_WIDTH 0.5f
@implementation TagListView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cornerRadius = 2.0f;
        _font = [UIFont tipTextFont];
        _labelBackgroundColor = [UIColor whiteColor];
        _labelTextColor = [UIColor gray2Color];
        _labelMaxHeight = GBFix320(25);
        _horizontalPadding = GBFix320(15);
        _labelMargin = GBFix320(10);
        _bottomMargin = GBFix320(10);
        [self addSubview:view];
    }
    return self;
}
- (void)setTags:(NSArray *)array
{
    if ([self isEqual:textArray toArray:array] == NO) {
        textArray = [[NSArray alloc] initWithArray:array];
        sizeFit = CGSizeZero;
        [self display];
    }
}
- (BOOL)isEqual:(NSArray *)array toArray:(NSArray *)otherArray {
    if (array.count != otherArray.count) {
        return NO;
    }
    for (NSInteger i = 0; i < array.count; i++) {
        if ([array[i] isEqualToString:otherArray[i]] == NO) {
            return NO;
        }
    }
    return YES;
}
- (void)setLabelBackgroundColor:(UIColor *)labelBackgroundColor {
    _labelBackgroundColor = labelBackgroundColor;
    [self display];
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
        [self display];
    }
}
- (void)setFont:(UIFont *)font {
    if (_font != font) {
        _font = font;
        [self display];
    }
}
- (void)setLabelTextColor:(UIColor *)labelTextColor {
    if (_labelTextColor != labelTextColor) {
        _labelTextColor = labelTextColor;
        [self display];
    }
}
- (void)setLabelMaxHeight:(CGFloat)labelMaxHeight {
    if (_labelMaxHeight != labelMaxHeight) {
        _labelMaxHeight = labelMaxHeight;
        [self display];
    }
}
- (void)setHorizontalPadding:(CGFloat)horizontalPadding {
    if (_horizontalPadding != horizontalPadding) {
        _horizontalPadding = horizontalPadding;
        [self display];
    }
}
- (void)setLabelMargin:(CGFloat)labelMargin {
    if (_labelMargin != labelMargin) {
        _labelMargin = labelMargin;
        [self display];
    }
}
- (void)setBottomMargin:(CGFloat)bottomMargin {
    if (_bottomMargin != bottomMargin) {
        _bottomMargin = bottomMargin;
        [self display];
    }
}
- (void)display
{
    for (UILabel *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
    float totalHeight = 0;
    CGRect previousFrame = CGRectZero;
    BOOL gotPreviousFrame = NO;
    for (NSString *text in textArray) {
        CGSize textSize = [text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, 1500) lineBreakMode:NSLineBreakByCharWrapping];
        textSize.width += self.horizontalPadding * 2;
        textSize.height = self.labelMaxHeight;//textSize.height > self.labelMaxHeight ? self.labelMaxHeight : textSize.height;
        
        UILabel *label = nil;
        if (!gotPreviousFrame) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
            totalHeight = textSize.height;
        } else {
            CGRect newRect = CGRectZero;
            if (previousFrame.origin.x + previousFrame.size.width + textSize.width + self.labelMargin > self.frame.size.width) {
                newRect.origin = CGPointMake(0, previousFrame.origin.y + textSize.height + self.bottomMargin);
                totalHeight += textSize.height + self.bottomMargin;
            } else {
                newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + self.labelMargin, previousFrame.origin.y);
            }
            newRect.size = textSize;
            label = [[UILabel alloc] initWithFrame:newRect];
        }
        previousFrame = label.frame;
        gotPreviousFrame = YES;
        label.font = self.font;
        label.backgroundColor = self.labelBackgroundColor;
        [label setTextColor:self.labelTextColor];
        [label setText:text];
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [label.layer setMasksToBounds:YES];
        [label.layer setCornerRadius:self.cornerRadius];
        [label.layer setBorderColor:self.labelTextColor.CGColor];
        [label.layer setBorderWidth: BORDER_WIDTH];
        [self addSubview:label];
    }
    sizeFit = CGSizeMake(self.frame.size.width, totalHeight);
}

- (CGSize)fittedSize
{
    return sizeFit;
}
@end
