//
//  RightSlideViewController.m
//  RightSlide
//
//  Created by Mengying Xu on 14-10-23.
//  Copyright (c) 2014年 Crystal Xu. All rights reserved.
//

#import "RightSlideViewController.h"
#import "AppDelegate.h"

#define RightSlide_Width 200

@interface RightSlideViewController ()

@end

@implementation RightSlideViewController

- (id)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        //设置位置
        CGRect frame = [[UIScreen mainScreen] bounds];
        self.frame = frame;

        if(!_rightView)
        {
            _rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RightSlide_Width, self.frame.size.height)];
            _rightView.backgroundColor = [UIColor clearColor];
            [self addSubview:_rightView];
        }
       
        if(!_pushbtn)
        {
            _pushbtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 60, 60)];
            _pushbtn.backgroundColor = [UIColor brownColor];
            [_pushbtn setTitle:@"push" forState:UIControlStateNormal];
            [_pushbtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
            _pushbtn.tag = 1;

            [self addSubview:_pushbtn];

        }
        if(!_pushbtn2)
        {
            _pushbtn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 60, 60)];
            _pushbtn2.backgroundColor = [UIColor brownColor];
            [_pushbtn2 setTitle:@"push2" forState:UIControlStateNormal];
            [_pushbtn2 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
            _pushbtn2.tag = 2;
            [self addSubview:_pushbtn2];
            
        }
        self.imageView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.imageView];

    }
    return self;
}
- (void)push:(UIButton*)btn
{
    [UIView animateWithDuration:0
                          delay:0.
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                     } completion:^(BOOL finish){
                         
                         [[RightSlideViewController defaultVC] removeFromSuperview];
                         
                         if(_delegte && [_delegte respondsToSelector:@selector(push:)])
                         {
                             [_delegte push:btn];
                         }
                     }];

}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
        _imageView.frame = self.bounds;
        _imageView.layer.shadowColor = [UIColor grayColor].CGColor;
        _imageView.layer.shadowOffset = CGSizeMake(2, 0);
        _imageView.layer.shadowOpacity = 1;
        _imageView.layer.shadowRadius = 30;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = _imageView.bounds;
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:button];
    }
    return _imageView;
}
- (void)hide
{
    [RightSlideViewController hide];
}
+ (RightSlideViewController*)defaultVC
{
    static RightSlideViewController *vc = nil;
    
    static dispatch_once_t queue;
    
    dispatch_once(&queue, ^{
        
        if(!vc)
        {
            vc = [[RightSlideViewController alloc] init];
        }
        
    });
    
    return vc;
}
+ (void)show
{
    UIWindow *ownwindow = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).window;;

    CGSize size = ownwindow.frame.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [ownwindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [RightSlideViewController defaultVC].imageView.image = viewImage;

    [ownwindow addSubview:[RightSlideViewController defaultVC]];

    [UIView animateWithDuration:0.3
                          delay:0.
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         [RightSlideViewController defaultVC].imageView.transform = CGAffineTransformMakeTranslation(RightSlide_Width, 0);
                         
                     } completion:NULL];

}

+ (void)hide
{
    [UIView animateWithDuration:0.3
                          delay:0.
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                     } completion:^(BOOL finish){
                         
                         [[RightSlideViewController defaultVC] removeFromSuperview];
                        
                     }];

}

@end