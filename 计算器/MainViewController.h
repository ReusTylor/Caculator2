//
//  MainViewController.h
//  计算器
//
//  Created by jiawei on 16/7/25.
//  Copyright © 2016年 jiawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property(nonatomic, strong) UIView* keyborder;
@property(nonatomic, strong) UITextView* screen, *result;
@property(nonatomic, strong) NSMutableArray* buttons;
@property(nonatomic, strong) NSArray* keyValue;
@property(nonatomic, strong) NSString* string;

@end
