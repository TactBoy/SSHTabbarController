//
//  SSHTabbarIteam.h
//  SSHTabbarController
//
//  Created by 海神 on 15/12/19.
//  Copyright © 2015年 海神. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

static CGFloat const cbarHeight = 49;


@interface SSHTabbarIteam : UIControl

@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, assign) NSInteger index;

- (void)setBarTitle:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;
- (void)setBarIteamTitleNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor;

@end
