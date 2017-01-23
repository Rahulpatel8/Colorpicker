//
//  ColorPickerController.m
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 21/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//

#import "ColorPickerController.h"

@interface ColorPickerController () {
    IBOutletCollection(UIButton) NSArray *buttons;
}

@end

@implementation ColorPickerController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
	alphaSlider.colorValue = sliderColor.value;
	float value = sliderColor.value;
	alphaSlider.value = 0.0;
	for (UIButton *btn in buttons) {
		int i = (int)[buttons indexOfObject:btn];
		btn.backgroundColor = [UIColor colorWithHue:(value) saturation:(i + 0.1) brightness:1.0 alpha:(1 - alphaSlider.value)];
	}
	
}
- (IBAction)sliderColorChanged:(ColorSlider *)sender {
    float value = sliderColor.value;
    for (UIButton *btn in buttons) {
        int i = (int)[buttons indexOfObject:btn];
        btn.backgroundColor = [UIColor colorWithHue:(value) saturation:(i + 0.1) brightness:1.0 alpha:(1 - alphaSlider.value)];
    }
    alphaSlider.colorValue = sliderColor.value;
    [alphaSlider setNeedsDisplay];
}

- (IBAction)sliderAlphaChanged:(AlphaSlider *)sender {
    float value = sliderColor.value;
    for (UIButton *btn in buttons) {
        int i = (int)[buttons indexOfObject:btn];
        btn.backgroundColor = [UIColor colorWithHue:(value) saturation:(i + 0.1) brightness:1.0 alpha:(1 - sender.value)];
    }
}
- (IBAction)buttonClicked:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate colorPickerControllerDidComplete:self :sender.backgroundColor];
    }
}

- (IBAction)btnOkClicked:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate colorPickerControllerDidComplete:self :sliderColor.color];
    }
}

- (IBAction)btnCancelClicked:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate colorPickerControllerDidComplete:self :nil];
    }
}

@end
