//
//  MessageViewController.m
//  SSHTabbarController
//
//  Created by 海神 on 15/12/25.
//  Copyright © 2015年 海神. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSLog(@"MessageViewController.h %s", __func__);
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSLog(@"MessageViewController.h %s", __func__);
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"MessageViewController.h %s", __func__);
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"MessageViewController.h %s", __func__);

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
