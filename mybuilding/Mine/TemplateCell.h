//
//  TemplateCell.h
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"

@interface TemplateCell : UITableViewCell

/**
 *  设置当前cell的子控件(多个label)的内容
 *
 *  @param numArray  数字数组
 *  @param textArray 文字数组
 *  @param title     标题
 */
- (void)setSubviewsWithNum:(NSMutableArray *)numArray textArray:(NSMutableArray *)textArray title:(NSString *)title;

@end
