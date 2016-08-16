//
//  ViewController.h
//  qqq
//
//  Created by 创新创业中心 on 16/8/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
// 记录地图上的宽和高有多少个格子
#define WIDTH 13
#define HEIGHT 21
#define CELL_SIZE 30
typedef enum {
    kDown = 0,
    kLeft,
    kRight,
    kUp
} Orient;
@interface FKSnakeView : UIView <UIAlertViewDelegate>
// 定义蛇的移动方向
@property (nonatomic , assign) Orient orient;
@end
