///Users/hismobile/Downloads/TYAlertController-master/TYAlertControllerDemo/zzAlertView.m
//  zzAlertView.m
//  TYAlertControllerDemo
//
//  Created by hismobile on 2018/11/27.
//  Copyright © 2018年 tanyang. All rights reserved.
//

#import "zzAlertView.h"

@interface zzAlertView ()<UITextViewDelegate> {
    CGFloat textViewContentHeight;
    NSString *slideMsg;
    NSMutableAttributedString *slideAttrbuteString;
    CGFloat extraHeight;
    //输入样式最大输入字数限制
    int maxLimit;
    //输入样式最小输入字数限制
    int minLimit;
}

@end

@implementation zzAlertView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.slideTextView.editable = NO;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.needSlideDown) {
        CGRect bounds = [slideAttrbuteString boundingRectWithSize:CGSizeMake(self.slideTextView.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        textViewContentHeight = bounds.size.height;
    }
}

- (void)configAlertWithSlideRemindTypeTittle:(NSString *)tittle Msg:(NSString *)msg  userInterface:(UserInterface)userInterface{
    slideMsg = msg;
    [self userActionType:userInterface];
    NSTextAlignment alignment = NSTextAlignmentLeft;
//    NSTextAlignment alignment = [self getalignment:msg];
    self.slideTextView.textAlignment = alignment;
    self.titleLbl.text = tittle;
    self.slideRemindView.hidden = NO;
    self.staticRemindView.hidden = YES;
    self.remindView.hidden = YES;
    

    
    if (self.showAttrAlert) {
        //富文本，两种都可以
        NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
        NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
        
        //设置富文本
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
        [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attStr.length)];
        [attStr addAttribute:NSForegroundColorAttributeName value:RGBACOLOR(0x66, 0x66, 0x66, 1) range:NSMakeRange(0, attStr.length)];
        //设置段落格式
        NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
        para.lineSpacing = 2;
        para.paragraphSpacing = 2;
        para.alignment = NSTextAlignmentLeft;
        [attStr addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attStr.length)];
        slideAttrbuteString = attStr;
        self.slideTextView.attributedText = attStr;
    }else {
        self.slideTextView.text = msg;
    }
    
    //设置起始行在顶部
    CGPoint offset =self.slideTextView.contentOffset;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slideTextView setContentOffset: offset];
    });
}

//弹窗输入理由
- (void)configAlertWithSlideInPutRemindTypeTittle:(NSString *)tittle PlaceHolder:(NSString *)placeholder  userInterface:(UserInterface)userInterface MaxLimit:(int)maxLimit MinLimit:(int)minLimit {
    
    [self userActionType:userInterface];
    NSTextAlignment alignment = NSTextAlignmentLeft;
    self.slideTextView.editable = YES;
    self.slideTextView.placeholder = placeholder;
    self.slideTextView.placeholderTextColor = RGBACOLOR(0x66, 0x66, 0x66, 1);
    self.slideTextView.textAlignment = alignment;
    self.titleLbl.text = tittle;
    self.slideRemindView.hidden = NO;
    self.staticRemindView.hidden = YES;
    self.remindView.hidden = YES;

    
    //设置起始行在顶部
    CGPoint offset =self.slideTextView.contentOffset;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slideTextView setContentOffset: offset];
    });
}





- (void)configAlertWithStaticRemindTypeTittle:(NSString *)tittle Msg:(NSString *)msg userInterface:(UserInterface)userInterface {
    //富文本，两种都可以
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置富文本
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attStr.length)];
    [attStr addAttribute:NSForegroundColorAttributeName value:RGBACOLOR(0x66, 0x66, 0x66, 1) range:NSMakeRange(0, attStr.length)];
    //设置段落格式
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    para.lineSpacing = 2;
    para.paragraphSpacing = 2;
    para.alignment = [self getalignment:msg];
    [attStr addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attStr.length)];
    
