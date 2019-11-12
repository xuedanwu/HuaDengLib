//
//  HDLaunchHander.m
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#import "HDLaunchHander.h"

#import "HDFirstPageVC.h"
#import "HDNearbyVC.h"
#import "HDVipVC.h"
#import "HDChatVC.h"
#import "HDMineVC.h"
#import "HDBaseTabBarCtrl.h"

static HDLaunchHander * manger = nil;

@implementation HDLaunchHander

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[self alloc]init];
    });
    return manger;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [super allocWithZone:zone];
    });
    return manger;
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return manger;
}

- (void)hd_launchRootViewController {
    
    [self hd_gotoRoot];
    
    // 广告图
//    [self addLaunchAd];
}

- (void)hd_gotoRoot {
    
    // 判断是否登录  切换root
   if (1) {
//       [self initThird];
       APPDELEGATE.window.rootViewController = [self configTabBarController];
   } else {
//       CTLoginViewController *vcLogin = [CTLoginViewController new];
//       APPDELEGATE.window.rootViewController = [[TMNavigationController alloc] initWithRootViewController:vcLogin];
   }

   [APPDELEGATE.window reloadInputViews];
   [APPDELEGATE.window makeKeyAndVisible];
}

//#pragma mark  登录成功后 设置第三方的东西
//- (void)initThird{
//    // fmdb
//    [self createFMDB];
//    //MQTT
////    [self initIMMQTT];
//    [self performSelectorOnMainThread:@selector(initIMMQTT) withObject:nil waitUntilDone:NO];
//
//    NSString * nickname =  [NSString stringWithFormat:@"ios_%@",LK_WFAccount.nickname];
//    //Zego
//    [ZegoLiveRoomApi setUserID:LK_WFAccount.uid userName:nickname];
//
//    //获取IM消息
//    [self getIMMessageList];
//}

- (HDBaseTabBarCtrl *)configTabBarController {

    HDFirstPageVC * vcMain = [HDFirstPageVC new];
    [vcMain initTabWithTitle:@"首页" Selected:@"icon_home" UnSelected:@"homepage_default"];
    TMNavigationController * main = [[TMNavigationController alloc] initWithRootViewController:vcMain];

    HDNearbyVC * vcRank = [HDNearbyVC new];
    [vcRank initTabWithTitle:@"附近" Selected:@"icon_phb" UnSelected:@"homepage_default"];
    TMNavigationController * rank = [[TMNavigationController alloc] initWithRootViewController:vcRank];

    HDVipVC * vcMessage = [HDVipVC new];
    [vcMessage initTabWithTitle:@"会员" Selected:@"icon_xx" UnSelected:@"homepage_default"];
    TMNavigationController * message = [[TMNavigationController alloc] initWithRootViewController:vcMessage];

    HDChatVC * vcChat = [HDChatVC new];
    [vcChat initTabWithTitle:@"消息" Selected:@"icon_wd" UnSelected:@"homepage_default"];
    TMNavigationController * chat = [[TMNavigationController alloc] initWithRootViewController:vcChat];
    
    HDMineVC * vcMine = [HDMineVC new];
    [vcMine initTabWithTitle:@"我的" Selected:@"icon_wd" UnSelected:@"homepage_default"];
    TMNavigationController * mine = [[TMNavigationController alloc] initWithRootViewController:vcMine];

    NSArray * array = [[NSArray alloc] initWithObjects:main, rank, message, chat, mine, nil];
    HDBaseTabBarCtrl * tab = [[HDBaseTabBarCtrl alloc] initWithChildController:array];
    return tab;
}

