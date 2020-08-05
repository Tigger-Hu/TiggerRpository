//
//  PalmLoadingView.h
//  Loading
//
//  Created by laohu on 7/2/19.
//  Copyright © 2019 laohu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PalmLoadingView : UIView{
    CGRect _Coreframe;
}

@property (nonatomic, strong) UIImageView *circleImageV;
@property (nonatomic, strong) UILabel *remindLbl;
@end

NS_ASSUME_NONNULL_END
