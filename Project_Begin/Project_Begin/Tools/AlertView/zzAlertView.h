//
//  zzAlertView.h
//  TYAlertControllerDemo
//
//  Created by hismobile on 2018/11/27.
//  Copyright © 2018年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+TYAlertView.h"
#import "IQTextView.h"
NS_ASSUME_NONNULL_BEGIN


typedef enum : NSUInteger {
    singleBtnAction,    //单个按钮（我知道了）
    doubleBtnAction     //两个按钮 （取消，确定）
} UserInterface;

#define LeftBtnCSS @"alertLeftBtn"
#define RightBtnCSS @"alertRightBtn"

@interface zzAlertView : UIView

@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *bigButton;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;


//提示图片
@property (weak, nonatomic) IBOutlet UIView *remindView;
@property (weak, nonatomic) IBOutlet UIImageView *remindImageView;
//提示语
@property (weak, nonatomic) IBOutlet UILabel *remindTitleLbl;
//错误详细信息
@property (weak, nonatomic) IBOutlet UITextView *errorDetailLbl;

//可以上下滑动的提示
@property (weak, nonatomic) IBOutlet UIView *slideRemindView;
@property (weak, nonatomic) IBOutlet IQTextView *slideTextView;

//固定无交互的提示
@property (weak, nonatomic) IBOutlet UIView *staticRemindView;
@property (weak, nonatomic) IBOutlet UILabel *staticRemindLbl;

@property (weak, nonatomic) IBOutlet UIView *doubleBtnView;
@property (weak, nonatomic) IBOutlet UIView *singleBtnView;


/*
 @param btnStyle 底部按钮样式
 {
    single:{
        tittle:
        color:
        backGroundColor:
    },
    double:{
        left: {
            tittle:
            color:
            backGroundColor:
        },
        right: {
            tittle:
            color:
            backGroundColor:
        }
    }
 }
 
 */


/**

 @param tittle 提示标题
 @param msg 提示消息
 @param userInterface 按钮状态
 样式  需要在外层指定
 
 */
- (void)configAlertWithSlideRemindTypeTittle:(NSString *)tittle Msg:(NSString *)msg  userInterface:(UserInterface)userInterface;

- (void)configAlertWithStaticRemindTypeTittle:(NSString *)tittle Msg:(NSString *)msg userInterface:(UserInterface)userInterface;

- (void)configAlertWithImgRemindTypeImageName:(NSString *)image Tittle:(NSString *)remindTittle Msg:(NSString *)msg userInterface:(UserInterface)userInterface;


/// 拒绝弹窗
/// @param tittle 标题
/// @param placeholder 占位文字
/// @param userInterface 下面按钮
/// @param maxLimit 最大限制
/// @param minLimit 最小限制
- (void)configAlertWithSlideInPutRemindTypeTittle:(NSString *)tittle PlaceHolder:(NSString *)placeholder  userInterface:(UserInterface)userInterface MaxLimit:(int)maxLimit MinLimit:(int)minLimit;

//确认
@property (nonatomic,strong) void (^okBlock)();
//取消
@property (nonatomic,strong) void (^cancelBlock)();
//我知道了
@property (nonatomic, strong) void (^bigBlock)();

//在配置完弹窗后 设置此字段 可以根据textview偏移量 使 确认按钮 enable  set任意值都可以 主要调用setneedSlideDown方法
@property (nonatomic, strong) NSNumber *needSlideDown;

@property (nonatomic, assign) BOOL showAttrAlert;
    


@end

NS_ASSUME_NONNULL_END
