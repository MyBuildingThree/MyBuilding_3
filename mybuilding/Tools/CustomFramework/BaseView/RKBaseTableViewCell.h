//
//  RKBaseTableViewCell.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RKBaseTableViewCellDelegate <NSObject>
- (void)tableViewCellAssistBtnClicked;
@end

@class RKImageLabel;
@interface RKBaseTableViewCell : UITableViewCell
@property(nonatomic, strong) UIImageView* mainImageView;
@property(nonatomic, strong) UILabel* mainLabel;
@property(nonatomic, strong) UILabel* subLabel_1;
@property(nonatomic, strong) UILabel* subLabel_2;
@property(nonatomic, strong) UIButton* assistBtn;

@property(nonatomic, strong) RKImageLabel* imageLabel_1;

@property(nonatomic, strong) UIView* bottomView;

@property(nonatomic, weak) id<RKBaseTableViewCellDelegate> delegate;

@property(nonatomic, strong) id model;

+ (CGFloat)carculateHeightWithModel:(id)model;
@end
