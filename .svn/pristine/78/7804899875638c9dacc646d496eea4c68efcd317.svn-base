//
//  UIViewController+Extension.m
//  HuaDeng
//
//  Created by  Aaron on 2019/11/11.
//  Copyright © 2019  Aaron. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

//+ (void)load {
//    ExchangeImplementations(UIViewController.class, @selector(modalPresentationStyle), @selector(hk_modalPresentationStyle));
//}
//
//- (UIModalPresentationStyle)hk_modalPresentationStyle {
//    if ([self isKindOfClass:UIAlertController.class]) {
//        return [self hk_modalPresentationStyle];
//    }
//    return UIModalPresentationFullScreen;
//}

- (void)initTabWithTitle:(NSString *)title  Selected:(NSString *)selected  UnSelected:(NSString *)unSelected {
    UIImage * image = [[UIImage imageNamed:unSelected]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image_select = [[UIImage imageNamed:selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setTabWithTitle:title selectedImage:image_select unSelectedImage:image];
}

- (void)setTabWithTitle:(NSString*)title selectedImage:(UIImage*)selected unSelectedImage:(UIImage*)unSelected{
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:unSelected selectedImage:selected];
//    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -13)];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);
//    NSDictionary *dict_select =  @{NSForegroundColorAttributeName : kColorFromRGB(0xFF4D81),NSFontAttributeName : [UIFont boldSystemFontOfSize:12.0]};
//    [self.tabBarItem setTitleTextAttributes:dict_select  forState:UIControlStateSelected];
//    NSDictionary *dict_unselect =  @{NSForegroundColorAttributeName : kColorFromRGB(0x93989e),NSFontAttributeName : [UIFont boldSystemFontOfSize:10.0]};
//    [self.tabBarItem setTitleTextAttributes:dict_unselect  forState:UIControlStateNormal];
}

- (void)finishViewController {
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
//        if ([TOP_VIEWCONTROLLER isKindOfClass:[UIAlertController class]]) {
//            [self dismissViewControllerAnimated:YES completion:^{
//                [self dismissViewControllerAnimated:YES completion:nil];
//            }];
//        }else {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
//        }
    }
}
- (void)gotoWebWithUrl:(NSString *)url {
//    CTWebViewController * vc = [[CTWebViewController alloc] init];
//    vc.strUrl = url;
//    [self.navigationController pushViewController:vc animated:YES];
}
- (void)gotoWebWithUrl:(NSString *)url title:(NSString *)title{
//    CTWebViewController * vc = [[CTWebViewController alloc] init];
//    vc.strUrl = url;
//    vc.strNavTitle = title;
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
}
- (void)gotoRechargeWithIndex:(NSInteger)index {
    
//    CTRechargeViewController * vc = [CTRechargeViewController new];
//    vc.selectedIndex = index;
//    [self.navigationController pushViewController:vc animated:YES];
}
// level 空 是从聊天进到守护  level存在表明从直播间进的
- (void)gotoProtectWithLevel:(NSString *)level toHostUid:(NSString *)hostUid {
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@?p=ios&v=%@&c=%@&token=%@&to_uid=%@&created_in=chat",Host_server,lk_Ward_Index,Version,Build,LK_WFAccount.token,hostUid];
//    if (level && level.length) {
//        urlStr = [NSString stringWithFormat:@"%@%@?p=ios&v=%@&c=%@&token=%@&to_uid=%@&created_in=room&level=%@",Host_server,lk_Ward_Index,Version,Build,LK_WFAccount.token,hostUid,level];
//    }
//    CTWebViewController *vcWeb = [CTWebViewController new];
//    vcWeb.strUrl = urlStr;
//    vcWeb.strNavTitle = @"守护";
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vcWeb animated:YES];
}

- (void)gotoLivingWithChosenHost:(NSString *)chosen roomID:(NSString *)roomID {
    [self requestRoomInfoWithPassword:@"" chosen:chosen roomID:roomID];

}

