//
//  BYBContentView.m
//  BYBAlertContentView
//
//  Created by 白永炳 on 16/12/26.
//  Copyright © 2016年 BYB. All rights reserved.
//

#import "BYBContentView.h"
#import "Masonry.h"

@interface BYBContentView ()<BYBRadioDelegate, UITextFieldDelegate>

@property(nonatomic,strong)BYBRadioView *selectedRadioView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UILabel *messageLab;
@property(nonatomic,strong)UITextField *contentTF;

@end

@implementation BYBContentView

- (instancetype)initWithFrame:(CGRect)frame Target:(id)target ConfirmSelector:(SEL)confirmselector CancelSelector:(SEL)cancleselector defaultValue:(NSString *)parameter radioType:(BYBRadioType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initDataWithType:type];
        [self initUIWithTarget:target ConfirmSelector:confirmselector CancelSelector:cancleselector defaultValue:parameter];
    }
    
    return self;
}

- (void)initDataWithType:(BYBRadioType)radioType
{
    _dataArr = [[NSMutableArray alloc] initWithCapacity:0];
    [_dataArr addObjectsFromArray:[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"country",@"name",[NSNumber numberWithInteger:BYBRadioCountryType],@"radioType",[NSNumber numberWithBool:radioType==BYBRadioCountryType?YES:NO],@"selected", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"province",@"name",[NSNumber numberWithInteger:BYBRadioProvinceType],@"radioType",[NSNumber numberWithBool:radioType==BYBRadioProvinceType?YES:NO],@"selected", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"city",@"name",[NSNumber numberWithInteger:BYBRadioCityType],@"radioType",[NSNumber numberWithBool:radioType==BYBRadioCityType?YES:NO],@"selected", nil],nil]];
}

- (void)initUIWithTarget:(id)target ConfirmSelector:(SEL)cinfirmselector CancelSelector:(SEL)cancleselector defaultValue:(NSString *)parameter
{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5.0f;
    self.layer.borderColor= COLOR(66, 128, 196,0.5).CGColor;
    self.layer.borderWidth = 0.5f;
    
    __block BYBRadioView *preView = nil;
    
    for (NSDictionary *dic in _dataArr) {
        
        BYBRadioView *radioView = [[BYBRadioView alloc] initWithFrame:CGRectZero Selected:[dic[@"selected"] boolValue] RadioType:(BYBRadioType)[dic[@"radioType"] integerValue] name:dic[@"name"] delegate:self];
        
        [self addSubview:radioView];
        
        if ([dic[@"selected"] boolValue]) {
            self.selectedRadioView = radioView;
        }
        
        [radioView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.height.mas_equalTo(self.mas_height).multipliedBy(0.11);

            if (preView != nil) {
                make.left.mas_equalTo(preView.mas_right);
                make.width.mas_equalTo(preView.mas_width);
            }
        }];
        
        preView = radioView;
    }
    
    if (preView != nil) {
        [preView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).offset(-10);
        }];
    }
    
    UILabel *messageLab = [[UILabel alloc] init];
    messageLab.textAlignment = NSTextAlignmentCenter;
    messageLab.text = @"全国用例";
    messageLab.textColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1.0f];
    messageLab.font = [UIFont systemFontOfSize:MINSIZEIPHONE?13.0f:15];
    messageLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:messageLab];
    self.messageLab = messageLab;
    [messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self.mas_centerY).offset(-30);
        make.height.equalTo(self.mas_height).multipliedBy(0.1);
        
    }];
    
    
    UITextField *contentTF = [[UITextField alloc] init];
    if (parameter==nil) {
        contentTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入测试邀请码" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:183/255.0f green:211/255.0f blue:237/255.0f alpha:0.8f],NSFontAttributeName : [UIFont systemFontOfSize:MINSIZEIPHONE?14.0f:16.0f weight:2],}];
    }else
    {
        contentTF.text = parameter;
    }
    contentTF.borderStyle = UITextBorderStyleRoundedRect;
    contentTF.textAlignment=NSTextAlignmentCenter;
    contentTF.layer.cornerRadius = 5;
    contentTF.layer.borderColor =  COLOR(66, 128, 196, 1.0).CGColor;
    contentTF.layer.borderWidth = 1.0;
    contentTF.delegate = self;
    contentTF.tag = 104;
    contentTF.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:contentTF];
    self.contentTF=contentTF;
    
    [contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(messageLab.mas_bottom).offset(3);
        make.width.equalTo(self.mas_width).multipliedBy(0.66);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(self).multipliedBy(0.18);
    }];

    
    UIButton *cancel=[UIButton buttonWithType:UIButtonTypeCustom];
    cancel.backgroundColor = COLOR(66, 128, 196, 1.0);
    cancel.layer.cornerRadius = 5;
    cancel.layer.borderColor = [UIColor whiteColor].CGColor;
    cancel.layer.borderWidth = 1.0;
    [cancel setTitle:@"取消" forState:(UIControlStateNormal)];
    [cancel addTarget:target action:cancleselector forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:cancel];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).multipliedBy(0.9);
        make.height.equalTo(self).multipliedBy(0.18);
        make.centerX.equalTo(self.mas_centerX).multipliedBy(0.5);
        make.width.equalTo(self.mas_width).multipliedBy(0.33);
        
    }];
    
    UIButton *confirm = [UIButton buttonWithType:UIButtonTypeCustom];
    confirm.backgroundColor = COLOR(66, 128, 196, 1.0);
    confirm.layer.cornerRadius = 5;
    confirm.layer.borderColor = [UIColor whiteColor].CGColor;
    confirm.layer.borderWidth = 1.0;
    [confirm setTitle:@"确认" forState:(UIControlStateNormal)];
    
    [confirm addTarget:target action:cinfirmselector forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:confirm];
    
    [confirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).multipliedBy(0.9);
        make.height.equalTo(self).multipliedBy(0.18);
        make.centerX.equalTo(self.mas_centerX).multipliedBy(1.5);
        make.width.equalTo(self.mas_width).multipliedBy(0.33);
    }];

}

#pragma mark BYBRadioDelegate
- (void)RadioView:(BYBRadioView *)radioView selectede:(BOOL)selected RadioType:(BYBRadioType)type
{
    if (![_selectedRadioView isEqual:radioView]) {
        [_selectedRadioView setSelected:NO];
        _selectedRadioView = radioView;
    }
    
    switch (type) {
        case BYBRadioCountryType:
        {
            self.messageLab.text = @"全国";
            break;
        }
        case BYBRadioProvinceType:
        {
            self.messageLab.text = @"省";
            break;
        }
        case BYBRadioCityType:
        {
            self.messageLab.text = @"市";
            break;
        }
            
        default:
            break;
    }
}

@end
