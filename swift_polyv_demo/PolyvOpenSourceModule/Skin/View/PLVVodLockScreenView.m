//
//  PLVVodLockScreenView.m
//  PolyvVodSDKDemo
//
//  Created by mac on 2018/12/10.
//  Copyright © 2018 POLYV. All rights reserved.
//

#define PLV_iPhoneXSeries ((PLV_iPhoneX || PLV_iPhoneXR1 || PLV_iPhoneXR2 || PLV_iPhoneXS || PLV_iPhoneXsMax))

#import "PLVVodLockScreenView.h"



@interface PLVVodLockScreenView() <UIGestureRecognizerDelegate>

@end

@implementation PLVVodLockScreenView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];

}

//- (void)tapEvent:(UITapGestureRecognizer *)tap{
//    NSLog(@"%s", __func__);
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%s", __func__);
//
//}

/// 过滤其他手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSLog(@"%s", __func__);
    
    // 处理解锁按钮的显示/隐藏
    if (self.unlockScreenBtn.hidden){
        self.unlockScreenBtn.hidden = NO;
        // 自动隐藏
        [self fadeoutUnlockScreenBtn];
    }
    else{
        //
        [self hiddenLockButton];
    }
    
    return NO;
}

- (void)fadeoutUnlockScreenBtn{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(hiddenLockButton) withObject:self afterDelay:5];
}

- (void)hiddenLockButton{
    [UIView animateWithDuration:0.2 animations:^{
        self.unlockScreenBtn.hidden = YES;
    }];
}

#pragma makr --public
- (void)showLockScreenButton{
    self.unlockScreenBtn.hidden = NO;
    [self fadeoutUnlockScreenBtn];
}

@end
