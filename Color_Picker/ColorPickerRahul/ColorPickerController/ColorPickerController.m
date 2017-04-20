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
    sliderColor.alphaValue = alphaSlider.value;
	alphaSlider.colorValue = sliderColor.value;
	float value = sliderColor.value;
    sliderColor.superview.layer.cornerRadius = 15;
	alphaSlider.value = 0.0;
	for (UIButton *btn in buttons) {
		int i = (int)[buttons indexOfObject:btn];
		btn.backgroundColor = [UIColor colorWithHue:(value) saturation:(i + 0.1) brightness:1.0 alpha:(1 - alphaSlider.value)];
        btn.layer.cornerRadius = btn.frame.size.height / 2;
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
        [self.delegate colorPickerController:self didPickColor:sender.backgroundColor];
    }
}

- (IBAction)btnOkClicked:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate colorPickerController:self didPickColor:sliderColor.color];
    }
}

- (IBAction)btnCancelClicked:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate colorPickerControllerDidCancel:self];
    }
}

@end
