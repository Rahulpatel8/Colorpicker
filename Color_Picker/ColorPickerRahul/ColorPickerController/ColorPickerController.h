//
//  ColorPickerController.h
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 21/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "ColorSlider.h"
#import "AlphaSlider.h"

@protocol ColorPickerDelegate;

@interface ColorPickerController : UIViewController {
    __weak IBOutlet ColorSlider *sliderColor;
    __weak IBOutlet AlphaSlider *alphaSlider;
}

@property (nonatomic) id<ColorPickerDelegate> delegate;

@end

@protocol ColorPickerDelegate
@required
-(void)colorPickerController:(ColorPickerController*)controller didPickColor:(UIColor *)color;
-(void)colorPickerControllerDidCancel:(ColorPickerController*)controller;
@end
