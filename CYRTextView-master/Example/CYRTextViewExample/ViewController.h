//
//  ViewController.h
//  CYRTextViewExample
//
//  Created by Illya Busigin on 1/5/14.
//  Copyright (c) 2014 Cyrillian, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>
@property(nonatomic,strong) UISearchBar *search;
@property(nonatomic,copy)   NSString    *prompt; 

@end
