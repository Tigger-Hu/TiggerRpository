//
//  HXToast.h
//  pamlPRM
//
//  Created by laohu on 9/12/19.
//  Copyright © 2019 sysucc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXToast : UIView

+ (instancetype)sharedToast;
- (void)showTipsInWindow:(NSString *)toastMessage;
- (void)showTipsInWindow:(NSString *)toastMessage AfterDelay:(NSInteger)seconds;
@end

NS_ASSUME_NONNULL_END
