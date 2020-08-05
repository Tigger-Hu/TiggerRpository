//
//  CommonUtil.h
//  palmHospital
//
//  Created by 王子刚 on 15/4/24.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
 

@interface CommonUtil : NSObject


+ (CGFloat)getTextHeightWithWidth:(CGFloat)width String:(NSString *)str FontSize:(CGFloat)fontsize;


+ (CGFloat)getTextWidthWithHeight:(CGFloat)height String:(NSString *)str FontSize:(CGFloat)fontsize;

@end
