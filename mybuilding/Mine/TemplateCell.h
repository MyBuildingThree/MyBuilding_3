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


- (void)setSubviewsWithNum:(NSMutableArray *)numArray textArray:(NSMutableArray *)textArray title:(NSString *)title;

@end
