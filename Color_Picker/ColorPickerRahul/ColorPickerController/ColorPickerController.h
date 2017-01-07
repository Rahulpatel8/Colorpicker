//
//  ColorPickerController.h
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 21/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "colorSlider.h"
#import "AlphaSlider.h"

@protocol ColorPickerDelegate
@required
-(void)colorPickerControllerDidComplete:(id)controller :(UIColor *)color;

@end
@interface ColorPickerController : UIViewController {
    __weak IBOutlet colorSlider *sliderColor;
    __weak IBOutlet AlphaSlider *alphaSlider;
}

@property (nonatomic) id<ColorPickerDelegate> delegate;

@end
