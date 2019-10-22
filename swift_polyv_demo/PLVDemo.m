//
//  PLVDemo.m
//  swift_polyv_demo
//
//  Created by reanod on 2019/10/22.
//  Copyright © 2019 高效码农. All rights reserved.
//

#import "PLVDemo.h"
#import <PLVVodSDK/PLVVodSDK.h>

static NSString * const PLVVodKeySettingKey = @"vodKey_preference";
static NSString * const PLVSdkVersionSettingKey = @"sdkVersion_preference";
static NSString * const PLVApplySettingKey = @"apply_preference";

@interface PLVDemo ()

@property (nonatomic, strong) PLVVodSkinPlayerController *player;

@end

@implementation PLVDemo
/**
 初始化保利威视
 */
-(void)polyvInit{
    NSError *error = nil;
    PLVVodSettings *settings = [PLVVodSettings settingsWithConfigString:@"yQRmgnzPyCUYDx6weXRATIN8gkp7BYGAl3ATjE/jHZunrULx8CoKa1WGMjfHftVChhIQlCA9bFeDDX+ThiuBHLjsNRjotqxhiz97ZjYaCQH/MhUrbEURv58317PwPuGEf3rbLVPOa4c9jliBcO+22A==" key:@"VXtlHmwfS2oYm0CZ" iv:@"2u9gDPKdX6GyQJKU" error:&error];
    
    // 读取并替换设置项。出于安全考虑，不建议从 plist 读取加密串，直接在代码中写入加密串更为安全。
    {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        BOOL enableUserVodKey = [user boolForKey:PLVApplySettingKey];
        if (enableUserVodKey) {
            NSString *userVodKey = [user stringForKey:PLVVodKeySettingKey];
            userVodKey = [userVodKey stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if (userVodKey.length) {
                settings = [PLVVodSettings settingsWithConfigString:userVodKey error:&error];
            }
        }
    }
    NSLog(@"settings: %@", settings);
    if (error) {
        NSLog(@"account settings error: %@", error);
    }
}

- (PLVVodSkinPlayerController *)play{
    // 初始化播放器
    PLVVodSkinPlayerController *player = [[PLVVodSkinPlayerController alloc] initWithNibName:nil bundle:nil];
    self.player = player;
    __weak typeof(self) weakSelf = self;
    [PLVVodVideo requestVideoWithVid:@"e97dbe3e64c247499b55f213a4470052_e" completion:^(PLVVodVideo *video, NSError *error) {
        if (!video.available) return;
        weakSelf.player.video = video;
    }];
    return player;
}
@end
