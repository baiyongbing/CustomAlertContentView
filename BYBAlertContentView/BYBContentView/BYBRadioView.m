//
//  BYBRadioView.m
//  BYBAlertContentView
//
//  Created by 白永炳 on 16/12/26.
//  Copyright © 2016年 BYB. All rights reserved.
//

#import "BYBRadioView.h"
#import "BYBAlertCommon.h"
#import "Masonry.h"

@interface BYBRadioView ()

@property(nonatomic, strong)id<BYBRadioDelegate>delegate;
@property(nonatomic, assign)BYBRadioType radioType;
// 页面
@property(nonatomic, strong)UIButton *radioBtn;
@property(nonatomic, strong)UILabel *radioLab;

@end

@implementation BYBRadioView

- (instancetype)initWithFrame:(CGRect)frame Selected:(BOOL)selected RadioType:(BYBRadioType)type name:(NSString *)name delegate:(id<BYBRadioDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.radioType = type;
        self.delegate = delegate;
        [self initUIWithParam:name Selected:selected];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    self.radioBtn.selected = selected;
}

- (void)initUIWithParam:(NSString *)name Selected:(BOOL)selectd
{
    UIButton *radiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [radiBtn setImage:[UIImage imageNamed:@"未选中按钮"] forState:UIControlStateNormal];
    [radiBtn setImage:[UIImage imageNamed:@"选中按钮"] forState:UIControlStateSelected];
    radiBtn.selected = selectd;
    self.radioBtn = radiBtn;
    
    [radiBtn addTarget:self action:@selector(radioBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:radiBtn];
    [radiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    
    UILabel *radioLab = [[UILabel alloc] init];
    radioLab.font = [UIFont systemFontOfSize:MINSIZEIPHONE?12:14];
    radioLab.text = name;
    radioLab.textAlignment = NSTextAlignmentLeft;
    self.radioLab = radioLab;
    [self addSubview:radioLab];
    [radioLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.mas_equalTo(radiBtn.mas_right);
    }];
}

#pragma mark radioBtnClick
- (void)radioBtnClick:(UIButton *)sender
{
    if (self.radioBtn.selected == NO) {
        self.radioBtn.selected = YES;
        if (self.delegate && [self.delegate respondsToSelector:@selector(RadioView:selectede:RadioType:)]) {
            [self.delegate RadioView:self selectede:YES RadioType:self.radioType];
        }
    }
}

#pragma makr touchDelegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.radioBtn.selected == NO) {
        self.radioBtn.selected = YES;
        if (self.delegate && [self.delegate respondsToSelector:@selector(RadioView:selectede:RadioType:)]) {
            [self.delegate RadioView:self selectede:YES RadioType:self.radioType];
        }
    }
}

@end
