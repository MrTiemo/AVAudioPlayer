//
//  ViewController.h
//  音频播放
//
//  Created by 爱尚家 on 2017/11/24.
//  Copyright © 2017年 Mr_Kong. All rights reserved.
//

#import <UIKit/UIKit.h>
//倒入视频音频系统库文件
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    //开始
    UIButton * _btnPlay;
    //停止
    UIButton * _btnStop;
    //暂停
    UIButton * _btnPause;;
    //播放进度
    UIProgressView * _musicProgress;
    //声音大小调整
    UISlider * _volumSlider;
    
    //音频播放器
    AVAudioPlayer * _player;
    
    NSTimer * _timer;
}

@end

