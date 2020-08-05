//
//  HXSearch.h
//  palmHospital
//
//  Created by laohu on 12/11/19.
//  Copyright © 2019 neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HXSearchDelegate <NSObject>

- (void)beginSearchWithSearchString:(NSString *)searchText;

@end

@interface HXSearch : UIView
@property (nonatomic, strong) NSString *searchText;
@property (nonatomic, strong) NSString *placeHolder;
//搜索框
@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic, weak) id<HXSearchDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
