//
//  SSHTabbarViewController.h
//  SSHTabbarController
//
//  Created by 海神 on 15/12/19.
//  Copyright © 2015年 海神. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSHTabbar.h"

@interface SSHTabbarViewController : UIViewController

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) SSHTabbar *tabbar;
@property (nonatomic, assign) BOOL barTranslucent;
@property (nonatomic, strong) UIImageView *barBackGroundImageView;
@property (nonatomic, assign) BOOL separatorHidden;

- (void)setBarIteamTitleNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor;

@end
