//
//  ViewController.m
//  TestImage
//
//  Created by Zhu Yu on 2017/6/6.
//  Copyright © 2017年 Zhu Yu. All rights reserved.
//

#import "ViewController.h"
#import "WeiView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UISlider *sliderAlpha;
@property (weak, nonatomic) IBOutlet WeiView *viewWei;
@property (weak, nonatomic) IBOutlet UIButton *topButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _viewWei.backgroundColor = [UIColor clearColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)filterAction:(id)sender {
    [self updateView1];
}
- (IBAction)alphaChanged:(id)sender {
    [self updateView1];
    
    // wei
    if (_viewWei.isScrollTop)
    {
        _viewWei.alpha = _sliderAlpha.value;
    
        [_viewWei setNeedsDisplay];
    }
}
- (IBAction)weiAction:(id)sender {
    _viewWei.isScrollTop = !_viewWei.isScrollTop;
    NSString * displayText = @"bottom";
    if (_viewWei.isScrollTop)
        displayText = @"top";
    
    [_topButton setTitle:displayText forState:UIControlStateNormal];
    
    [_viewWei setNeedsDisplay];
}

- (void)updateView1 {
    UIImage *origImage = _imageView.image;
    CGRect rect = CGRectMake(0, 0, 1680, 1050);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([origImage CGImage], rect);
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    
    UIGraphicsBeginImageContext(rect.size);
    
    [img drawAtPoint:CGPointZero blendMode:kCGBlendModeSoftLight alpha:_sliderAlpha.value];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imageView1.image = image;
}

@end
