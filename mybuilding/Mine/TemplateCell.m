//
//  TemplateCell.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "TemplateCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"
#import "MyView.h"

@interface TemplateCell ()

@property (nonatomic,strong)MyView *topView;

@property (nonatomic,strong)UILabel *onLabel;
@property (nonatomic,strong)UILabel *otLabel;
@property (nonatomic,strong)UILabel *tnLabel;
@property (nonatomic,strong)UILabel *ttLabel;
@property (nonatomic,strong)UILabel *thnLabel;
@property (nonatomic,strong)UILabel *thtLabel;
@property (nonatomic,strong)UILabel *fnLabel;
@property (nonatomic,strong)UILabel *ftLabel;

@property (nonatomic,strong)NSMutableArray *numArray;
@property (nonatomic,strong)NSMutableArray *textArray;

@property (nonatomic,strong)UIView *shadowView;

@end

@implementation TemplateCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.topView = [[MyView alloc]init];
        [self addSubview:self.topView];
        
        self.onLabel = [[UILabel alloc]init];
        [self addSubview:self.onLabel];
        self.otLabel = [[UILabel alloc]init];
        [self addSubview:self.otLabel];
        self.tnLabel = [[UILabel alloc]init];
        [self addSubview:self.tnLabel];
        self.ttLabel = [[UILabel alloc]init];
        [self addSubview:self.ttLabel];
        self.thnLabel = [[UILabel alloc]init];
        [self addSubview:self.thnLabel];
        self.thtLabel = [[UILabel alloc]init];
        [self addSubview:self.thtLabel];
        self.fnLabel = [[UILabel alloc]init];
        [self addSubview:self.fnLabel];
        self.ftLabel = [[UILabel alloc]init];
        [self addSubview:self.ftLabel];
        
        self.shadowView = [RKShadowView seperatorLineWithHeight:10 top:0];
        [self addSubview:self.shadowView];
        
    }
    return self;
}

/**
 *  对label的一些属性进行设置
 *
 *  @param textStr       文本内容
 *  @param textAlignment 文本位置
 *  @param fsize         文字大小
 *  @param bold          是否粗体
 *  @param label         对哪个label进行设置
 */
- (void)setlabelwithText:(NSString *)textStr textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)fsize bold:(BOOL)bold withObj:(UILabel *)label
{
    label.text = textStr;
    label.textAlignment = textAlignment;
    if (bold)
    {
        label.font = [UIFont boldSystemFontOfSize:fsize];
    } else {
        label.font = [UIFont systemFontOfSize:fsize];
    }
    
}


- (void)setSubviewsWithNum:(NSMutableArray *)numArray textArray:(NSMutableArray *)textArray title:(NSString *)title
{
    self.numArray = numArray;
    self.textArray = textArray;
    self.topView.title = title;
    
    if (numArray.count != 0)
    {
        [self setlabelwithText:numArray[0] textAlignment:NSTextAlignmentLeft fontSize:30.f bold:YES withObj:self.onLabel];
        [self setlabelwithText:textArray[0] textAlignment:NSTextAlignmentLeft fontSize:14.f bold:NO withObj:self.otLabel];
        [self setlabelwithText:numArray[1] textAlignment:NSTextAlignmentLeft fontSize:30.f bold:YES withObj:self.tnLabel];
        [self setlabelwithText:textArray[1] textAlignment:NSTextAlignmentLeft fontSize:14.f bold:NO withObj:self.ttLabel];
        
        if (textArray.count == 3)
        {
            [self setlabelwithText:numArray[2] textAlignment:NSTextAlignmentLeft fontSize:30.f bold:YES withObj:self.thnLabel];
            [self setlabelwithText:textArray[2] textAlignment:NSTextAlignmentRight fontSize:14.f bold:NO withObj:self.thtLabel];
        }
        else if (textArray.count == 4)
        {
            [self setlabelwithText:numArray[2] textAlignment:NSTextAlignmentLeft fontSize:30.f bold:YES withObj:self.thnLabel];
            [self setlabelwithText:textArray[2] textAlignment:NSTextAlignmentLeft fontSize:14.f bold:NO withObj:self.thtLabel];
            [self setlabelwithText:numArray[3] textAlignment:NSTextAlignmentLeft fontSize:30.f bold:YES withObj:self.fnLabel];
            [self setlabelwithText:textArray[3] textAlignment:NSTextAlignmentRight fontSize:14.f bold:NO withObj:self.ftLabel];
        }

    }
        
   
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.topView.frame = CGRectMake(0, 0, kScreenWidth, 38.f);
    
    if (self.textArray.count == 3)
    {
        CGFloat xw = [self.textArray[2] sizeWithFont:self.thtLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)].width;
        
        CGFloat dw = (kScreenWidth - 38*2 - xw)*0.5;
        
        self.onLabel.frame = CGRectMake(38.f, 50.f, dw, 31.f);
        self.otLabel.frame = CGRectMake(38.f, 82.f, dw, 15.f);
        self.tnLabel.frame = CGRectMake(38.f+dw, 50.f, dw, 31.f);
        self.ttLabel.frame = CGRectMake(38.f+dw, 82.f, dw-20, 15.f);
        self.thnLabel.frame = CGRectMake(kScreenWidth-38-xw, 50.f, xw+38, 31.f);
        self.thtLabel.frame = CGRectMake(kScreenWidth-38-xw-20, 82.f, xw+20, 15.f);
        
        self.shadowView.origin = CGPointMake(0, 108.f);
    }
    
    else if (self.textArray.count == 4)
    {
        CGFloat xw = [self.textArray[3] sizeWithFont:self.thtLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 15)].width;
        
        CGFloat dw = (kScreenWidth - 10*2 - xw)/3;
        
        self.onLabel.frame = CGRectMake(10.f, 50.f, dw, 31.f);
        self.otLabel.frame = CGRectMake(10.f, 82.f, dw, 15.f);
        self.tnLabel.frame = CGRectMake(10.f+dw, 50.f, dw, 31.f);
        self.ttLabel.frame = CGRectMake(10.f+dw, 82.f, dw, 15.f);
        self.thnLabel.frame = CGRectMake(10.f+dw*2, 50.f, dw, 31.f);
        self.thtLabel.frame = CGRectMake(10.f+dw*2, 82.f, dw-5, 15.f);
        self.fnLabel.frame = CGRectMake(kScreenWidth-10-xw, 50.f, xw+38, 31.f);
        self.ftLabel.frame = CGRectMake(kScreenWidth-10-xw-5, 82.f, xw+5, 15.f);
        
        self.shadowView.origin = CGPointMake(0, 108.f);
    }
    
}


@end
