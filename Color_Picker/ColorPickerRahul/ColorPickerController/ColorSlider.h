//
//  colorSlider.h
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 21/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ColorSlider : UISlider {
    
}
@property (nonatomic) CGFloat alphaValue;
@property (getter=color, nonatomic,readonly) UIColor *color;
@end
