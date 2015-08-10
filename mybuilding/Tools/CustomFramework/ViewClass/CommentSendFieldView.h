//
//  CommentSendFieldView.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  发送评论的视图，有个textField
 */
@interface CommentSendFieldView : UIView

+ (instancetype)commentSendFieldView;

@property(nonatomic, weak) id<UITextFieldDelegate> delegate;

@end
