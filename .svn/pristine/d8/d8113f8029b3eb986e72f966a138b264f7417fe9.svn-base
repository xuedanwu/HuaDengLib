//
//  UIViewController+Extension.h
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)

- (void)initTabWithTitle:(NSString *)title  Selected:(NSString *)selected  UnSelected:(NSString *)unSelected;

// 结束控制器
- (void)finishViewController;
// 通用web
- (void)gotoWebWithUrl:(NSString *)url;
// 通用web 有标题的
- (void)gotoWebWithUrl:(NSString *)url title:(NSString *)title;
// 显示充值弹框
- (void)showTopUpView;
// 去充值
- (void)gotoRechargeWithIndex:(NSInteger)index;
// 守护
- (void)gotoProtectWithLevel:(NSString *)level toHostUid:(NSString *)hostUid;

// 漂流瓶
- (void)gotoBottleVC;
// 搜索
- (void)gotoSearchVC;
// 去直播间
- (void)gotoLivingWithPassword:(NSString *)password roomID:(NSString *)roomID;

- (void)gotoLivingWithChosenHost:(NSString *)chosen roomID:(NSString *)roomID;


// 开始直播
- (void)startLive;

// 去个人主页
- (void)gotoUserCenterWithUid:(NSString *)uid;
// 视频聊天
- (void)gotoVideoChatWithUid:(NSString *)uid andNickName:(NSString *)name andAvatar:(NSString *)avatar;
// 语音聊天
- (void)gotoVoiceChatWithUid:(NSString *)uid;
// 普通聊天
//- (void)gotoChatWithMessage:(LKNewMessageModel *)message;
// 客服聊天
- (void)gotoSeviceWithStaff_uid:(NSString *)staff_uid;
///男用户和指定主播速配
- (void)gotoSpeedDatingWithUid:(NSString *)uid;
// 速配
- (void)gotoSpeedDating;

// 商城
- (void)gotoMallWithIndex:(NSInteger)index;

// 去实名认证
- (void)gotoAuth;
// 去实名认证已废弃
- (void)gotoAuthWithType:(NSInteger)type;

// 去动态详情
- (void)gotoDynamicWithId:(NSString *)dynamic_id;

// 去编辑资料
- (void)gotoEditUserInfo;

// 去绑定手机
- (void)gotoBindPhoneNumber;

// 举报
- (void)reportUserWithUserId:(NSString *)userId reportType:(NSString *)reportType;

// 发布动态
- (void)gotoPublicDynamic;
// 提现
- (void)gotoCash;

// 钱包  0 金币  1 积分
- (void)gotoWalletWithType:(NSInteger)type;

// 联系人
- (void)gotoContactsIsLiving:(BOOL)isLiving;

// 粉丝榜
- (void)gotoFansRankIsHost:(BOOL)isHost uid:(NSString *)uid;

/**
 *  打开用户私密相册/视频
 */
//- (void)openUserMediaControllerWithUserId:(NSString *)userId mediaType:(KKMediaType)mediaType;
/**
 *  打开钻石排行榜
 */
- (void)openDiamondRankController;
/**
 *  播放视频
 */
- (void)playVideoWithVideoUrl:(NSString *)videoUrl videoCoverImage:(UIImage *)coverImage sourceView:(UIView *)sourceView;

/**
 *  退出登录
 */
- (void)logoutAndPushLogin;

/// 快捷充值
/// @param triggerType 触发类型
//- (void)presentQuickRechargeControllerWithTriggerType:(QuickRechargeTriggerType)triggerType;

@end

NS_ASSUME_NONNULL_END
