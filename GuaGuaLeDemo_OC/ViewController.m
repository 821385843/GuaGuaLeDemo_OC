//
//  ViewController.m
//  GuaGuaLeDemo_OC
//
//  Created by 谢伟 on 2019/7/5.
//  Copyright © 2019 谢伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubViews];
}

- (void)createSubViews {
    UIImage *belowImg = [UIImage imageNamed:@"ten"];
    UIImageView *belowImgView = [[UIImageView alloc] initWithImage:belowImg];
    belowImgView.frame = CGRectMake(0, 0, belowImg.size.width, belowImg.size.height);
    belowImgView.center = self.view.center;
    [self.view addSubview:belowImgView];
    
    // 被刮的图片
    self.imageView = [[UIImageView alloc] initWithFrame:belowImgView.frame];
    self.imageView.image = [UIImage imageNamed:@"gray"];
    [self.view addSubview:self.imageView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint cententPoint = [touch locationInView:self.imageView];
    CGRect  rect = CGRectMake(cententPoint.x, cententPoint.y, 50, 50);
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [self.imageView.layer renderInContext:ref];
    CGContextClearRect(ref, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView.image = image;
}


@end