//- (void)initIMMQTT{
//    if ([LKMQTTManager getInstance].managerMQTT) {
//        [LKMQTTManager getInstance].managerMQTT.delegate = nil;
//        [LKMQTTManager getInstance].managerMQTT = nil;
//    }
//    [[LKMQTTManager getInstance] initMQTT];
//    [self addAllTopic];
//}
//- (void)presentSpeedDating{
//    // 男用户第一次安装 跳转速配界面
////    NSString * key = [NSString stringWithFormat:@"gotoSpeedDating%@",USERDEFAULTS.user.uid];
////    if (USERDEFAULTS.user.gender.integerValue == 1) {
////        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////            if ([USERDEFAULTS boolForKey:key] == YES) {
////                return ;
////            }
////            [TOP_VIEWCONTROLLER gotoSpeedDating];
////            [USERDEFAULTS setBool:YES forKey:key];
////            [USERDEFAULTS synchronize];
////        });
////    }
//
//    // 跳转到女的pop界面
//     if (USERDEFAULTS.user.gender.integerValue == 1) {
//         [self requestPopSpeedInfo];
//     }
//}
//- (void)addAllTopic {
//    NSArray *aryIMTopic = [CTCommonHelper getChatServerTopic];
//    [[LKMQTTManager getInstance] addMqttTopic:aryIMTopic];
//    WS(ws)
//    [[LKMQTTManager getInstance] getReceiveIMMessageBlock:^(NSData *data) {
//        id dic = nil;
//        if (data) {
//            dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
//        }
//        if (dic == nil) {
//            return;
//        }
//        [ws hangleMessageWithData:data withDic:dic];
//    }];
//}
//- (void)launchTabController {
//
//    [self initThird];
//    APPDELEGATE.window.rootViewController = [self configTabBarController];
//
//
//}

