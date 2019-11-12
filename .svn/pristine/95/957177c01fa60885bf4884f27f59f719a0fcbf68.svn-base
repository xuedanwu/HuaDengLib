//
//  HDFoundation.h
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#ifndef HDFoundation_h
#define HDFoundation_h

#define LKScale  SCREEN_WIDTH / 667.0
#define LKScaleX  SCREEN_WIDTH / 375.0
#define LKScaleY  SCREEN_WIDTH / 667.0
/******************** font ********************************/
#define kAppLargeTextFont       [UIFont systemFontOfSize:16]
#define kAppMiddleTextFont      [UIFont systemFontOfSize:14]
#define kAppSmallTextFont       [UIFont systemFontOfSize:12]

#define WS(weakSelf)  __weak __typeof(self)weakSelf = self;

#define LKColorWithHexString(_message_)  [UIColor colorWithHexString:_message_  alpha:1.0]

// 暂未用到
#define kAppBakgroundColor          LKColorWithHexString(@"#F9F7F8")
#define kAppModalBackgroundColor    [kBlackColor colorWithAlphaComponent:0.6]
#define kAppModalDimbackgroundColor [RGB(16, 16, 16) colorWithAlphaComponent:0.3]

#define LK_Red_Color @"FF4D80" // FF4D80 EC398D
#define LK_Yellor_Color @"FFAB00"
#define The_Common_State @"The_Common_State"
#define LK_Cell_Line_Color kHEXColor(@"DDDDDD")
#define LKCellSepColor kHEXColor(@"EFEFEF")
#define LK_Custom_Red_Color kHEXColor(@"FF4D80")

#define LK_Custom_Silver_Color kHEXColor(@"4383D9")
#define LK_Custom_Yellor_Color kHEXColor(@"E09450")
#define LK_Custom_Purple_Color kHEXColor(@"A540E0")

//黑色背景色
#define LK_Black_Background_Color kHEXColor(@"#201C28")//
#define LK_Black_Background_Cell_Color kHEXColor(@"#312C3A")
#define LK_Black_Background_BG kHEXColor(@"#292432")


//主题色
#define ThemeColor [CTCommonHelper hexStringToColor:@"#FF4D80"]
#define Font(f) [UIFont systemFontOfSize:f]
#define FontBold(f) [UIFont boldSystemFontOfSize:f]
#define HEXColor(hex) [UIColor colorWithHexString:hex alpha:1.0]
#define HEXColorWithAlpha(hex,a) [UIColor colorWithHexString:hex alpha:a]

// 屏幕宽、高
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define LK_WFAccount   USERDEFAULTS.user
#define CT_ISComment  NO

#define LKBeauty_Effect_DownComplite @"LKBeauty_Effect_DownComplite"                // 美颜特效包下载完成
#define LkSex @"sex"                                        //性别
#define LKfireWorks @"fireWorks"                            //烟花
#define LKLiveGiftEffect @"liveGiftEffect"                  //直播间美颜礼物
#define LKGiftVideoEffect @"Gift_Video_Effect"              //美颜礼物Array
#define LKsignature @"signature"                            //阿里云
#define LKtls_sign @"tls_sign"                              //登陆腾讯获取的 tls_sign
#define LKgiftLastDate @"giftLastDate"                      //礼物时间储存
#define LKgiftLastTimeString @"giftLastTimeString"          //礼物时间转化
#define LKrewardLastDate @"rewardLastDate"                  //中奖时间储存
#define LKrewardLastTimeString @"rewardLastTimeString"      //中奖时间转化
#define LKsendGift @"sendGift"                              //直播直播间送礼物 收礼物人 id
#define LKgiftTag @"giftTag"                                //间送礼物 送的最后一次礼物

/*
 消息自定义类型 ---
 */
