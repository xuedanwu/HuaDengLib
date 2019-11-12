//
//  HDBaseTabBarCtrl.h
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDBaseTabBarCtrl : UITabBarController <UITabBarControllerDelegate>

- (instancetype)initWithChildController:(NSArray *)childArray;

@end

NS_ASSUME_NONNULL_END
