//
//  colorSlider.m
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 21/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//

#import "ColorSlider.h"

@implementation ColorSlider {
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (int x = 0; x < self.frame.size.width ; x++) {
        UIColor *color = [UIColor colorWithHue:((float)x/self.frame.size.width) saturation:1.0 brightness:1.0 alpha:(1.0 - _alphaValue)];
        [color set];
        CGRect rectnew = CGRectMake(x, self.frame.size.height/2 - 2, self.frame.size.width * x, 4);
        UIRectFill(rectnew);
    }
    [self setMinimumTrackImage:[self imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[self imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];
}

-(UIColor *)color {
    return [UIColor colorWithHue:self.value saturation:1.0 brightness:1.0 alpha:(1.0 - _alphaValue)];
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