#define Message_tip                     @"tip"
#define Message_text                    @"text"
#define Message_notice                  @"notice"
#define Message_typing                  @"typing"
#define Message_gift                    @"gift"
#define Message_avchat                  @"av_chat"
#define Message_privatephoto            @"private_photo"
#define Message_privatevideo            @"private_video"
#define Message_callcheck               @"call_check"
#define Message_photopay                @"photo_pay"
#define Message_videopay                @"video_pay"
#define Message_userRelation            @"user_relation"
#define Message_privatepay              @"private_pay"
#define Message_UserRelation            @"User_relation"
#define Message_private_gif             @"gif_face"

#define kNofificationUid                @"kNofificationUid"
#define kIsReceiveNotifcation           @"kIsReceiveNotifcation"
#define kIsFromChatVC                   @"kIsFromChatVC"
#define kPushToAimplace                 @"kPushToAimplace"
#define kRefrechMoney                   @"kRefrechMoney"
#define kRemoveChatRecode               @"kRemoveChatRecode"
#define kNowNickName                    @"kNowNickName"

#define kIMReceiveNewMessage            @"kIMReceiveNewMessage"


#define kChatViewTextViewDoneNotifcation @"kChatViewTextViewDoneNotifcation"
#define LK_HEIGHT(_Height_)   _Height_.frame.origin.y + _Height_.frame.size.height
#define LK_WIDTH(_width_)   _width_.x + _width_.width

#define LKAnimatedViewTag  88000

#define LKNormalViewTag 88001

#define LKUserDefaults    [NSUserDefaults standardUserDefaults]
#define LKWinow [UIApplication sharedApplication].delegate.window

//固定高度
#define kStatus  (kDevice_Is_iPhoneX ? 44 : 20)
#define kTitle 44
#define kToolBar   (kDevice_Is_iPhoneX ? (49 + 34)  : 49)
#define kNav  (kDevice_Is_iPhoneX ? 88 :  64)
#define kChatHeadHeight  (LK_WFAccount.gender.intValue == 2 ? 48 : 0)

//私聊界面底部输入框高度
#define kChatInputViewHeight 100

// 聊天消息文字颜色
#define kMSG_TEXT_COLOR kHEXColorWithAlpha(@"#000000", 0.8)
// 聊天默认背景色
#define kMSG_BACK_COLOR kHEXColorWithAlpha(@"#F7F7F7", 1)

#define LKSkillGiftTag @"SkillGiftTag"    // 主播才艺 送礼物 送的最后一次礼物


#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS_10_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS_11_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define IOS_12_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0)


#define iPhone4 CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size)
#define iPhone5 CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size)
#define iPhone6 CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size)
#define iPhone6P CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size)
#define iPhoneX CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size)
#define iPhoneXR CGSizeEqualToSize(CGSizeMake(414, 896), [[UIScreen mainScreen] bounds].size)
#define iPhoneXSMAX CGSizeEqualToSize(CGSizeMake(621, 1334), [[UIScreen mainScreen] bounds].size)


// 重写系统的DEBUG
#if DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"function:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#define Version  [CTCommonHelper getVersion]
#define BuildName [CTCommonHelper getBuildName]   //@"ios"  dev
#define Build  [CTCommonHelper getBuild]  //@"ios_inhouse"
//#define Build  @"ios_inhouse"

#define APP_VS [CTCommonHelper getAPPVS]



//WEBUrl 中包含此字符 则用uid替换
#define URL_REPLACE_UID  @"[[uid]]"
//WEBUrl 中不包含此字符串的则添加token
#define NO_FOLLOW_LK_TOKEN  @"no-follow-lk-token=1"
#define ShareSDKAppKey @"224b36cb16a16"
#define ShareSDKAppSercret @"5e59556158a8339d7311b76fbcf33713"
#define AppURLSchemes  @"liaoke"
#define AppItunesURL @"https://itunes.apple.com/app/id1434254199"


