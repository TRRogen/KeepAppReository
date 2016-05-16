//
//  MusicTableViewController.m
//  QQMusic
//
//  Created by TRRogen on 16/5/7.
//  Copyright © 2016年 TRRogen. All rights reserved.
//

#import "MusicTableViewController.h"
#import "TRMusic.h"
#import "TRMusicGroup.h"
#import "MusicCell.h"
@interface MusicTableViewController ()
@property(nonatomic,strong)NSArray<TRMusicGroup*> *musicGroups;

@end

@implementation MusicTableViewController

-(NSArray<TRMusicGroup*> *)musicGroups{
    if (!_musicGroups) {
        _musicGroups = [TRMusicGroup fakeData];
    }
    return _musicGroups;
}

#pragma mark-
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.musicGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.musicGroups[section].musics.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"musicCell" forIndexPath:indexPath];
    TRMusic *music = self.musicGroups[indexPath.section].musics[indexPath.row];
    cell.music = music;
    return cell;
}
//设置分区头
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.musicGroups[section].name;
}

@end
