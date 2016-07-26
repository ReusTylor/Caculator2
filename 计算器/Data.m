//
//  Data.m
//  计算器
//
//  Created by Sunnycool on 16/7/25.
//  Copyright © 2016年 jiawei. All rights reserved.
//

#import "Data.h"

@implementation Data


- (instancetype)init {
    if(self = [super init]){
        self.str=@"";
        self.result=@"";
        self.numStack = [[NSMutableArray alloc] init];
        self.opStack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (int) getPriority:(char)op {
    if(op == '$') return 0;
    if(op == '+' || op == '-') return 3;
    if(op == '*' || op == '/') return 4;
    if(op == '(') return 2;
    if(op == ')') return 5;
    return 1; // #
}
- (BOOL) isOperator:(char)exp {
    return exp == '+' || exp == '-' || exp == '*' || exp == '/'
        || exp == '(' || exp == ')' || exp == '#' || exp == '$';
}
- (double) getResultWithNum1:(double)num1 num2:(double)num2 andOperator:(char)o {
    if(o == '+') return num1 + num2;
    if(o == '-') return num1 - num2;
    if(o == '*') return num1 * num2;
    return num1 / num2;
}
- (void) calcIt {
    double num2 = [[self.numStack lastObject] doubleValue]; [self.numStack removeLastObject];
    double num1 = [[self.numStack lastObject] doubleValue]; [self.numStack removeLastObject];
    char o = [[NSString stringWithFormat:@"%@", [self.opStack lastObject]] characterAtIndex:0]; [self.opStack removeLastObject];
    [self.numStack addObject:[NSNumber numberWithDouble:[self getResultWithNum1:num1 num2:num2 andOperator:o]]];
}
- (void)pushStackWithOperator:(char)op {
    if(op == '(') {
        [self.opStack addObject:[NSString stringWithFormat:@"%c", op]];
    }
    else if(op == ')') {
        while([[NSString stringWithFormat:@"%@", [self.opStack lastObject]] characterAtIndex:0] != '(') {
//            [self.opStack removeLastObject];
            [self calcIt];
        }
        [self.opStack removeLastObject]; // pop '('
    }
    else {
        while([self getPriority:op] < [self getPriority:[[NSString stringWithFormat:@"%@", [self.opStack lastObject]] characterAtIndex:0]]) {
            [self calcIt];
        }
        [self.opStack addObject:[NSString stringWithFormat:@"%c", op]];
    }
}

- (void) calc {
    NSString* expression = [self.str stringByReplacingOccurrencesOfString:@"×" withString:@"*"];
    expression = [expression stringByReplacingOccurrencesOfString:@"÷" withString:@"/"];
    if([expression characterAtIndex:0] == '-') {
        expression = [NSString stringWithFormat:@"0%@", expression];
    }
    expression = [expression stringByReplacingOccurrencesOfString:@"(-" withString:@"(0-"];
    expression = [NSString stringWithFormat:@"$%@#", expression];
    [self.opStack addObject:[NSString stringWithFormat:@"%c", [expression characterAtIndex:0]]];
    double number = 0; BOOL flag = NO;
    for(int i = 1; i < expression.length; ++i) {
        char exp = [expression characterAtIndex:i];
        if([self isOperator:exp]) {
            if(flag) [self.numStack addObject:[NSNumber numberWithDouble:number]];
            [self pushStackWithOperator:exp];
            number = 0;
            flag = NO;
        }
        else {
            number = number * 10 + [[NSString stringWithFormat:@"%c", exp] doubleValue];
            flag = YES;
        }
    }
    self.result = [NSString stringWithFormat:@"%f", [[self.numStack lastObject] doubleValue]];
    NSLog(@"%@", self.result);
}

@end
