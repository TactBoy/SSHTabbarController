//
//  ViewController.m
//  SSHTabbarController
//
//  Created by 海神 on 15/12/19.
//  Copyright © 2015年 海神. All rights reserved.
//

#import "ViewController.h"
#import "SSHViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha size:(CGSize)size{
    CGSize imageSize = CGSizeMake(size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [[color colorWithAlphaComponent:alpha] set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SSHViewController *viewController = [[SSHViewController alloc] init];
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    viewController.view.frame = self.view.bounds;
}

@end
