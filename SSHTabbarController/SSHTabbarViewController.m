//
//  SSHTabbarViewController.m
//  SSHTabbarController
//
//  Created by 海神 on 15/12/19.
//  Copyright © 2015年 海神. All rights reserved.
//

#import "SSHTabbarViewController.h"
#import "SSHNavigationController.h"

@interface SSHTabbarViewController ()<SSHNavigationControllerDelegate>
{

}
@property (nonatomic, strong) UIView *containView;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) SSHNavigationController *selectViewController;
@property (nonatomic, strong) SSHTabbarIteam *selectBarIteam;
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation SSHTabbarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _selectIndex = 0;
    }
    return self;
}


#pragma mark -
#pragma mark -- -- -- view life cycle -- -- --
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containView];
    [self.view addSubview:self.tabbar];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark -- -- -- ovride methond -- -- --


#pragma mark -
#pragma mark -- -- -- sshNavgation delegate -- -- --
- (void)sshNavPushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.containView.frame = [UIScreen mainScreen].bounds;
    self.tabbar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, cbarHeight);
}

- (void)sshNavPopViewControllerAnimated:(BOOL)animated{
    self.containView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - cbarHeight);
    self.tabbar.frame = CGRectMake(0, SCREEN_HEIGHT - cbarHeight, SCREEN_WIDTH, cbarHeight);
}

#pragma mark -
#pragma mark -- -- -- private methond -- -- --
- (SSHNavigationController *)sshNavgationViewControllerWithIndex:(NSInteger)index{
    SSHNavigationController *nav = (SSHNavigationController *)_viewControllers[index];
    return nav;
}

#pragma mark -
#pragma mark -- -- -- publick methond -- -- --
- (void)setBarIteamTitleNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor{
    for (int i = 0; i < _viewControllers.count; i++) {
        SSHNavigationController *nav = [self sshNavgationViewControllerWithIndex:i];
        if ([nav isKindOfClass:[SSHNavigationController class]]) {
            [nav.barIteam setBarIteamTitleNormalColor:normalColor selectColor:selectColor];
        }
        else{
            NSLog(@"please set viewController as SSHNavigationController class! %@", nav);
        }
    }
}

#pragma mark -
#pragma mark -- -- -- setter -- -- --
- (void)setViewControllers:(NSArray *)viewControllers{
    if (viewControllers.count == 0) {
        return;
    }
    if (viewControllers.count > 5) {
        NSAssert(0, @"please set viewControllers less than six");
    }
    _viewControllers = viewControllers;
    for (int i = 0; i < viewControllers.count; i++) {
        SSHNavigationController *nav = [self sshNavgationViewControllerWithIndex:i];
        if ([nav isKindOfClass:[SSHNavigationController class]]) {
            nav.sshNavDelegate = self;
            CGFloat itemWidth = SCREEN_WIDTH / viewControllers.count;
            CGRect frame = CGRectMake(itemWidth * i, 0, itemWidth, cbarHeight);
            if (!nav.barIteam) {
                nav.barIteam = [[SSHTabbarIteam alloc] initWithFrame:frame];
            }
            else{
                nav.barIteam.frame = frame;
            }
            nav.barIteam.index = i;
            [nav.barIteam addTarget:self action:@selector(barIteamClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tabbar addSubview:nav.barIteam];
        }
        else{
            NSLog(@"please set viewController as SSHNavigationController class! %@", nav);
        }
    }
    [self.tabbar addSubview:self.separatorLine];
    
    [self addChildViewController:self.selectViewController];
    self.selectViewController.view.frame = _containView.bounds;
    [_containView addSubview:self.selectViewController.view];
    [self.selectViewController didMoveToParentViewController:self];
    self.selectViewController.barIteam.isSelect = YES;

}



- (void)setSelectIndex:(NSInteger)selectIndex{
    if (selectIndex >= _viewControllers.count) {
        return;
    }
    if (selectIndex == _selectIndex) {
        return;
    }
    [self.selectViewController willMoveToParentViewController:nil];
    [self.selectViewController.view removeFromSuperview];
    [self.selectViewController removeFromParentViewController];
    self.selectViewController.barIteam.isSelect = NO;
    _selectIndex = selectIndex;
    
    [self addChildViewController:self.selectViewController];
    self.selectViewController.view.frame = _containView.bounds;
    [_containView addSubview:self.selectViewController.view];
    [self.selectViewController didMoveToParentViewController:self];
    self.selectViewController.barIteam.isSelect = YES;
}


- (SSHNavigationController *)selectViewController{
    return [self sshNavgationViewControllerWithIndex:_selectIndex];
}

- (void)setBarTranslucent:(BOOL)barTranslucent{
    if (barTranslucent) {
        self.containView.frame = [UIScreen mainScreen].bounds;
    }
    else{
        self.containView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - cbarHeight);
    }
}

- (void)setSelectBarIteam:(SSHTabbarIteam *)selectBarIteam{
    if (!selectBarIteam) {
        return;
    }
    _selectBarIteam = selectBarIteam;
}

- (void)setSeparatorHidden:(BOOL)separatorHidden{
    _separatorLine.hidden = YES;
}
#pragma mark -
#pragma mark -- -- -- event response -- -- --
- (void)barIteamClick:(SSHTabbarIteam *)iteam{
    NSInteger index = iteam.index;
    [self setSelectIndex:index];
}

#pragma mark -
#pragma mark -- -- -- getter -- -- --

- (SSHTabbar *)tabbar{
    if (!_tabbar) {
        _tabbar = [[SSHTabbar alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - cbarHeight, SCREEN_WIDTH, cbarHeight)];
        _tabbar.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1];
    }
    return _tabbar;
}

- (UIView *)containView{
    if (!_containView) {
        _containView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - cbarHeight)];
        _containView.backgroundColor = [UIColor whiteColor];
    }
    return _containView;
}

- (UIImageView *)barBackGroundImageView{
    if (!_barBackGroundImageView) {
        _barBackGroundImageView = [UIImageView new];
        _barBackGroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_tabbar insertSubview:_barBackGroundImageView atIndex:0];
    }   
    return _barBackGroundImageView;
}

- (UIView *)separatorLine{
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.75)];
//        _separatorLine.backgroundColor = [UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:1];
        _separatorLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _separatorLine;
}


@end
