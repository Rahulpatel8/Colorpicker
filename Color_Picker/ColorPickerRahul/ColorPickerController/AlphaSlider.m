//
//  AlphaSlider.m
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 23/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//

#import "AlphaSlider.h"

@implementation AlphaSlider

- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (int x = 0; x < self.frame.size.width ; x++) {
        UIColor *color = [UIColor colorWithHue:(_colorValue) saturation:1.0 brightness:1.0 alpha:(1 - ((float)x/self.frame.size.width))];
        [color set];
        CGRect rectnew = CGRectMake(x, self.frame.size.height/2 - 2, self.frame.size.width * x, 4);
        UIRectFill(rectnew);
    }
    [self setMinimumTrackImage:[self imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[self imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];
}

- (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
