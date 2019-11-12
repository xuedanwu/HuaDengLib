//
//  HDBaseTabBarCtrl.m
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#import "HDBaseTabBarCtrl.h"

@interface HDBaseTabBarCtrl ()

@end

@implementation HDBaseTabBarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithChildController:(NSArray *)childArray {
    self = [super init];
    if (self) {
        
//        [self addNotification];
        if (childArray.count > 0) {
            self.viewControllers = childArray;
        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (@available(iOS 13.0, * )) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance;
//        appearance.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
        appearance.shadowImage = [UIImage new];
        appearance.shadowColor = kHEXColorWithAlpha(@"#000000", 0.1);
        self.tabBar.standardAppearance = appearance;
        self.tabBar.layer.shadowOffset = CGSizeMake(0, -5);
        self.tabBar.layer.shadowOpacity = 0.1;
        
    } else {
//        [self.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        [self.tabBar setShadowImage:[UIImage new]];
        self.tabBar.layer.shadowColor = kHEXColorWithAlpha(@"#000000", 0.1).CGColor;
        self.tabBar.layer.shadowOffset = CGSizeMake(0, -5);
        self.tabBar.layer.shadowOpacity = 0.1;
    }
    self.tabBar.translucent = NO;
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
