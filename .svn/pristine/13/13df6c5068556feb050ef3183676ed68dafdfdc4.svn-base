//
//  HDBaseVC.m
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#import "HDBaseVC.h"

@interface HDBaseVC ()

@end

@implementation HDBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self viewWillAppear:animated WithTitleColor:kColorFromRGB(0x000000) TitleBackgroundColor:kColorFromRGB(0xffffff)];
}

- (void)viewWillAppear:(BOOL)animated WithTitleColor:(UIColor *)titleColor TitleBackgroundColor:(UIColor *)backgroundColor {
    [super viewWillAppear:animated];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if ([backgroundColor isEqual:kColorFromRGB(0xf22f4a)]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }else{
        if (@available(iOS 13.0, *)) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        } else {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        }
        [self setTitleColor:titleColor TitleBackgroundColor:backgroundColor];
    }
#pragma clang diagnostic pop
    
//    [MobClick beginLogPageView:NSStringFromClass([self class])];
    [self setTitleColor:titleColor TitleBackgroundColor:backgroundColor];
    
    
}
- (void)setTitleColor:(UIColor *)titleColor TitleBackgroundColor:(UIColor *)backgroundColor {
    self.navigationBarTitleColor = titleColor;
    self.navigationBarBackgroundColor = backgroundColor;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [MobClick endLogPageView:NSStringFromClass([self class])];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
