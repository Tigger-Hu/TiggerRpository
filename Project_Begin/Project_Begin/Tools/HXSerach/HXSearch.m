//
//  HXSearch.m
//  palmHospital
//
//  Created by laohu on 12/11/19.
//  Copyright © 2019 neusoft. All rights reserved.
//

#import "HXSearch.h"

@interface HXSearch ()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *searchBKView;
//搜索图片
@property (nonatomic, strong) UIImageView *searchImg;



@end

@implementation HXSearch

#pragma mark - Init
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = RGBCOLOR(0xf5, 0xf5, 0xf5);
        [self addSubview:self.searchBKView];
        [self.searchBKView addSubview:self.searchImg];
        [self.searchBKView addSubview:self.searchField];
        self.searchField.placeholder = self.placeHolder;
        self.searchField.text = self.searchText;
        self.searchField.delegate = self;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    self.searchBKView.frame = CGRectMake(15, 7, SCREEN_WIDTH-30, 30);
    self.searchImg.frame = CGRectMake(5, 5, 20, 20);
    self.searchField.frame = CGRectMake(30, 0, SCREEN_WIDTH-30-40, 30);
    self.searchField.placeholder = self.placeHolder;
    if (self.searchText.length > 0) {
        self.searchField.text = self.searchText;
    }
}


#pragma mark - Lazy
- (UIView *)searchBKView {
    if (!_searchBKView) {
        _searchBKView = [[UIView alloc] initWithFrame:CGRectZero];
        _searchBKView.layer.cornerRadius = 5;
        _searchBKView.backgroundColor = RGBCOLOR(0xff, 0xff, 0xff);
        
    }
    return _searchBKView;
}


- (UIImageView *)searchImg {
    if (!_searchImg) {
        _searchImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_bar"]];
    }
    return _searchImg;
}


- (UITextField *)searchField {
    if (!_searchField) {
        _searchField = [[UITextField alloc] initWithFrame:CGRectZero];
        _searchField.borderStyle = UITextBorderStyleNone;
        _searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchField.returnKeyType = UIReturnKeySearch;
        _searchField.font = [UIFont systemFontOfSize:14];
    }
    return _searchField;
}

#pragma mark - Search
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]) {
        //点击了搜索按钮
        [self.searchField resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(beginSearchWithSearchString:)]) {
            [self.delegate beginSearchWithSearchString:textField.text];
        }
    }
    return YES;
}



@end