//#pragma mark - ----启动之前拉取会话列表，保存本地数据库======
//- (void)getIMMessageList {
//    NSString *last_time = [[NSUserDefaults standardUserDefaults] objectForKey:@"last_time"];
//    if (!last_time) {
//        last_time = @"0";
//    }
//    [[LKMessageTools defaultTools] getChatListWithLastTime:last_time success:^(id responseObject) {
//
//        LKMessageListModel *listModel = [LKMessageListModel mj_objectWithKeyValues:[responseObject objectForKey:@"chat_list"]];
//        [[NSUserDefaults standardUserDefaults] setObject:listModel.last_time forKey:@"last_time"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//
//        NSArray *aryList = responseObject[@"chat_list"][@"list"];
//        NSArray *arr = [LKNewMessageModel mj_objectArrayWithKeyValuesArray:aryList];
//        for (LKNewMessageModel *model in arr) {
//            @autoreleasepool {
//                [model bg_saveOrUpdateAsync:^(BOOL isSuccess) {
//
//                }];
//            }
//        }
//        // 显示底部未读消息数
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self getNoticeUnRead];
//        });
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"GetMessageListData" object:nil];
//    } fail:^(NSError *error) {
//    }];
//}
//- (void)getNoticeUnRead{
//    kWEAK_SELF
//    [CTNetworkHelper GET:@"/notice/new-notice-count" parameters:@{} success:^(id  _Nonnull responseObject) {
//        NSString * msg = [responseObject[@"new_notice_count"] stringValue];
//        USERDEFAULTS.noticeUnreadMsgCount = msg;
//        [CTCommonHelper showMessageBadgeNumber];
//    } failure:^(NSError * _Nonnull error) {
//    }];
//}
//#pragma mark - FMDB
//- (void)createFMDB{
//    bg_setDebug(NO);
//    /**
//     自定义目录名称(默认BGSqlite)
//     */
//    bg_setSqliteName(kChatListTableName);
//
//    [LKNewMessageModel bg_registerChangeForTableName:kChatListTableName identify:@"change" block:^(bg_changeState result) {
//        switch (result) {
//            case bg_insert:
//                NSLog(@"有数据插入");
//                break;
//            case bg_update:
//                NSLog(@"有数据更新");
//                break;
//            case bg_delete:
//                NSLog(@"有数据删删除");
//                break;
//            case bg_drop:
//                NSLog(@"有表删除");
//                break;
//            default:
//                break;
//        }
//    }];
//
//}
//#pragma mark ----reciveMessage-------
//- (void)hangleMessageWithData:(NSData *)data withDic:(NSDictionary *)dic {
//    if (dic == nil || ![dic isKindOfClass:[NSDictionary class]] || [dic isEqual:@{}]) {
//        return;
//    }
//    dic = [NSDictionary changeType:dic];
//    LKMessageModel *messageModel = [LKMessageModel mj_objectWithKeyValues:dic];
//    IMDataModel *imModel = [IMDataModel mj_objectWithKeyValues:messageModel.data];
//
//    if ([messageModel.uid isEqualToString:LK_WFAccount.uid]) {
//        messageModel.msg_uid = messageModel.to_uid;
//    }else
//        messageModel.msg_uid = messageModel.uid;
//
//    NSString *type = messageModel.type;
//
//    if ([type isEqualToString:CallType_ChatTo] ||
//        [type isEqualToString:CallType_ChatStart] ||
//        [type isEqualToString:CallType_ChatCancel] ||
//        [type isEqualToString:CallType_ChatRefuse] ||
//        [type isEqualToString:CallType_ChatEnd] ||
//        [type isEqualToString:CallType_ChatIn]) {
//        [[LKCallStateTools defaultTools] receiveC2CMessage:dic];
//        return;
//    }
//
//    //输入中状态
//    else if ([type isEqualToString:@"typing"]) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kUserTyping object:dic];
//        return;
//    }
//
//    //五星密友
//    else if ([type isEqualToString:Message_userRelation])
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kUserRelation object:messageModel];
//        return;
//    }
//
//    else if ([type isEqualToString:@"photo_pay"])
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kPhotoPayMessage object:messageModel];
//        return;
//    }
//
//    else if ([type isEqualToString:@"video_pay"])
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kVideoPayMessage object:messageModel];
//        return;
//    }
//
//    else if ([type isEqualToString:@"user_block"])
//    {
//        //封禁后 主播停止速配
//        MBProgressShow(@"您已被封禁");
//        [[NSNotificationCenter defaultCenter] postNotificationName:K_Hose_End_Heart object:nil];
//        [[NSNotificationCenter defaultCenter] postNotificationName:K_Hose_End_Speed_Dating object:nil];
//
//    }
//
//    // 新增类型
//    else if ([type isEqualToString:@"like"]) //点赞
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReciveCommentLikeMessage" object:nil];
//        return;
//    }
//
//    else if ([type isEqualToString:@"comment"]) //评论
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReciveCommentLikeMessage" object:nil];
//        return;
//    }
//
//    /// 首充状态改变
////    else if ([type isEqualToString:@"first_pay"] || [type isEqualToString:@"first_pay_prized"]) {
////        [[NSNotificationCenter defaultCenter] postNotificationName:CTRefreshFirstRechargeGiftStatusNotification object:nil];
////        return;
////    }
//
//    /// 只有text 是需要存储的消息 入表
//    else if ([type isEqualToString:@"text"])
//    {
//        if ([dic[@"data"][@"content"] isEqualToString:@"您已被系统解除锁定。"]) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:K_Hose_Unlock object:nil];
//        }
//
//
//        if ([imModel.data_type isEqualToString:Message_gift])
//        {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kReceivedGiftMessage object:dic];
//        }
//
//        // 保存消息
//        [messageModel bg_saveOrUpdateAsync:^(BOOL isSuccess) {
//
//        }];
//
//        // 发送通知
//        [[NSNotificationCenter defaultCenter] postNotificationName:kIMReceiveNewMessage object:messageModel];
//
//        //  push == 1 展示弹窗
//        if (messageModel.push.intValue == 1) {
//            // 视频聊不谈  聊天中不谈
//            // 用户设置弹出提醒
//            if ([USERDEFAULTS boolForKey:CTShouldShowMessageTipsKey]) {
//                if (![TOP_VIEWCONTROLLER isKindOfClass:CTVideoTalkViewController.class] && ![TOP_VIEWCONTROLLER isKindOfClass:ChatViewController.class]) {
//                    [CTNewMessageTipWindow showMessageTipWith:messageModel];
//                }
//            }
//
//
//        }
//
//
//        if (!messageModel || !messageModel.uid) {
//            return;
//        }
//        LKNewMessageModel *chatListModel = [LKNewMessageModel new];
//        chatListModel.last_time = messageModel.created_at_ms;
//        chatListModel.updated_at = messageModel.created_at_ms;
//        chatListModel.uid = messageModel.msg_uid;
//
//        if ([messageModel.uid isEqualToString:LK_WFAccount.uid]) {
//            chatListModel.avatar = messageModel.to_avatar;
//            chatListModel.nickname = messageModel.to_nickname;
//        }else{
//            chatListModel.avatar = messageModel.avatar;
//            chatListModel.nickname = messageModel.nickname;
//        }
//        if (imModel) {
//            chatListModel.unreads = 1;
//        }
//
//        NSMutableDictionary *dicMu = [NSMutableDictionary dictionaryWithDictionary:messageModel.data];
//        NSString *content = [CTCommonHelper getChatListLastMsgWith:messageModel.data];
//        [dicMu setObject:content forKey:@"content"];
//        chatListModel.last_msg = dicMu;
//        chatListModel.chat_type = messageModel.msg_uid.integerValue > 0 ? @"user" : @"system";
//        if ([chatListModel.chat_type isEqualToString:@"user"]) {
//            if (![messageModel.uid isEqualToString:LK_WFAccount.uid]) {
//                //播放新消息提示音
//                static SystemSoundID soundIDTest = 0;//当soundIDTest == kSystemSoundID_Vibrate的时候为震动
//                NSString * path = [[NSBundle mainBundle] pathForResource:@"msg" ofType:@"wav"];
//                if (path) {
//                     AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundIDTest);
//                }
//                AudioServicesPlaySystemSound(soundIDTest);
//            }
//        }
//        NSString *whereStr = [NSString stringWithFormat:@"where %@>0 and %@=%@",bg_sqlKey(@"unreads"),bg_sqlKey(@"uid"),chatListModel.uid];
//        [LKNewMessageModel bg_findAsync:nil where:whereStr complete:^(NSArray * _Nullable array) {
//            if (array.count > 0) {
//                for (LKNewMessageModel *model in array) {
//                    NSInteger unreads = model.unreads + 1;
//                    chatListModel.unreads = unreads;
//                    [chatListModel bg_saveOrUpdateAsync:^(BOOL isSuccess) {
//                    }];
//                }
//            }
//        }];
//
//        [[NSUserDefaults standardUserDefaults] setObject:chatListModel.last_time forKey:@"last_time"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReciveNewMessage" object:chatListModel];
//
//
//        [chatListModel bg_saveOrUpdateAsync:^(BOOL isSuccess) {
//            //更新未读数量 消息列表小红点显示等
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"unReadMessageCount" object:nil];
//        }];
//
//        if ([self runningInBackground]) {
//            if (IOS_10_OR_LATER) {
//                [[LKLocalNotification shareNotification] sendLocationNotification:1 msgModel:messageModel];
//            }else{
//                [[LKLocalNotification shareNotification] sendLocationNotificationInOldWay:1 msgModel:messageModel];
//            }
//        }
//    }
//
//
//}
//
//
//- (BOOL)runningInBackground {
//    UIApplicationState state = [UIApplication sharedApplication].applicationState;
//    BOOL result = (state == UIApplicationStateBackground);
//    return result;
//}
//
//
//
//- (void)gotoRoot {
//    // 判断是否登录  切换root
//    if (USERDEFAULTS.user.uid) {
//        [self initThird];
//        APPDELEGATE.window.rootViewController = [self configTabBarController];
//    } else {
//        CTLoginViewController *vcLogin = [CTLoginViewController new];
//        APPDELEGATE.window.rootViewController = [[TMNavigationController alloc] initWithRootViewController:vcLogin];
//    }
//
//    [APPDELEGATE.window reloadInputViews];
//    [APPDELEGATE.window makeKeyAndVisible];
//
//}
//
//#pragma mark 添加启动广告
//- (void)addLaunchAd{
//
//    NSDictionary *dictADCaches = [[NSUserDefaults standardUserDefaults] objectForKey:@"LiaoKeLaunchCaches"];
//    if (dictADCaches) {
//        self.dicSplash = dictADCaches[@"splash_ad"];
//        if (self.dicSplash) {
//            self.adSecond = [self.dicSplash[@"time"]  integerValue] / 1000;
//            NSInteger is_show = [self.dicSplash[@"is_show"]  integerValue];
//            if ( is_show == 1) {
//
//            }
//        }else{
//            return;
//        }
//
//    }else{
//        return;
//    }
//
//    ////重置上次打开的时间为广告的时间
//    NSDate *last = [NSDate date];
//    [[NSUserDefaults standardUserDefaults] setObject:last forKey:@"LastAdShowDate"];
//
//    self.viAd = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.viAd.backgroundColor = [UIColor clearColor];
//    self.viAd.userInteractionEnabled = YES;
//    self.viAd.tag = 100;
//    [APPDELEGATE.window addSubview:self.viAd];
//    [APPDELEGATE.window bringSubviewToFront:self.viAd];
//
//    NSString *key = [NSString stringWithFormat:@"%dx%d", (int)SCREEN_WIDTH, (int)SCREEN_HEIGHT];
//
//    NSDictionary *dictBundleBG = @{@"320x480" : @"LaunchImage-700", @"320x568" : @"LaunchImage-700-568h", @"375x667" : @"LaunchImage-800-667h", @"414x736" : @"LaunchImage-800-Portrait-736h"};
//
//    UIImageView *imgvADBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.viAd.frame.size.width, self.viAd.frame.size.height)];
//    imgvADBG.image = [UIImage imageNamed:[dictBundleBG objectForKey:key]];
//    imgvADBG.userInteractionEnabled = YES;
//    [self.viAd addSubview:imgvADBG];
//
//    UIImageView *imgvAD = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    imgvAD.clipsToBounds = YES;
//    imgvAD.contentMode = UIViewContentModeScaleAspectFill;
//    [self.viAd addSubview:imgvAD];
//
//    //add constraints
//    imgvAD.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.viAd addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[ad]|" options:0 metrics:nil views:@{@"ad":imgvAD}]];
//    [self.viAd addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|[ad]-%d-|",(int)(0)] options:0 metrics:nil views:@{@"ad":imgvAD}]];//ScreenHeight*0.195
//
//    self.btnClose = [UIButton new];
//    self.btnClose.layer.cornerRadius = 12;
//    self.btnClose.clipsToBounds = YES;
//    self.btnClose.titleLabel.font = Font(12);
//    [self.btnClose setTitleColor:HEXColor(@"FFFFFF") forState:UIControlStateNormal];
//    self.btnClose.backgroundColor = HEXColorWithAlpha(@"FFFFFF", 0.16);
//    [self.viAd addSubview:self.btnClose];
//    [self.btnClose addTarget:self action:@selector(closeAdImage:) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.viAd.mas_top).offset([CTCommonHelper getStatusBarHeight] + 14);
//        make.right.equalTo(self.viAd.mas_right).offset(-20);
//        make.width.mas_equalTo(56);
//        make.height.mas_equalTo(24);
//    }];
//
//    self.btnDetail = [UIButton new];
//    self.btnDetail.layer.cornerRadius = 13;
//    self.btnDetail.clipsToBounds = YES;
//    self.btnDetail.hidden = YES;
//    self.btnDetail.titleLabel.font = Font(12);
//    [self.btnDetail setTitle:@"查看详情" forState:UIControlStateNormal];
//    [self.btnDetail setTitleColor:HEXColor(@"FFFFFF") forState:UIControlStateNormal];
//    self.btnDetail.backgroundColor = HEXColorWithAlpha(@"FFFFFF", 0.4);
//    [self.viAd addSubview:self.btnDetail];
//    [self.btnDetail addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.btnDetail mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.viAd.mas_bottom).offset(-108*LKScaleY);
//        make.right.equalTo(self.viAd.mas_right).offset(-20);
//        make.width.mas_equalTo(70);
//        make.height.mas_equalTo(26);
//    }];
//    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"DefaultLaunchImage" ofType:@"png"];;//从bundle中获取文件
//    if (dictADCaches) {
//        self.dicSplash = dictADCaches[@"splash_ad"];
//        NSString *strUrl = self.dicSplash[@"url"];
//        if (strUrl && strUrl.length > 0 && LK_WFAccount.token) {
//            self.btnDetail.hidden = NO;
//        }
//        if (self.dicSplash) {
//            NSInteger is_show = [self.dicSplash[@"is_show"]  integerValue];
//            self.adSecond = [self.dicSplash[@"time"]  integerValue] / 1000;
//            [self.btnClose setTitle:[NSString stringWithFormat:@"跳过 %ld",self.adSecond] forState:UIControlStateNormal];
//            if (is_show == 1) {
//                NSString * netURL = [CTCommonHelper ishasPacHttps:self.dicSplash[@"image"]];
//                if (netURL) {
//                    strPath = [netURL launchCache];//从cache中获取
//                    BOOL hasImage = [[NSFileManager defaultManager] fileExistsAtPath:strPath];
//                    // 没有就不显示
//                    if (!hasImage) {
//                        strPath = [[NSBundle mainBundle] pathForResource:@"DefaultLaunchImage" ofType:@"png"];
//                    }else{
//
//                    }
//                }
//            }
//        }
//    }
//    imgvAD.image = [UIImage imageWithContentsOfFile:strPath];
//    [self addLauchTimer];
//}
//- (void)addLauchTimer{
//    if (self.timerAd ) {
//        [self.timerAd invalidate];
//        self.timerAd = nil;
//    }
//    self.timerAd = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshSecond) userInfo:nil repeats:YES];
//}
//- (void)refreshSecond{
//    self.adSecond --;
//    [self.btnClose setTitle:[NSString stringWithFormat:@"跳过 %ld",self.adSecond] forState:UIControlStateNormal];
//    if (self.adSecond <= 0) {
//        if (self.timerAd ) {
//            [self.timerAd invalidate];
//            self.timerAd = nil;
//        }
//        [self.viAd removeFromSuperview];
//    }
//}
//- (void)showDetailVC {
//    [self removeLaunchAd:self.viAd];
//    [TOP_VIEWCONTROLLER gotoWebWithUrl:self.dicSplash[@"url"] title:self.dicSplash[@"title"]];
//
//}
//- (void)closeAdImage:(UIButton *)btn{
//    if (self.timerAd ) {
//        [self.timerAd invalidate];
//        self.timerAd = nil;
//    }
//    [self.viAd removeFromSuperview];
//}
//- (void)removeLaunchAd:(UIView *)vi{
//    if (self.timerAd ) {
//        [self.timerAd invalidate];
//        self.timerAd = nil;
//    }
//    [vi removeFromSuperview];
//}
//
//
//
//
//
//
//
//
//
//
//#pragma mark 请求自动视频弹框信息
//
//- (void)requestPopSpeedInfo {
//    kWEAK_SELF
//    [CTNetworkHelper GET:API_SPEED_POP_CHAT parameters:@{} success:^(id  _Nonnull responseObject) {
//        NSString *state = responseObject[@"pop_param"][@"state"];
//        NSString *interval = responseObject[@"pop_param"][@"interval"];
//        NSString *display_time = responseObject[@"pop_param"][@"display_time"];
//        self.displayTime = display_time.integerValue;
//
//        NSDictionary *user_data = responseObject[@"user_data"];
//
//        if ([state isEqualToString:@"1"]) { // 如果是1 继续请求 根据后台 无限请求
//            NSInteger timeSpace = interval.doubleValue;
//            if (timeSpace < display_time.doubleValue) {
//                timeSpace = display_time.doubleValue + 5;
//            }
////            if (![TOP_VIEWCONTROLLER isKindOfClass:CTVideoTalkViewController.class]) {
//                [weakSelf performSelector:@selector(requestPopSpeedInfo) withObject:nil afterDelay:timeSpace];
////            }
//        }else {
//            // 不继续请求
//        }
//        if ([user_data isKindOfClass:[NSDictionary class]] && ![user_data isEqualToDictionary:@{}]) { // 跳转到通话界面
//            NSLog(@"%@",NSStringFromClass(TOP_VIEWCONTROLLER.class));
//            UIViewController * root = TOP_VIEWCONTROLLER;
//            if (![root isKindOfClass:CTVideoTalkViewController.class] && ![root isKindOfClass:CTSpeedPopViewController.class] && ![root isKindOfClass:CTRechargeViewController.class]&& ![root isKindOfClass:LiveViewController.class]) {
//                [weakSelf gotoPopSpeed:user_data];
//            }
//        }
//
//    } failure:^(CTBaseError * _Nonnull error) {
//
//    }];
//
//}
//
//- (void)gotoPopSpeed:(NSDictionary *)dic {
//
//    CTSpeedPopViewController *vc = [CTSpeedPopViewController new];
//    CTSpeedDatingModel * model = [CTSpeedDatingModel mj_objectWithKeyValues:dic];
//    model.uid = dic[@"id"];
//    vc.entity = model;
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:NO];
//
//    if (self.callPopTimer) {
//        [self.callPopTimer invalidate];
//        self.callPopTimer = nil;
//    }
//
//    self.callPopTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.callPopTimer forMode:NSRunLoopCommonModes];
//    [self.callPopTimer fire];
//}
//
//- (void)countTime {
//
//    self.displayTime --;
//
//    if (self.displayTime <= 0) {
//        if ([TOP_VIEWCONTROLLER isKindOfClass:CTSpeedPopViewController.class]) {
//            [TOP_VIEWCONTROLLER finishViewController];
//        }
//    }
//
//
//}
//
//
//
//
//
//
//- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [self.timerAd invalidate];
//    self.timerAd = nil;
//    [self.callPopTimer invalidate];
//    self.callPopTimer = nil;
//}

@end
