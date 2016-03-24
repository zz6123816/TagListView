//
//  TagListView.h
//  GiftBox
//
//  Created by 康健 on 15/4/24.
//  Copyright (c) 2015年 xinyihezi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**多个标签的View*/
@interface TagListView : UIView
{
    UIView *view;
    NSArray *textArray;
    CGSize sizeFit;
}
@property (nonatomic, strong) NSArray *textArray;
/**圆角大小, 默认是2.0f*/
@property (nonatomic, assign) CGFloat cornerRadius;
/**字体, 默认是tipTextFont*/
@property (nonatomic, strong) UIFont * font;
/**背景颜色, 默认是whiteColor*/
@property (nonatomic, strong) UIColor * labelBackgroundColor;
/**文字颜色, 默认是gray2Color*/
@property (nonatomic, strong) UIColor * labelTextColor;
/**label最大高度 默认是kfix320(25)*/
@property (nonatomic, assign) CGFloat labelMaxHeight;
/**label的文字到边框间距 默认是kfix320(15)*/
@property (nonatomic, assign) CGFloat horizontalPadding;
/**label间距, 默认是kfix320(10)*/
@property (nonatomic, assign) CGFloat labelMargin;
/**label上下间距, 默认是kfix320(10)*/
@property (nonatomic, assign) CGFloat bottomMargin;
- (void)setTags:(NSArray *)array;
- (void)display;
- (CGSize)fittedSize;
@end
