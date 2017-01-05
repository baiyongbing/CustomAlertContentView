//
//  ViewController.m
//  BYBAlertContentView
//
//  Created by 白永炳 on 16/12/26.
//  Copyright © 2016年 BYB. All rights reserved.
//

#import "ViewController.h"
#import "BYBAlertCommon.h"
#import "TYAlertController.h"
#import "BYBContentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}

- (IBAction)alerVIewClick:(UIButton *)sender {
    
    CGFloat height=MINSIZEIPHONE?200:230;
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH * GOLDENSECTION, height);
    BYBContentView *contentView = [[BYBContentView alloc] initWithFrame:frame Target:self ConfirmSelector:@selector(ConfirmBtnClick:) CancelSelector:@selector(CancleBtnClick:) defaultValue:@"请输入code" radioType:BYBRadioCountryType];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView: contentView preferredStyle:TYAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:^{}];

}

- (void)ConfirmBtnClick:(UIButton *)sender
{
    NSLog(@"confirm");
}

- (void)CancleBtnClick:(UIButton *)sender
{
    NSLog(@"cancel");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
