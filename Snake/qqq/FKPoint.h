//
//  FKPoint.h
//  qqq
//
//  Created by 创新创业中心 on 16/8/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
@interface FKPoint : NSObject
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
- (id)initWithX:(NSInteger)x y:(NSInteger)y;
- (BOOL) isEqual:(FKPoint*)other;
@end
