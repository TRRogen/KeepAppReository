//
//  MusicCell.m
//  QQMusic
//
//  Created by TRRogen on 16/5/7.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "MusicCell.h"


@interface MusicCell ()
//音乐名称
@property (weak, nonatomic) IBOutlet UILabel *MusicNameLabel;
//歌手和专辑
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
//歌曲时间
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
//高清imageView
@property (weak, nonatomic) IBOutlet UIImageView *HQImageView;
//下载imageView
@property (weak, nonatomic) IBOutlet UIImageView *downloadImageView;
//约束对象属性
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HQConstraintLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *artistConstraintLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *DownloadConstraintLeft;
@property (nonatomic,strong) NSString *aasdadgfshgahsgjogkdhsjkfjgskjdhbgjksal;


@end


@implementation MusicCell

-(void)setMusic:(TRMusic *)music{
    _music = music;
    self.MusicNameLabel.text = music.name;
    self.durationLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)music.duration/60,(int)music.duration%60];
    self.artistLabel.text = [NSString stringWithFormat:@"%@ - %@",music.artist,music.album];
    self.downloadImageView.hidden = !music.downloaded;
    self.HQImageView.hidden = !music.highQuality;
}

//UIView对自己内部的各个子视图布局
//调用时机:创建, 屏幕旋转,点中cell时
-(void)layoutSubviews{
    [super layoutSubviews];
//    CGFloat downLoadX = self.downloadImageView.frame.origin.x;
//    CGFloat HQX = downLoadX;
//    CGFloat artistX = downLoadX ;
//    CGRect frame;
//    if (self.music.downloaded) {
//        HQX += self.downloadImageView.bounds.size.width + 3;
//        artistX = HQX;
//    }
//    if (self.music.highQuality) {
//        frame = self.HQImageView.frame;
//        frame.origin.x = HQX;
//        self.HQImageView.frame = frame;
//        artistX += self.HQImageView.bounds.size.width + 3;
//    }
//    frame = self.artistLabel.frame;
//    frame.origin.x = artistX;
//    self.artistLabel.frame = frame;
//    
//    //音乐时间layout
//    frame = self.durationLabel.frame;
//    frame.origin.x = self.bounds.size.width - frame.size.width- 10;
//    self.durationLabel.frame = frame;
//    
    
    /*
     如果将SB中的AutoLayout勾上,在 LayoutSubViews中的布局就会被SB中的约束自动覆盖(即先调用LoyoutSubVies然后再有调用SB中的约束),即调用了updateConstraints方法
     */
    
    CGFloat x = 10;
    if (self.music.downloaded) {
        x += 20;
    }
    if (self.music.highQuality) {
        self.HQConstraintLeft.constant = x;
        x += 20;
    }
    self.artistConstraintLeft.constant = x;
    
    
}



//更新约束
//调用时机: create时
-(void)updateConstraints{
    [super updateConstraints];
 
//    CGFloat x = 10;
//    if (self.music.downloaded) {
//        x += 20;
//    }
//    if (self.music.highQuality) {
//        self.HQConstraintLeft.constant = x;
//        x += 20;
//    }
//    self.artistConstraintLeft.constant = x;
    
//    if (self.music.downloaded) {
//        if (!self.music.highQuality) {
//            self.artistConstraintLeft.constant = self.downloadImageView.frame.origin.x;
//        }else{
//            self.artistConstraintLeft.constant = self.HQImageView.frame.origin.x;
//            self.HQConstraintLeft.constant = self.downloadImageView.frame.origin.x;
//        }
//    }else{
//        if (!self.music.highQuality) {
//            self.artistConstraintLeft.constant = self.HQImageView.frame.origin.x;
//        }
//    }

}

@end












