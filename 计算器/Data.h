//
//  Data.h
//  计算器
//
//  Created by Sunnycool on 16/7/25.
//  Copyright © 2016年 jiawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

@property (nonatomic, strong) NSString* str;
@property (nonatomic, strong) NSString* result;
@property (nonatomic, strong) NSMutableArray *numStack, *opStack;


- (void) calc;

@end
