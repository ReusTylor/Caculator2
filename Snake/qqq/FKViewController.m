//
//  FKViewController.m
//  qqq
//
//  Created by 创新创业中心 on 16/8/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FKViewController.h"
#import "MainViewController.h"
@implementation FKViewController
FKSnakeView* snakeView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    snakeView = [[FKSnakeView alloc] initWithFrame:
                 CGRectMake(10, 30, WIDTH*CELL_SIZE , HEIGHT * CELL_SIZE)];
    
    snakeView.layer.borderWidth = 3;
    snakeView.layer.borderColor = [[UIColor blueColor] CGColor];
    snakeView.layer.cornerRadius = 6;
    snakeView.layer.masksToBounds = YES;
    
    self.view.userInteractionEnabled = YES;
    
    self.view.multipleTouchEnabled = YES;
    for (int i = 0 ; i < 4 ; i++)
    {
        
        UISwipeGestureRecognizer* gesture = [[UISwipeGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleSwipe:)];
        
        gesture.numberOfTouchesRequired = 1;
      
        gesture.direction = 1 << i;
        
        [self.view addGestureRecognizer:gesture];
    }
    [self.view addSubview:snakeView];
}

- (void) handleSwipe:(UISwipeGestureRecognizer*)gesture
{
       NSUInteger direction = gesture.direction;
    switch (direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
            if(snakeView.orient != kRight)                 snakeView.orient = kLeft;
            break;
        case UISwipeGestureRecognizerDirectionUp:
            if(snakeView.orient != kDown)
                snakeView.orient = kUp;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            if(snakeView.orient != kUp)                 snakeView.orient = kDown;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if(snakeView.orient != kLeft) 
                snakeView.orient = kRight;
            break;
    }
}
@end

