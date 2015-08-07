//
//  CommentTabelViewCell.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CommentTabelViewCell.h"
#import "UIView+ViewKit.h"
#import "UIImageView+ViewKit.h"
#import "RKImageLabel.h"
#import "UILabel+LabelKit.h"
#import "NSString+LabelKit.h"
#import "RKShadowView.h"

@implementation CommentTabelViewCell

+ (CGFloat)carculateHeightWithModel:(id)model{
    CGFloat height = 60;
    NSString* content = @"我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容";
    CGRect bounds = [content autosizeWithFont:[UIFont systemFontOfSize:16] maxWidth:kScreenWidth - 2 * 10];
    height += CGRectGetHeight(bounds);
    
    height += 12 + 20 + 10;
    
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //用户头像
        self.mainImageView.frame = CGRectMake(10, 10, 40, 40);
        [self.mainImageView setIsRound:YES];
        
        //用户名
        self.mainLabel.textColor = RGBCOLOR(51, 51, 51);
        self.mainLabel.font = [UIFont boldSystemFontOfSize:15];
        
        //评论内容
        self.subLabel_1.origin = CGPointMake(10, self.mainImageView.maxY + 10);
        self.subLabel_1.textColor = RGBCOLOR(68, 74, 89);
        self.subLabel_1.font = [UIFont systemFontOfSize:16];
        
        //右下角时间
        [self.imageLabel_1.imageView setBackgroundColor:[UIColor redColor]];
        self.imageLabel_1.imageView.size = CGSizeMake(20, 20);
        self.imageLabel_1.height = 20;
        self.imageLabel_1.mainLabel.textColor = RGBCOLOR(148, 148, 153);
        self.imageLabel_1.mainLabel.font = [UIFont systemFontOfSize:12];
        
        //下分割线
        self.bottomView = [RKShadowView seperatorLine];
    }
    return self;
}

- (void)setModel:(id)model{
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:@"http://10.1.5.104:8080/server/image/show?imageId=8e90cd89-72ee-49f0-9e08-a258192c9d40&type=project&width=&height=&cut="]];
    self.mainLabel.text = @"用户名哦用户名哦用户名哦用户名哦用户名哦用户名哦dddddddd名哦用户名哦用户名哦用户名哦ddddd";
    self.subLabel_1.text = @"我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容我是内容内容内容";
    self.imageLabel_1.mainLabel.text = @"20151231232132131321321";
    
    [self.mainLabel autosizeWithMaxWidth:kScreenWidth - self.mainImageView.maxX - 10 * 2];
    [self.mainLabel setMinX:self.mainImageView.maxX + 10 midY:self.mainImageView.midY];
    [self.subLabel_1 autosizeWithMaxWidth:kScreenWidth - 2 * 10];
    [self.imageLabel_1 setMaxX:kScreenWidth - 10 minY:self.subLabel_1.maxY + 12];
    self.bottomView.maxY = self.imageLabel_1.maxY + 10;
}
@end
