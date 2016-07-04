//
//  SaquareViewController.m
//  SSHTabbarController
//
//  Created by 海神 on 15/12/25.
//  Copyright © 2015年 海神. All rights reserved.
//

#import "SaquareViewController.h"
#import "SSHViewController.h"

@interface SaquareViewController ()

@end

@implementation SaquareViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSLog(@"SaquareViewController.h %s", __func__);

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"SaquareViewController.h %s", __func__);
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"SaquareViewController.h %s", __func__);

}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"SaquareViewController.h %s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SSHViewController *ssh = [[SSHViewController alloc] init];
    [self.navigationController pushViewController:ssh animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
