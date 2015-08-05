//
//  RKLabel.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RKLabel;
@protocol RKLabelDelegate <NSObject>
- (void)label:(RKLabel *)label changeText:(NSString *)text;
- (void)label:(RKLabel *)label changeFont:(UIFont *)font;
@end

@interface RKLabel : UILabel
@property(nonatomic, weak) id<RKLabelDelegate> delegate;
@end
