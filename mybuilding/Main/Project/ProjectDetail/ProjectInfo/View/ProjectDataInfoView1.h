//
//  ProjectDataInfoView1.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectDataInfoView1 : UIView

/**
 *  设置各参数
 *
 *  @param contents 参数顺序为:土地面积，主体设计阶段，钢结构，预计开工，预计竣工，建筑层高，土地
 */
- (void)setProjectDataInfoViewContents:(NSArray*)contents;

@end
