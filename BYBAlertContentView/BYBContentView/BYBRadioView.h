//
//  BYBRadioView.h
//  BYBAlertContentView
//
//  Created by 白永炳 on 16/12/26.
//  Copyright © 2016年 BYB. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYBRadioDelegate;

typedef enum{
    
    BYBRadioCountryType,
    BYBRadioProvinceType,
    BYBRadioCityType
    
}BYBRadioType;

@interface BYBRadioView : UIView

- (instancetype)initWithFrame:(CGRect)frame Selected:(BOOL)selected RadioType:(BYBRadioType)type name:(NSString *)name delegate:(id<BYBRadioDelegate>)delegate;

- (void)setSelected:(BOOL)selected;


@end

@protocol BYBRadioDelegate <NSObject>

@optional

- (void)RadioView:(BYBRadioView *)radioView selectede:(BOOL)selected RadioType:(BYBRadioType)type;


@end
