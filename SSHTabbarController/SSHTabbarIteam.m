//
//  SSHTabbarIteam.m
//  SSHTabbarController
//
//  Created by 海神 on 15/12/19.
//  Copyright © 2015年 海神. All rights reserved.
//

#import "SSHTabbarIteam.h"

static CGFloat iteamImageSize = 28.0f;
static CGFloat iteamLableHeight = 12.0f;

@interface SSHTabbarIteam ()

@property (nonatomic, strong) UIImageView *iteamImageView;
@property (nonatomic, strong) UILabel *iteamLabel;

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectImage;

@end

@implementation SSHTabbarIteam


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.iteamImageView.layer.masksToBounds = YES;
        self.iteamImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        _normalColor = [UIColor lightGrayColor];
        _selectColor = [UIColor blueColor];
        
        [self addSubview:self.iteamImageView];
        [self addSubview:self.iteamLabel];

        self.isSelect = NO;
    }
    return self;
}

- (void)layoutSubviews{
    CGFloat width = self.frame.size.width;
    self.iteamImageView.frame = CGRectMake(width / 2 - iteamImageSize / 2, 3, iteamImageSize, iteamImageSize);
    self.iteamLabel.frame = CGRectMake(2, cbarHeight - iteamLableHeight - 3, CGRectGetWidth(self.frame) - 4, iteamLableHeight);
}


#pragma mark -
#pragma mark -- -- -- view life cycle -- -- --

#pragma mark -
#pragma mark -- -- -- system delegate -- -- --

#pragma mark -
#pragma mark -- -- -- custom delegate -- -- --
#pragma mark -
#pragma mark -- -- -- privateMethond -- -- --


- (void)setBarTitle:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    self.iteamLabel.text = title;
    _normalImage = normalImage;
    _selectImage = selectedImage;
    self.isSelect = self.isSelect;
}

- (void)setBarIteamTitleNormalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor{
    _normalColor = normalColor;
    _selectColor = selectColor;
    self.isSelect = self.isSelect;
}



#pragma mark -
#pragma mark -- -- -- event response -- -- --

#pragma mark -
#pragma mark -- -- -- getter setter -- -- --

- (void)setIsSelect:(BOOL)isSelect{
    if (!isSelect) {
        _iteamLabel.textColor = _normalColor;
        _iteamImageView.image = _normalImage;
    }
    else{
        _iteamLabel.textColor = _selectColor;
        _iteamImageView.image = _selectImage;
    }
    _isSelect = isSelect;
}

- (UIImageView *)iteamImageView{
    if (!_iteamImageView) {
        _iteamImageView = [UIImageView new];
    }
    return _iteamImageView;
}

- (UILabel *)iteamLabel{
    if (!_iteamLabel) {
        _iteamLabel = [UILabel new];
        _iteamLabel.textAlignment = NSTextAlignmentCenter;
        _iteamLabel.font = [UIFont systemFontOfSize:10];
        _iteamLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _iteamLabel;
}

@end