// 获取版本 CFBundleShortVersionString 获取build版本 CFBundleVersion
#define APP_Version   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_Channel_Code @"AppStore"
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_SCHEMES  [[[NSBundle mainBundle].infoDictionary[@"CFBundleURLTypes"] firstObject][@"CFBundleURLSchemes"] firstObject]


#define APPDELEGATE   ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define KEY_WINDOW  [[UIApplication sharedApplication] keyWindow]
#define ROOT_VIEWCONTROLLER  [[UIApplication sharedApplication] keyWindow].rootViewController
#define ROOT_VIEW  ROOT_VIEWCONTROLLER.view
#define TOP_VIEWCONTROLLER [CTCommonHelper getTopViewController]
#define USERDEFAULTS  [NSUserDefaults standardUserDefaults]
#define BUNDLE_ID [[NSBundle mainBundle] bundleIdentifier]
#define SYSTEM_VERSION  [[UIDevice currentDevice] systemVersion]

//----------------------------------------------------------------
// iphonex
#define kDevice_Is_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define kStatusBarHeight   (kDevice_Is_iPhoneX ? 44.f : 20.f)

#define kNavigationBarHeight  44.f

#define kTopBarHeight      (kDevice_Is_iPhoneX ? 88.f : 64.f)

#define kTabbarHeight         (kDevice_Is_iPhoneX ? (49.f+34.f) : 49.f)

#define kTabbarSafeBottomMargin         (kDevice_Is_iPhoneX ? 34.f : 0.f)

// --------------
#define LKReceiveingNotificationCenter(_name_) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notice:) name:_name_ object:nil];
#define LKSendingNotificationCenter(_name_,_info_)  [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:_name_ object:nil userInfo:_info_]];


#define NULLString(string) (![string isKindOfClass:[NSString class]] || [string isEqualToString:@""] || (string == nil) || [string isEqualToString:@"(null)"] || [string isKindOfClass:[NSNull class]] || [string isEqualToString:@"<null>"] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)



//----------------------------------------------------------------

#define kCountSize(size)  (size * (360/SCREEN_WIDTH))
#define kImageNamed(name)   [UIImage imageNamed:name]

#define MBShowHUDToView [MBManager showLoadingInView:KEY_WINDOW]; //[MBManager showWaitingWithTitle:@"加载中..."]; [MBManager showLoadingInView:self.view]; [MBManager showLoading]
#define MBShowStartPayToView [MBManager showWaitingWithTitle:@"正在支付..."];
#define MBHideWithView  [MBManager hideAlert];
#define MBHOUTextOnly(_message_)  [MBManager showBriefAlert:_message_];
#define MBProgressShowText(_message_)  [MBManager showBriefAlert:_message_];
#define MBProgressShow(_message_) [MBManager showBriefAlert:_message_]


// 颜色 字体
#define kColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kHEXColor(hex) [UIColor colorWithHexString:hex alpha:1.0]
#define kHEXColorWithAlpha(hex,a) [UIColor colorWithHexString:hex alpha:a]

#define kThemeColor kHEXColor(@"#FF4181")

#define kThemeEndColor kHEXColor(@"#FFA940")

#define kSystemFontSize(size)    [UIFont systemFontOfSize:size]
#define kBoldSystemFontSize(size)    [UIFont pingFangSCSemiboldFontWithSize:size]
#define kMediumFontSize(size)    [UIFont systemFontOfSize:size weight:UIFontWeightMedium]
#define kFamilyFont(fsize, name) [UIFont fontWithName:name size:fsize]
#define kFont(f) [UIFont fontWithName:@"PingFangSC-Regular" size:f]
// DINCondensed-Bold
#define kDINCondensedBold(fsize)  kFamilyFont(fsize, @"DINCondensed-Bold")


//弱引用
#define kWEAK_SELF __weak typeof(self) weakSelf = self;
#define kSTRONG_SELF __strong typeof(self) strongSelf = weakSelf;

#endif /* HDFoundation_h */
