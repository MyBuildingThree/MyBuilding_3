//
//  ProjectNameInfoView.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectNameInfoView.h"
#import "RKImageLabel.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"

@interface ProjectNameInfoView ()

@property(nonatomic, strong) UILabel* nameLabel;

@property(nonatomic, strong) UILabel* contentLabel;

@property(nonatomic, strong) RKImageLabel* favoriteImageLabel;

@property(nonatomic, strong) RKImageLabel* commentImageLabel;

@property(nonatomic, strong) RKImageLabel* focusImageLabel;

@property(nonatomic, strong) RKImageLabel* timeImageLabel;

@end

@implementation ProjectNameInfoView

- (void)setName:(NSString *)name describe:(NSString *)describe favoriteNum:(NSString *)favoriteNum commentNum:(NSString *)commentNum focusNum:(NSString *)focusNum time:(NSString *)time{
    self.nameLabel.text = name;
    self.contentLabel.text = describe;
    self.favoriteImageLabel.mainLabel.text = favoriteNum;
    self.commentImageLabel.mainLabel.text = commentNum;
    self.focusImageLabel.mainLabel.text = focusNum;
    self.timeImageLabel.mainLabel.text = time;
    
    [self.nameLabel autosizeWithMaxWidth:kScreenWidth - 2 * 10];
    [self.contentLabel autosizeWithMaxWidth:kScreenWidth - 2 * 10];

    self.nameLabel.origin = CGPointMake(10, 10);
    self.contentLabel.origin = CGPointMake(10, self.nameLabel.maxY + 4);
    
    CGFloat bottomOriginY = self.contentLabel.maxY + 12;
    self.favoriteImageLabel.origin = CGPointMake(10, bottomOriginY);
    self.commentImageLabel.origin = CGPointMake(self.favoriteImageLabel.maxX + 15, bottomOriginY);
    self.focusImageLabel.origin = CGPointMake(self.commentImageLabel.maxX + 15, bottomOriginY);
    [self.timeImageLabel setMaxX:kScreenWidth - 10 minY:bottomOriginY];
    
    self.size = CGSizeMake(kScreenWidth, self.timeImageLabel.maxY + 10);
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        UILabel* nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:17];
        nameLabel.textColor = RGBCOLOR(51, 51, 51);
        [self addSubview:nameLabel];
        
        _nameLabel = nameLabel;
    }
    return _nameLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        UILabel* contentLabel = [[UILabel alloc] init];
        contentLabel.font = [UIFont systemFontOfSize:16];
        contentLabel.textColor = RGBCOLOR(68, 74, 89);
        [self addSubview:contentLabel];
        
        _contentLabel = contentLabel;
    }
    return _contentLabel;
}

- (RKImageLabel *)favoriteImageLabel{
    if (!_favoriteImageLabel) {
        RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:17];
        imageLabel.secondMargin = 3.0;
        imageLabel.imageView.frame = CGRectMake(0, 0, 15, 15);
        imageLabel.imageView.backgroundColor = [UIColor redColor];
        imageLabel.mainLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:imageLabel];

        _favoriteImageLabel = imageLabel;
    }
    return _favoriteImageLabel;
}

- (RKImageLabel *)commentImageLabel{
    if (!_commentImageLabel) {
        RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:17];
        imageLabel.secondMargin = 3.0;
        imageLabel.imageView.frame = CGRectMake(0, 0, 15, 15);
        imageLabel.imageView.backgroundColor = [UIColor redColor];
        imageLabel.mainLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:imageLabel];

        _commentImageLabel = imageLabel;
    }
    return _commentImageLabel;
}

- (RKImageLabel *)focusImageLabel{
    if (!_focusImageLabel) {
        RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:17];
        imageLabel.secondMargin = 3.0;
        imageLabel.imageView.frame = CGRectMake(0, 0, 15, 15);
        imageLabel.imageView.backgroundColor = [UIColor redColor];
        imageLabel.mainLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:imageLabel];

        _focusImageLabel = imageLabel;
    }
    return _focusImageLabel;
}

- (RKImageLabel *)timeImageLabel{
    if (!_timeImageLabel) {
        RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:17];
        imageLabel.secondMargin = 3.0;
        imageLabel.imageView.frame = CGRectMake(0, 0, 15, 15);
        imageLabel.imageView.backgroundColor = [UIColor redColor];
        imageLabel.mainLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:imageLabel];

        _timeImageLabel = imageLabel;
    }
    return _timeImageLabel;
}
/**
 *  @property(nonatomic, strong) UILabel* nameLabel;
 
 @property(nonatomic, strong) UILabel* contentLabel;
 
 @property(nonatomic, strong) RKImageLabel* favoriteImageLabel;
 
 @property(nonatomic, strong) RKImageLabel* commentImageLabel;
 
 @property(nonatomic, strong) RKImageLabel* focusImageLabel;
 
 @property(nonatomic, strong) RKImageLabel* timeImageLabel;
 */
@end
