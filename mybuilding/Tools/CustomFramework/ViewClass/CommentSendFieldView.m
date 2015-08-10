//
//  CommentSendFieldView.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CommentSendFieldView.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"

@interface CommentSendFieldView ()

@property(nonatomic, strong) UITextField* textField;
@end

@implementation CommentSendFieldView

+ (instancetype)commentSendFieldView{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 49)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGBCOLOR(232, 232, 232);
        UIView* sepe = [RKShadowView seperatorLine];
        [self addSubview:sepe];
        
        [self addSubview:self.textField];
    }
    return self;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, self.width - 10 * 2, self.height - 2 * 10)];
//        _textField.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
        _textField.layer.borderWidth = 1;
        _textField.layer.borderColor = [UIColor grayColor].CGColor;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.cornerRadius = 4;
        _textField.placeholder = @"写评论";
        UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        leftView.backgroundColor = [UIColor redColor];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        UILabel* placeLabel = [_textField valueForKey:@"_placeholderLabel"];
        placeLabel.textColor = RGBCOLOR(148, 148, 153);
        placeLabel.font = [UIFont systemFontOfSize:16];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_textField];
        
        
    }
    return _textField;
}
@end