- (void)gotoLivingWithPassword:(NSString *)password roomID:(NSString *)roomID{
    if (!roomID || roomID.length==0) {
        return;
    }
    [self requestRoomInfoWithPassword:password chosen:@"" roomID:roomID];
}
- (void)requestRoomInfoWithPassword:(NSString * )password chosen:(NSString *)chosen roomID:(NSString *)roomID{
//    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if (deleage.isHaveSmall) {
//        // 判断跳转的是否是同一间房间
//        if ([deleage.floatWindow.room_id isEqualToString:roomID]) {
//            [deleage.floatWindow returnLiveVC];
//            return;
//        }
//        if ([LKLiveMicTools defaultMicTools].connectState == MIC_STATES_Host ||
//            [LKLiveMicTools defaultMicTools].connectState == MIC_STATES_VoiceHost) {
//            MBProgressShow(@"您当前正在直播/语聊中");
//            return;
//        }
//    }
//    MBShowHUDToView
//    kWEAK_SELF
//    [LKLiveTool visitorEnteringingVoiceRoomID:roomID password:password Success:^(NSDictionary *dic) {
//        if ([dic[@"status"] isEqualToString:@"ok"]) {
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//                CTLiveModel *item = [CommonTools hk_getCustomLiveItemFromRoomInDic:dic coinsString:LK_WFAccount.coins];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    MBHideWithView;
//                    [weakSelf closeSmallWindow];
//                    // 关闭其他房间
//                    deleage.floatWindow.room_id = roomID;
//
//                    // 初始化LIVE
//                    LiveViewController * liveVC = [[LiveViewController alloc] init];
//                    liveVC.hidesBottomBarWhenPushed = YES;
//                    liveVC.liveItem = item;
//                    liveVC.chosenType = chosen;
//                    liveVC.roomInDic = [dic mutableCopy];
//                    liveVC.room_roadDic = dic[@"room_road"];
//                    liveVC.ward_data = dic[@"ward_data"];
//#ifdef DEBUG
//
//                    NSString * roomServer = dic[@"room_server"];
//                    [SVProgressHUD showSuccessWithStatus:roomServer];
//#endif
//                    if ([dic[@"room_type"] containsString:@"voice"]) {
//                        liveVC.isVoiceRoom = YES;
//                    }else{
//                        if (dic[@"pk_info"]) {
//                            NSString * stage = dic[@"pk_info"][@"stage"];
//                            if (stage.integerValue > 0) {
//                                liveVC.roomType = LKRoomTypePK;
//                            }else{
//                                liveVC.roomType = LKRoomTypeLiving;
//                            }
//                        }else{
//                            liveVC.roomType = LKRoomTypeLiving;
//                        }
//                        liveVC.isVoiceRoom = NO;
//                    }
//                    NSMutableArray *viewControllers = TOP_VIEWCONTROLLER.navigationController.viewControllers.mutableCopy;
//                    UIViewController *visiableViewController = TOP_VIEWCONTROLLER;
//                    for (UIViewController *vc in visiableViewController.navigationController.viewControllers) {
//                        if ([vc isKindOfClass:[LiveViewController class]]) {
//                            // 移除上个直播间
//                            [self stopAndRemoveLastLiveViewController:(LiveViewController *)vc];
//                            NSInteger index = [visiableViewController.navigationController.viewControllers indexOfObject:vc];
//                            [viewControllers replaceObjectAtIndex:index withObject:liveVC];
//                            [visiableViewController.navigationController setViewControllers:viewControllers.copy];
//                            [visiableViewController.navigationController popToViewController:liveVC animated:YES];
//
//                            return ;
//                        }
//                    }
//                    [TOP_VIEWCONTROLLER.navigationController pushViewController:liveVC animated:NO];
//                });
//            });
//        } else {
//            MBHideWithView;
//            if ([dic[@"err_code"] isEqualToString:@"need_vip"]) {
//                __weak typeof(self) weakSelf = self;
//                UIAlertController *alterViewC = [UIAlertController alertControllerWithTitle:@"" message:dic[@"err_msg"] preferredStyle:UIAlertControllerStyleAlert];
//                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                }];
//                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"升级VIP" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//                    [weakSelf gotoRechargeWithIndex:1];
//                }];
//                [alterViewC addAction:cancel];
//                [alterViewC addAction:sure];
//                [weakSelf presentViewController:alterViewC animated:YES completion:nil];
//            }else if ([dic[@"err_code"] isEqualToString:@"password_error"]) {
//                MBHOUTextOnly(dic[@"err_msg"]);
//            }else if ([dic[@"err_code"] isEqualToString:@"need_password"]) {
//                [weakSelf showVoiceEnterPaaswordViewWithRoomId:roomID];
//            }else {
//                MBHOUTextOnly(dic[@"err_msg"]);
//            }
//        }
//    } failed:^(NSString *repMesg) {
//        MBHideWithView;
//    }];
}

