//
//  ViewController.m
//  RightSlide
//
//  Created by Mengying Xu on 14-10-23.
//  Copyright (c) 2014年 Crystal Xu. All rights reserved.
//

#import "ViewController.h"
#import "RightSlideViewController.h"
#import "PushViewController.h"
#import "Push2ViewController.h"

@interface ViewController ()<RightSlideViewControllerDelegate>

@property (nonatomic,strong)PushViewController *vc;
@property (nonatomic,strong)Push2ViewController *vc2;
@property (nonatomic,strong)UIViewController *currentVC;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _vc = [[PushViewController alloc] init];
    
    [self addChildViewController:_vc];
    
    _vc2 = [[Push2ViewController alloc] init];
    
    [self addChildViewController:_vc2];

    [self.view addSubview:_vc.view];
    self.currentVC = self.vc;
    
    RightSlideViewController *v = [RightSlideViewController defaultVC];
    v.delegte = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)push:(UIButton*)btn
{
    
    UIViewController *oldVC = self.currentVC;
    
    switch (btn.tag) {
        case 1:
        {
            if([oldVC isEqual:self.vc2])
            {
                return;
            }
            
            [self transitionFromViewController:self.currentVC toViewController:self.vc2 duration:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
                
            } completion:^(BOOL finished) {
                
                if(finished )
                {
                    self.currentVC = self.vc2;
                }
                else
                {
                    self.currentVC = oldVC;
                }
                
            }];
        }
            break;
        case 2:
        {
            if([oldVC isEqual:self.vc])
            {
                return;
            }
            [self transitionFromViewController:self.currentVC toViewController:self.vc duration:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
                
            } completion:^(BOOL finished) {
                
                if(finished)
                {
                    self.currentVC = self.vc;
                }
                else
                {
                    self.currentVC = oldVC;
                }
                
            }];
        }
            break;

        default:
            break;
    }
//    PushViewController *vc = [[PushViewController alloc] init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)rightSlide:(id)sender {
    
//    UIButton *btn = (UIButton*)sender;
//    
//    btn.selected = !btn.isSelected;
//    
//    if(btn.selected == YES)
//    {
        [RightSlideViewController show];

//    }
//    else
//    {
//        [RightSlideViewController show];
//
//    }
    
}


@end
