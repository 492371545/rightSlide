//
//  RightSlideViewController.h
//  RightSlide
//
//  Created by Mengying Xu on 14-10-23.
//  Copyright (c) 2014年 Crystal Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RightSlideViewControllerDelegate <NSObject>

- (void)push:(UIButton*)btn;

@end

@interface RightSlideViewController : UIView
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) UIButton *pushbtn;
@property (strong, nonatomic) UIButton *pushbtn2;

@property (assign, nonatomic) id<RightSlideViewControllerDelegate>delegte;

+(RightSlideViewController*)defaultVC;
+ (void)show;
+ (void)hide;

@end
