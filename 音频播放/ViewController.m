//
//  ViewController.m
//  音频播放
//
//  Created by 爱尚家 on 2017/11/24.
//  Copyright © 2017年 Mr_Kong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    _btnPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _btnPlay.frame = CGRectMake(30, 100, 80, 50);
    [_btnPlay setTitle:@"播放" forState:UIControlStateNormal];
    [_btnPlay addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];

    _btnStop.frame = CGRectMake(140, 100, 80, 50);
    [_btnStop setTitle:@"停止" forState:UIControlStateNormal];
    [_btnStop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
    _btnPause.frame = CGRectMake(260, 100, 80, 50);
    [_btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    [_btnPause addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    
    
    _btnPlay.backgroundColor = [UIColor orangeColor];
    _btnStop.backgroundColor = [UIColor orangeColor];
    _btnPause.backgroundColor = [UIColor orangeColor];

    
    [self.view addSubview:_btnPlay];
    [self.view addSubview:_btnStop];
    [self.view addSubview:_btnPause];
    
    
    //进度条
    _musicProgress = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 220, 300, 20)];
    _musicProgress.progress = 0;
    [self.view addSubview:_musicProgress];
    
    
    //音量
    _volumSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 280, 300, 20)];
    _volumSlider.maximumValue = 100;
    _volumSlider.minimumValue = 0;
    [_volumSlider addTarget:self action:@selector(changeVolum:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_volumSlider];
    
    
    //创建播放器对象
    [self creatVideo];
    
}

-(void)creatVideo{
    //获取本地的资源文件路径
    NSString *str = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp3"];
    
    NSURL *url = [NSURL fileURLWithPath:str];
    
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    //准备工作，解码工作
    [_player prepareToPlay];
    
    //循环的次数
    //-1 : 无限循环
    
    _player.numberOfLoops = -1;
    
    //设置音量大小
    _player.volume = 0.5;
    
    
    // 定义一个定时器，更新进度条
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    
    
    //修改测试
    //测试

}

-(void)update{
    
    _musicProgress.progress = _player.currentTime/_player.duration;
    
}
//开始
-(void)play{
    
    //开始播放
    [_player play];
    
}
//停止
-(void)stop{
    
    
    [_player stop];
    
    //播放时间清0
    _player.currentTime = 0;
    
}
//暂停
-(void)pause{
    
    [_player pause];

    
}
//音量修改
-(void)changeVolum:(UISlider *)slider{
    
    
    float  str  = [[NSString stringWithFormat:@"%.1f",slider.value/100] floatValue];
    
    //设置音量大小
    _player.volume = str;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
