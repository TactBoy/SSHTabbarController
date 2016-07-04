//
//  SSHNavigationController.h
//  SSHTabbarController
//
//  Created by 海神 on 15/12/25.
//  Copyright © 2015年 海神. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSHTabbarIteam.h"
#import "SSHTabbarViewController.h"

@protocol SSHNavigationControllerDelegate <NSObject>

@optional
- (void)sshNavPushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)sshNavPopViewControllerAnimated:(BOOL)animated;

@end

@interface SSHNavigationController : UINavigationController

@property (nonatomic, strong) SSHTabbarIteam *barIteam;
@property (nonatomic, assign) id<SSHNavigationControllerDelegate> sshNavDelegate;

@end
