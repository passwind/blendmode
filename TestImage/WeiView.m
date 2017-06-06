//
//  WeiView.m
//  TestImage
//
//  Created by Zhu Yu on 2017/6/6.
//  Copyright © 2017年 Zhu Yu. All rights reserved.
//

#import "WeiView.h"

@implementation WeiView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if (_isScrollTop) {

        UIColor *color = [UIColor colorWithRed:3/255 green:3/255 blue:3/255 alpha:_alpha];
        
        [color setFill];
        

        UIRectFillUsingBlendMode(rect, kCGBlendModeSoftLight);
    }
}


@end