//    NSTextAlignment alignment = [self getalignment:msg];
//    self.staticRemindLbl.textAlignment = alignment;
    
    [self userActionType:userInterface];
    self.titleLbl.text = tittle;
    self.slideRemindView.hidden = YES;
    self.staticRemindView.hidden = NO;
    self.remindView.hidden = YES;
    if (msg.length > 0) {
        self.staticRemindLbl.attributedText = attStr;
    }
}

- (void)configAlertWithImgRemindTypeImageName:(NSString *)image Tittle:(NSString *)remindTittle Msg:(NSString *)msg userInterface:(UserInterface)userInterface {
    //富文本，两种都可以
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置富文本
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attStr.length)];
    [attStr addAttribute:NSForegroundColorAttributeName value:RGBACOLOR(0x66, 0x66, 0x66, 1) range:NSMakeRange(0, attStr.length)];
    //设置段落格式
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    para.lineSpacing = 2;
    para.paragraphSpacing = 2;
    para.alignment = [self getalignment:msg];
    [attStr addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attStr.length)];
    
//    NSTextAlignment alignment = [self getalignment:msg];
//    self.errorDetailLbl.textAlignment = alignment;
    
    [self userActionType:userInterface];
    self.titleLbl.hidden = YES;
    self.slideRemindView.hidden = YES;
    self.staticRemindView.hidden = YES;
    self.remindView.hidden = NO;
    self.remindTitleLbl.text = remindTittle;
    self.errorDetailLbl.attributedText = attStr;
    self.remindImageView.image = [UIImage imageNamed:image];
}

- (void)userActionType:(UserInterface)userInterface  {
    if (userInterface == singleBtnAction) {
        self.singleBtnView.hidden = NO;
        self.doubleBtnView.hidden = YES;
    }else {
        self.singleBtnView.hidden = YES;
        self.doubleBtnView.hidden = NO;
    }
}
- (NSTextAlignment)
getalignment:(NSString *)message {
    CGRect rect = [message boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    if (rect.size.width > self.frame.size.width-40) {
        return NSTextAlignmentLeft;
    }else {
        return NSTextAlignmentCenter;
    }
}

- (void)setNeedSlideDown:(NSNumber *)needSlideDown {
    _needSlideDown = needSlideDown;
    self.slideTextView.delegate = self;
    [self.rightBtn setTitleColor:RGBACOLOR(0x66, 0x66, 0x66, 1) forState:UIControlStateNormal];
    [self.rightBtn removeTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn addTarget:self action:@selector(showToast) forControlEvents:UIControlEventTouchUpInside];
    NSInteger count = [[slideMsg mutableCopy] replaceOccurrencesOfString:@"<br>" withString:@"C" options:NSLiteralSearch range:NSMakeRange(0, [slideMsg length])];
    extraHeight = count * 20;
    
}

- (void)showToast {
    [[HXToast sharedToast] showTipsInWindow:@"请阅读内容"];
}

#pragma mark - UIScrollDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat textViewOffset = self.slideTextView.contentOffset.y;
    if ((textViewOffset+extraHeight) >= textViewContentHeight)
    {
        [self.rightBtn setTitleColor:RGBACOLOR(0x30, 0xc3, 0x7d, 1) forState:UIControlStateNormal];
        [self.rightBtn removeTarget:self action:@selector(showToast) forControlEvents:UIControlEventTouchUpInside];
        [self.rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (IBAction)leftAction:(id)sender {
    [self hideView];
    if (self.cancelBlock) {
        
        self.cancelBlock();
    }
    
}
- (IBAction)rightAction:(id)sender {
    [self hideView];
    if (self.okBlock) {
        
        self.okBlock();
    }

    
}
- (IBAction)bigButtonClick:(id)sender {
    [self hideView];
    if (self.bigBlock) {
        self.bigBlock();
    }
 
}

@end