//- (void)stopAndRemoveLastLiveViewController:(LiveViewController *)vc {
//    for (ZegoStream *stream in vc.streamList) {
//        [[ZegoDemoHelper api] stopPlayingStream:stream.streamID];
//    }
//    [vc hk_releaseStreamView];
//    if ([LKLiveSDKTools defaultTools].sdkType == LKSDKType_ZEGO) {
//        // 停止PK对方的拉流
//        [[ZegoDemoHelper api] stopPlayingStream:vc.otherHostLiveCode];
//        vc.otherHostLiveCode = @"";
//        vc.hasAddOtherStream = NO;
//        [[ZegoDemoHelper api] logoutRoom];
//    }else{
//        // 停止PK对方的拉流
//        [vc stopPlayTRTC];
//        [vc hk_releaseStreamView];
//        // 停止PK对方的拉流
//        [[ZegoDemoHelper api] stopPlayingStream:vc.otherHostLiveCode];
//        vc.otherHostLiveCode = @"";
//        vc.hasAddOtherStream = NO;
//        [vc hk_removeTRTC];
//        [[ZegoDemoHelper api] logoutRoom];
//    }
//
//}
//- (void)showVoiceEnterPaaswordViewWithRoomId:(NSString *)roomId {
//    LKVoiceEnterPasswordView *vEnterPassword =[[LKVoiceEnterPasswordView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    vEnterPassword.tag = LKNormalViewTag;
//    vEnterPassword.strRoomId = roomId;
//    [vEnterPassword.tfPassword becomeFirstResponder];
//    [self.view.window addSubview:vEnterPassword];
//    WS(ws)
//    [vEnterPassword didClickEnterButton:^(NSString *passwordStr) {
//        [ws gotoLivingWithPassword:passwordStr roomID:roomId];
//    }];
//
//}
//- (void)closeSmallWindow{
//    if (APPDELEGATE.isHaveSmall) {
//        [APPDELEGATE.floatWindow close];
//        [APPDELEGATE.floatWindow.floatDelegate releaseEverything];
//    }
//}
//
//- (void)gotoBottleVC {
//    [[LKAppSpcTools defaultSpcTools] spcAppStatisticsWithClickID:21];
//    XHBottleViewController *vcBottle = [XHBottleViewController new];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vcBottle animated:YES];
//}
//
//- (void)gotoSearchVC {
//    CTSearchViewController * vc = [CTSearchViewController new];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//- (void)startLive {
//    kWEAK_SELF
//    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if (deleage.isHaveSmall) {
//        // 更改为直接打开自己的直播界面
//        if ([deleage.floatWindow.room_id isEqualToString:LK_WFAccount.uid]) {
//            [deleage.floatWindow returnLiveVC];
//            return;
//        }
//        [deleage.floatWindow close];
//        [deleage.floatWindow.floatDelegate releaseEverything];
//    }
//    [[ZegoDemoHelper api] logoutRoom];
//    [[NSNotificationCenter defaultCenter] postNotificationName:K_Hose_End_Speed_Dating object:nil];
//
//    TOP_VIEWCONTROLLER.navigationController.navigationBarHidden = YES;
//    AVAuthorizationStatus videoStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//    if(videoStatus == AVAuthorizationStatusRestricted || videoStatus == AVAuthorizationStatusDenied){
//        [CTCommonHelper showAlertWithTitle:nil message:@"您没有相机使用权限,请到 设置->隐私->相机 中开启权限" okTitle:@"确定" cancelTitle:nil ok:nil cancel:nil];
//        return;
//    }
//
//    AVAuthorizationStatus audioStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
//    if(audioStatus == AVAuthorizationStatusRestricted || audioStatus == AVAuthorizationStatusDenied){
//        [CTCommonHelper showAlertWithTitle:nil message:@"您没有麦克风使用权限,请到 设置->隐私->麦克风 中开启权限" okTitle:@"确定" cancelTitle:nil ok:nil cancel:nil];
//        return;
//    }
//
//#if kIsAppstoreVersion
//    if (!(_liveTitle.text && _liveTitle.text.length > 0)){
//        [CTCommonHelper showAlertWithTitle:nil message:@"请输入直播标题" okTitle:@"确定" cancelTitle:nil ok:nil cancel:nil];
//        return;
//    }
//#else
//#endif
//
//    NSString *infos = @"room_chat_server|room_chat_type|room_background|queue|room_server";
//    NSString *url = [NSString stringWithFormat:@"%@?id=%@&room_type=live&infos=%@",lk_Room_In,LK_WFAccount.uid,infos];
//    [[WF_AFNetworking shareInstance]getWithUrl:url params:nil success:^(id responseObject) {
//        if ([responseObject[@"status"] isEqualToString:@"ok"]) {
//            [LKLiveMicTools defaultMicTools].connectState = MIC_STATES_Host;
//            [[LKLiveSDKTools defaultTools] enableCamera:YES];
//            LiveViewController *liveVC = [[LiveViewController alloc] init];
//            liveVC.roomInDic = [responseObject mutableCopy];
//            [TOP_VIEWCONTROLLER.navigationController pushViewController:liveVC animated:NO];
//        }else{
//            MBHOUTextOnly(responseObject[@"err_msg"]);
//        }
//
//    } fail:^(NSError *error) {
//    }];
//}
//- (void)gotoUserCenterWithUid:(NSString *)uid {
//
//    if (!uid) return;
//
//    CTUserDetailViewController *detailVC = [[CTUserDetailViewController alloc] initWithUid:uid];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:detailVC animated:YES];
//}
//
//// 视频聊天
//- (void)gotoVideoChatWithUid:(NSString *)uid andNickName:(NSString *)name andAvatar:(NSString *)avatar {
//    [USERDEFAULTS setBool:YES forKey:kHiddenRoomTypeButton];
//    [USERDEFAULTS synchronize];
//    [self gotoVideoVoiceChatWithType:@"video" uid:uid andNickName:name andAvatar:avatar];
//}
/////对方忙线的时候给对方发消息
//- (void)lk_createBusyMessageWithUid:(NSString *)uid andNickName:(NSString *)name andAvatar:(NSString *)avatar {
//    //对方消息
//    NSMutableDictionary *mutDic=[NSMutableDictionary dictionaryWithCapacity:0];
//    [mutDic setObject:@"video" forKey:@"chat_type"];
//    [mutDic setObject:@"0" forKey:@"coin_chat_id"];
//    NSString *content = [NSString stringWithFormat:@"（%@）有未接来电，点击回拨",[NSString getNowTimeDataFormatter:@"MM-dd HH:mm"]];
//    [mutDic setObject:content forKey:@"content"];
//    [mutDic setObject:@"chat" forKey:@"data_type"];
//    [mutDic setObject:[NSString getNowDataTime] forKey:@"end_at"];
//    [mutDic setObject:@"chat_to" forKey:@"status"];
//    [mutDic setObject:uid forKey:@"to_uid"];
//    [mutDic setObject:LK_WFAccount.uid forKey:@"uid"];
//    //我方消息
//    NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithCapacity:0];
//    [dic setObject:LK_WFAccount.avatar forKey:@"avatar"];
//    [dic setObject:LK_WFAccount.nickname forKey:@"nickname"];
//    [dic setObject:uid forKey:@"to_uid"];
//    [dic setObject:@"chat_cancel" forKey:@"type"];
//    [dic setObject:LK_WFAccount.uid forKey:@"uid"];
//    [dic setObject:@"video" forKey:@"chat_type"];
//    [dic setObject:[NSString getNowDataTime] forKey:@"created_at_ms"];
//    NSMutableDictionary *subDic=[NSMutableDictionary dictionaryWithCapacity:0];
//    [subDic setObject:LK_WFAccount.uid forKey:@"to_uid"];
//    [subDic setObject:avatar forKey:@"avatar"];
//    [subDic setObject:name forKey:@"nickname"];
//    [subDic setObject:[NSString getNowDataTime] forKey:@"created_at_ms"];
//    [subDic setObject:@"video" forKey:@"chat_type"];
//    [subDic setObject:@"chat" forKey:@"data_type"];
//    [subDic setObject:LK_WFAccount.uid forKey:@"uid"];
//    [subDic setObject:@"对方正在通话中，请稍后再拨" forKey:@"content"];
//    [dic setObject:subDic forKey:@"data"];
//    LKMessageModel *msgModel = [LKMessageModel mj_objectWithKeyValues:dic];
//
//    msgModel.data = subDic;
//    msgModel.msg_uid = uid;
//
//    LKNewMessageModel *chatListModel = [LKNewMessageModel new];
//    chatListModel.last_time = msgModel.created_at_ms;
//    chatListModel.updated_at = msgModel.created_at_ms;
//    chatListModel.uid = uid;
//    chatListModel.avatar = avatar;
//    chatListModel.nickname = name;
//    chatListModel.last_msg = msgModel.data;
//    chatListModel.chat_type = @"user";
//    chatListModel.unreads = 0;
//    [[LKMessageTools defaultTools] chatReportWithTouid:uid  dataJsonStr:[CTCommonHelper convertToJSONData:subDic] isRequester:YES success:^(id responseObject) {
//        ChatReportModel *reportModel = [ChatReportModel mj_objectWithKeyValues:responseObject];
////        NSLog(@"上报后返回的数据：%@",responseObject);
//        if ([reportModel.status isEqualToString:@"ok"]) {
//            chatListModel.chat_list_id = reportModel.chat_list_id;
//            [subDic setObject:reportModel.chat_text_id forKey:@"chat_text_id"];
//            msgModel.chat_text_id = reportModel.chat_text_id;
//            msgModel.data = subDic;
//            msgModel.created_at_ms = reportModel.created_at_ms;
//            [msgModel bg_saveOrUpdateAsync:^(BOOL isSuccess) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    [[NSNotificationCenter defaultCenter] postNotificationName:kIMReceiveNewMessage object:msgModel];
//                });
//            }];
//            chatListModel.last_time = reportModel.created_at_ms;
//            [chatListModel bg_saveOrUpdateAsync:^(BOOL isSuccess) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"getNewMessage" object:chatListModel];
//                });
//            }];
//        }
//    }];
//}
//// 语音聊天
//- (void)gotoVoiceChatWithUid:(NSString *)uid{
//    [self gotoVideoVoiceChatWithType:@"voice" uid:uid andNickName:nil andAvatar:nil];
//}
//- (void)gotoVideoVoiceChatWithType:(NSString *)type uid:(NSString *)uid andNickName:(NSString *)name andAvatar:(NSString *)avatar {
//    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if (deleage.isHaveSmall) {
//        MBProgressShow(@"您当前正在直播/语聊中");
//        return;
//    }
//    if ([[LKCallStateTools defaultTools] isWatching] || [[LKCallStateTools defaultTools] isLiving]) {             //是否在看直播 和 自己在直播
//        MBHOUTextOnly(@"请先退出直播间");
//        return;
//    }
//    if ([LKCallStateTools defaultTools].isVideoOnLine) {//正在视频通话中不能拨打其他用户
//        MBHOUTextOnly(@"已在通话中，请勿重复操作");
//        return;
//    }
//    // 先判断权限
//    BOOL videoAuthorization = [self checkVideoAuthorization];
//    BOOL audioAuthorization = [self checkAudioAuthorization];
//
//    if (videoAuthorization == YES) {
//        if (audioAuthorization == NO) {
//            [CTCommonHelper showAlertWithTitle:nil message:@"您没有麦克风使用权限,请到 设置->隐私->麦克风 中开启权限" okTitle:@"确定" cancelTitle:nil ok:nil cancel:nil];
//            return;
//        }
//    } else {
//        [CTCommonHelper showAlertWithTitle:nil message:@"您没有相机使用权限,请到 设置->隐私->麦克风 中开启权限" okTitle:@"确定" cancelTitle:nil ok:nil cancel:nil];
//        return;
//    }
//
//    if ([CTSpeedDatingManager defaultManager].state == SpeedDatingState_Hoster) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:K_Hose_Need_Back object:nil];
//        BOOL isCan = [[NSUserDefaults standardUserDefaults] boolForKey:@"CanSettingVideoOnOff"];
//        if (isCan == NO) {
//            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"NeedAutoHostSpeed"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//        }
//    }
//    [CTSpeedDatingManager defaultManager].state = SpeedDatingState_Unkonw;
//    WS(ws)
//    [[LKCallStateTools defaultTools] querychatToUserWithNew:YES chatType:type uid:uid isDating:NO successBlock:^(id response) {
//        NSString *status = response[@"status"];
//        if (![status isEqualToString:@"err"]) {
//
//            NSString *room_server = response[@"room_server"];
//            if ([room_server isEqualToString:@"zego"]) {
//                [LKCallStateTools defaultTools].room_server = @"zego";
//                [LKLiveSDKTools defaultTools].sdkType = LKSDKType_ZEGO;
//            }else if ([room_server isEqualToString:@"qq"]){
//                [LKCallStateTools defaultTools].room_server = @"qq";
//                [LKLiveSDKTools defaultTools].sdkType = LKSDKType_QQ;
//            }else{
//                [LKLiveSDKTools defaultTools].sdkType = LKSDKType_ZEGO;
//            }
//
//            CTVideoTalkViewController *vcVideoTalk = [CTVideoTalkViewController new];
//            vcVideoTalk.roomInfo =  response;
//            vcVideoTalk.isRequester = YES;
//            vcVideoTalk.callType = [type isEqualToString:@"video"] ? 2 : 1;
//            //            vcVideoTalk.showStarAlert = showStarAlert;
//            vcVideoTalk.strPeerId = [NSString stringWithFormat:@"%@",uid];
//            vcVideoTalk.strSponsorId = LK_WFAccount.uid;
//            vcVideoTalk.strStreamId = response[@"stream_id"];
//            vcVideoTalk.roomType = CTVideoRoomTypeSpeeding;
//            NSArray *userList = @[[NSString stringWithFormat:@"%@",uid],LK_WFAccount.uid];
//            vcVideoTalk.aryUserList = [NSMutableArray arrayWithArray:userList];
//            TMNavigationController * nav = [[TMNavigationController alloc] initWithRootViewController:vcVideoTalk];
//            vcVideoTalk.modalPresentationStyle = UIModalPresentationOverCurrentContext;//关键语句，必须有
//            [TOP_VIEWCONTROLLER.navigationController presentViewController:nav animated:YES completion:nil];
////            [TOP_VIEWCONTROLLER.navigationController pushViewController:vcVideoTalk animated:NO];
//        }else{
//            //yanglu
//            if ([response[@"err_code"] isEqualToString:@"no_coin"]) {
//                [ws showTopUpView];
//            }else if ([response[@"err_code"] isEqualToString:@"need_vip"]){
//                [ws showNeedVipAlert:response];
//            }else{
//                if ([response[@"err_msg"] containsString:@"对方正忙"]&&[type isEqualToString:@"video"]) {
//                    [self lk_createBusyMessageWithUid:uid andNickName:name andAvatar:avatar];
//                }
//                MBHOUTextOnly(response[@"err_msg"]);
//            }
//        }
//    }];
//
//}
////检查相机权限
//- (BOOL)checkVideoAuthorization {
//    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//    if (videoAuthStatus == AVAuthorizationStatusDenied || videoAuthStatus == AVAuthorizationStatusRestricted)
//        return NO;
//    if (videoAuthStatus == AVAuthorizationStatusNotDetermined)
//    {
//        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
//        }];
//    }
//    return YES;
//}
//
//- (BOOL)checkAudioAuthorization {
//    AVAuthorizationStatus audioAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
//    if (audioAuthStatus == AVAuthorizationStatusDenied || audioAuthStatus == AVAuthorizationStatusRestricted)
//        return NO;
//    if (audioAuthStatus == AVAuthorizationStatusNotDetermined)
//    {
//        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
//        }];
//    }
//    return YES;
//}
//
//// 普通聊天
//- (void)gotoChatWithMessage:(LKNewMessageModel *)message{
//    ChatViewController * chat = [CustomChatUIViewController new];
//    [chat configWithMessageSender:message];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:chat animated:YES];
//}
//// 客服聊天
//
//- (void)gotoSeviceWithStaff_uid:(NSString *)staff_uid{
//    if (staff_uid.length < 9) {
//        LKNewMessageModel *model = [[LKNewMessageModel alloc]init];
//        model.uid = staff_uid;
//        // ??? 客服头像买了否冷 ???
//        model.avatar = @"https://blog.csdn.net/magic_unique/article/details/51298308";
//        model.nickname = @"客服";
//        [self gotoChatWithMessage:model];
//    }else{
//        BOOL isInstallQQ = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]];
//        if (isInstallQQ) {
//            NSString *customStr = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",staff_uid] ;
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customStr]];
//        }else
//            MBProgressShow(@"您没有安装QQ，无法联系客服");
//    }
//}
//
////提醒充值
//- (void)showTopUpView{
//    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"您的金币不足" preferredStyle:(UIAlertControllerStyleAlert)];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
//    }];
//    WS(ws)
//    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"去充值" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action){
//        [ws gotoRechargeWithIndex:0];
//    }];
//    [alertVC addAction:cancelAction];
//    [alertVC addAction:confirmAction];
//    [TOP_VIEWCONTROLLER presentViewController:alertVC animated:YES completion:nil];
//}
//- (void)showNeedVipAlert:(NSDictionary *)dic{
//
//    __weak typeof(self) weakSelf = self;
//    UIAlertController *alterViewC = [UIAlertController alertControllerWithTitle:@"" message:dic[@"err_msg"] preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//
//    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"升级VIP" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        [weakSelf gotoRechargeWithIndex:1];
//    }];
//
//    [alterViewC addAction:cancel];
//    [alterViewC addAction:sure];
//
//    [self presentViewController:alterViewC animated:YES completion:nil];
//
//}
/////男用户和指定用户速配
//- (void)gotoSpeedDatingWithUid:(NSString *)uid{
//    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if (deleage.isHaveSmall) {
//        if ([LKLiveMicTools defaultMicTools].connectState == MIC_STATES_Host ||
//            [LKLiveMicTools defaultMicTools].connectState == MIC_STATES_VoiceHost) {
//            MBProgressShow(@"您当前正在直播/语聊中，请先退出再速配");
//            return;
//        }
//    }
//    CTSpeedDatingViewController *vcSpeed = [CTSpeedDatingViewController new];
//    vcSpeed.speedUid = uid;
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vcSpeed animated:NO];
//}
//
//
//// 速配
//- (void)gotoSpeedDating {
//    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if (deleage.isHaveSmall) {
//        if ([LKLiveMicTools defaultMicTools].connectState == MIC_STATES_Host ||
//            [LKLiveMicTools defaultMicTools].connectState == MIC_STATES_VoiceHost) {
//            MBProgressShow(@"您当前正在直播/语聊中，请先退出再速配");
//            return;
//        }
//    }
//    UIViewController * vcSpeed = nil;
//    if (LK_WFAccount.gender.intValue == 2) {
//        vcSpeed = [CTSpeedHostViewController new];
//    }else{
//        vcSpeed = [CTSpeedDatingViewController new];
//    }
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vcSpeed animated:NO];
//}
//
//// 商城
//- (void)gotoMallWithIndex:(NSInteger)index {
//
//    CTMallViewController * vc = [CTMallViewController new];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//
//}
//// 去实名认证
//- (void)gotoAuth{
//    CTAuthViewController * vc = [CTAuthViewController new];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//- (void)gotoAuthWithType:(NSInteger)type {
//// 视频认证已废弃
////    if (type == 2) {
////        CTAuthVideoViewController * vc = [CTAuthVideoViewController new];
////        [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
////    }else{
////        CTAuthViewController * vc = [CTAuthViewController new];
////        [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
////    }
//
//    CTAuthViewController * vc = [CTAuthViewController new];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//
//// 去动态详情
//- (void)gotoDynamicWithId:(NSString *)dynamic_id{
//    CTDynamicDetailController * vc = [[CTDynamicDetailController alloc] initWithDynamicId:dynamic_id];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//
//}
//
//// 去编辑资料
//
//- (void)gotoEditUserInfo {
//    LKHostEditVC * vcEdit = [[LKHostEditVC alloc]init];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vcEdit animated:YES];
//}
//
//// 去绑定手机
//- (void)gotoBindPhoneNumber{
//    if (USERDEFAULTS.user.phone && USERDEFAULTS.user.phone.length == 11) {
//        CTBindPhoneViewController * vc = [CTBindPhoneViewController new];
//        [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//    }else{
//        CTCertifyPhoneViewController * vc = [CTCertifyPhoneViewController new];
//        [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//    }
//
//}
//
//- (void)reportUserWithUserId:(NSString *)userId reportType:(nonnull NSString *)reportType {
//    LKAddDynamicController *vcAdd = [LKAddDynamicController new];
//    vcAdd.strReportType = reportType;
//    vcAdd.strUID = userId;
//    vcAdd.strReportID = userId;
//    UINavigationController *navAdd = [[UINavigationController alloc] initWithRootViewController:vcAdd];
//    [TOP_VIEWCONTROLLER.navigationController presentViewController:navAdd animated:YES completion:nil];
//}
//
//// 发布动态
//- (void)gotoPublicDynamic {
//    LKAddDynamicController *vcAdd = [LKAddDynamicController new];
//    UINavigationController *navAdd = [[UINavigationController alloc] initWithRootViewController:vcAdd];
//    [TOP_VIEWCONTROLLER.navigationController presentViewController:navAdd animated:YES completion:nil];
//}
//// 提现
//- (void)gotoCash {
//    CTCashViewController * vc = [CTCashViewController new];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//// 钱包  0 金币  1 积分
//- (void)gotoWalletWithType:(NSInteger)type {
//    CTWalletViewController * vc = [CTWalletViewController new];
//    vc.type = type;
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//// 联系人
//- (void)gotoContactsIsLiving:(BOOL)isLiving {
//    CTContactsViewController * vc = [CTContactsViewController new];
//    vc.isLiving = isLiving;
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//// 粉丝榜
//- (void)gotoFansRankIsHost:(BOOL)isHost uid:(NSString *)uid {
//    CTHostFansScoreRankViewController * vc = [CTHostFansScoreRankViewController new];
//    vc.isHost = isHost;
//    vc.uid = uid;
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:vc animated:YES];
//}
//- (void)openUserMediaControllerWithUserId:(NSString *)userId mediaType:(KKMediaType)mediaType {
//    KKMediaViewController *mediaViewController = [[KKMediaViewController alloc] initWithMediaType:mediaType userId:userId];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:mediaViewController animated:YES];
//}
//
//- (void)openDiamondRankController {
//    CTRankDiamondViewController *controller = [[CTRankDiamondViewController alloc] init];
//    [TOP_VIEWCONTROLLER.navigationController pushViewController:controller animated:YES];
//}
//
//- (void)playVideoWithVideoUrl:(NSString *)videoUrl videoCoverImage:(UIImage *)coverImage sourceView:(nonnull UIView *)sourceView {
//    NSString * url = [CTCommonHelper ishasPacHttps:videoUrl];
//    CTImagePreviewImageInfo *imageInfo = [CTImagePreviewImageInfo new];
//    imageInfo.originalUrl = url;
//    imageInfo.thumbnailUrl = url;
//    imageInfo.placeholderImage = coverImage ?: nil;
//    imageInfo.sourceView = sourceView;
//
//    CTImagePreviewViewController *previewVC = [[CTImagePreviewViewController alloc] init];
//    previewVC.imageInfos = @[imageInfo];
//    previewVC.imagePreviewNode.currentSelectedIndex = 0;
//    [previewVC showPreviewImageView];
//}
//- (void)logoutAndPushLogin {
//    // 删除用户信息
//    [[CTUserInfo sharedUserInfo] destoryUserInfo];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"last_time"];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LkSex];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"avatar"];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kNowNickName];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CTUserInfo"];
//
//    // 首充
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:CTFirstRechargeGiftStatusKey];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:CTShouldNotShowFirstRechargeGiftViewKey];
//
//    // 开播
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:CTFirstLiveGiftStatusKey];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:CTShouldNotShowFirstLiveGiftViewKey];
//
//    // 速配相亲roomtype 恢复一对一视频默认类型
//    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:kCallRoomType];
//    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kHiddenRoomTypeButton];
//
//    // 退出MQTT
//    [[LKMQTTManager getInstance] userLogoutAndRemoveTopic];
//    [LKNewMessageModel bg_deleteAsync:nil where:nil complete:NULL];
//    [LKMessageModel bg_deleteAsync:nil where:nil complete:NULL];
//
//    // 关闭小视图播放
//    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    if (deleage.isHaveSmall) {
//        [deleage.floatWindow close];
//        [deleage.floatWindow.floatDelegate releaseEverything];
//    }
//    // 退出房间
//    [[ZegoDemoHelper api] logoutRoom];
//
//    // 发送退出登录通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:CTUserLogOutSuccessedNotification object:nil];
//
//    // 显示登录窗口
//    CTLoginViewController *vcLogin = [CTLoginViewController new];
//    deleage.window.rootViewController = [[TMNavigationController alloc] initWithRootViewController:vcLogin];
//}
//
//#pragma mark - 快捷充值
//- (void)presentQuickRechargeControllerWithTriggerType:(QuickRechargeTriggerType)triggerType
//{
//    CTQuickRechargeController *viewController = [[CTQuickRechargeController alloc] initWithTriggerType:triggerType];
//    [self kk_presentBottomVC:viewController autoDismiss:YES];
//}

@end

