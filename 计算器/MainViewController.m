//
//  MainViewController.m
//  计算器
//
//  Created by jiawei on 16/7/25.
//  Copyright © 2016年 jiawei. All rights reserved.
//

#import "MainViewController.h"
#import "GlobalVar.h"
#import "Data.h"

@implementation MainViewController

-(instancetype)init{
    if(self = [super init]){
        self.string=[[NSString alloc]init];
        self.buttons=[[NSMutableArray alloc] init];
        self.keyValue = @[@"+", @"-", @"×", @"÷", @"7", @"8", @"9", @"(", @"4", @"5", @"6", @")", @"1" ,@"2", @"3", @"AC", @"0", @".", @"="];
        [self mainView];
        [self caculate];
    }
    return self;
}

-(void)mainView{
    self.screen=[[UITextView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 2*(ScreenHeight-1.25*ScreenWidth)/3-20)];
    [self.screen setBackgroundColor:[UIColor grayColor]];
    [self.screen setFont:[UIFont systemFontOfSize:50]];
    [self.screen setTextAlignment:NSTextAlignmentRight];
    [self.screen setEditable:NO];
    [self.screen.textContainer setLineBreakMode:NSLineBreakByClipping];
    
    self.result=[[UITextView alloc]initWithFrame:CGRectMake(0, 2*(ScreenHeight-1.25*ScreenWidth)/3, ScreenWidth, (ScreenHeight-1.25*ScreenWidth)/3)];
    [self.result setBackgroundColor:[UIColor whiteColor]];
    [self.result setFont:[UIFont systemFontOfSize:50]];
    [self.result setTextAlignment:NSTextAlignmentRight];
    [self.result setEditable:NO];
    
    self.keyborder=[[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-1.25*ScreenWidth, ScreenWidth, 1.25*ScreenWidth)];
    [self.keyborder setBackgroundColor:[UIColor brownColor]];
    
    [self.view addSubview:self.screen];
    [self.view addSubview:self.keyborder];
    [self.view addSubview:self.result];
}

-(void)caculate{
    CGPoint btnPos = CGPointMake(0, 0);
    CGSize btnSize = CGSizeMake(0.25*ScreenWidth, 0.25*ScreenWidth);
    NSInteger p=0;
    for (NSInteger i=0; i<=4; i++) {
        for (NSInteger j=0; j<=3; j++) {
            if(i == 4 && j == 3) continue;
            CGRect frame = CGRectMake(btnPos.x, btnPos.y, btnSize.width, btnSize.height);
            btnPos.x += btnSize.width;
            UIButton* but = [self makeButton:frame and:self.keyValue[p++]];
            [but addTarget:self action:@selector(keyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttons addObject:but];
            [self.keyborder addSubview:but];
        }
        btnPos.y += btnSize.height;
        btnPos.x = 0;
    }
    UIButton* lastBtn = (UIButton*)([self.buttons lastObject]);
    CGRect lastBtnFrame = lastBtn.frame;
    lastBtnFrame.size.width = 2 * btnSize.width;
    [lastBtn setFrame:lastBtnFrame];
}

-(UIButton*)makeButton:(CGRect)rect and:(NSString*)type{
    UIButton *but=[[UIButton alloc]initWithFrame:rect];
    [but.layer setBorderWidth:0.5];
    [but setTitle:type forState:UIControlStateNormal];
    [but.titleLabel setFont:[UIFont boldSystemFontOfSize:40]];
    [but.titleLabel setTextAlignment:NSTextAlignmentCenter];
    return but;
}

-(void)keyBtnClick:(UIButton*)but{
    if([but.titleLabel.text isEqualToString:@"AC"]){
        [self.screen setText:@""];
        self.string=@"";
    }
    else if([but.titleLabel.text isEqualToString:@"="]){
        Data* d = [[Data alloc] init];
        [d setStr:self.screen.text];
        [d calc];
        [self.result setText:d.result];
    }
    else{
        self.string = [self.string stringByAppendingString:but.titleLabel.text];
        [self.screen setText:self.string];
    }
    [self.screen scrollRectToVisible:CGRectMake(0, self.screen.contentSize.height - self.screen.frame.size.height, self.screen.frame.size.width, self.screen.frame.size.height) animated:YES];
//    [self.screen scrollRectToVisible:CGRectMake(0, _textView.contentSize.height-15, _textView.contentSize.width, 10) animated:YES];
}

@end
