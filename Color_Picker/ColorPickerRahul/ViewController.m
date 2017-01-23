//
//  ViewController.m
//  ColorPickerRahul
//
//  Created by SOTSYS024 on 21/12/16.
//  Copyright © 2016 SOTSYS024. All rights reserved.
//

#import "ViewController.h"
#import "colorSlider.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(UIButton *)sender {
	ColorPickerController *colorPicker = [[ColorPickerController alloc]initWithNibName:@"ColorPickerController" bundle:nil];
	colorPicker.delegate = self;
	colorPicker.modalPresentationStyle = UIModalPresentationOverCurrentContext;
	[self presentViewController:colorPicker animated:true completion:nil];
}


-(void)colorPickerControllerDidComplete:(id)controller :(UIColor *)color {
	[self.view setBackgroundColor:color];
	[((ColorPickerController*)controller) dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)colorSliderColorChanged:(ColorSlider *)sender {
    [_btn setBackgroundColor:sender.color];
}

@end
