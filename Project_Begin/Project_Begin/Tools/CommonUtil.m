//
//  CommonUtil.m
//  palmHospital
//
//  Created by 王子刚 on 15/4/24.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//


#import "CommonUtil.h"

@implementation CommonUtil


+ (CGFloat)getTextHeightWithWidth:(CGFloat)width String:(NSString *)str FontSize:(CGFloat)fontsize {
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil];
    CGFloat height = rect.size.height+1;
    return height;
}


+ (CGFloat)getTextWidthWithHeight:(CGFloat)height String:(NSString *)str FontSize:(CGFloat)fontsize {
    CGRect rect = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil];
    CGFloat width = rect.size.width+1;
    return width;
}


@end
