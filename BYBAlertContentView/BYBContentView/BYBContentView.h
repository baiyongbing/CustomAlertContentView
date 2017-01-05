//
//  BYBContentView.h
//  BYBAlertContentView
//
//  Created by 白永炳 on 16/12/26.
//  Copyright © 2016年 BYB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYBAlertCommon.h"
#import "BYBRadioView.h"

@interface BYBContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame Target:(id)target ConfirmSelector:(SEL)confirmselector CancelSelector:(SEL)cancleselector defaultValue:(NSString *)parameter radioType:(BYBRadioType)type;

@end
