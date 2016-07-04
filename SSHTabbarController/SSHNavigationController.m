//
//  SSHNavigationController.m
//  SSHTabbarController
//
//  Created by 海神 on 15/12/25.
//  Copyright © 2015年 海神. All rights reserved.
//

#import "SSHNavigationController.h"

@interface SSHNavigationController ()

@end

@implementation SSHNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        NSLog(@"%s", __func__);
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s", __func__);
    [self.topViewController viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%s", __func__);
    [self.topViewController viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.topViewController viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.topViewController viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.sshNavDelegate respondsToSelector:@selector(sshNavPushViewController:animated:)]) {
        [self.sshNavDelegate sshNavPushViewController:viewController animated:animated];
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    NSLog(@"%@", self.topViewController);
    if (self.viewControllers.count > 0) {
        if (self.topViewController == self.viewControllers[1]) {
            if ([self.sshNavDelegate respondsToSelector:@selector(sshNavPopViewControllerAnimated:)]) {
                [self.sshNavDelegate sshNavPopViewControllerAnimated:animated];
            }
        }
    }
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self.viewControllers[0]) {
        if ([self.sshNavDelegate respondsToSelector:@selector(sshNavPopViewControllerAnimated:)]) {
            [self.sshNavDelegate sshNavPopViewControllerAnimated:animated];
        }
    }
    return [super popToViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    if ([self.sshNavDelegate respondsToSelector:@selector(sshNavPopViewControllerAnimated:)]) {
        [self.sshNavDelegate sshNavPopViewControllerAnimated:animated];
    }
    return [super popToRootViewControllerAnimated:animated];
}

- (SSHTabbarIteam *)barIteam{
    if (!_barIteam) {
        _barIteam = [[SSHTabbarIteam alloc] initWithFrame:CGRectZero];
    }
    return _barIteam;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
