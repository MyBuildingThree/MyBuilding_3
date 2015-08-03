//
//  ProjectTableViewCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectTableViewCell.h"
#import "RKViewFactory.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"

@implementation ProjectTableViewCell

+(CGFloat)carculateCellHeightWithModel:(ProjectModel *)cellModel{
    CGFloat height = 0;
    height += [RKViewFactory autoLabelWithMaxWidth:280 maxHeight:40 font:[UIFont systemFontOfSize:14] content:cellModel.a_description];
    height +=150;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.PCDLabel];
        [self.contentView addSubview:self.projectName];
        [self.contentView addSubview:self.cutLine1];
        [self.contentView addSubview:self.projectStage];
        [self.contentView addSubview:self.investment];
        [self.contentView addSubview:self.area];
        [self.contentView addSubview:self.projectStageTitle];
        [self.contentView addSubview:self.investmentTitle];
        [self.contentView addSubview:self.areaTitle];
        [self.contentView addSubview:self.projectDescription];
        [self.contentView addSubview:self.cutLine2];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

-(void)setModel:(ProjectModel *)model{
    self.PCDLabel.text = [NSString stringWithFormat:@"%@ %@ %@",model.a_province,model.a_city,model.a_district];
    self.projectName.text = model.a_projectName;
    self.projectStage.text = model.a_projectstage;
    self.investment.text = model.a_investment;
    self.area.text = model.a_area;
    NSString* tempStr = [NSString stringWithFormat:@"项目描述：%@",model.a_description];
    NSMutableAttributedString* attStr=[[NSMutableAttributedString alloc]initWithString:tempStr];
    [attStr addAttributes:@{NSForegroundColorAttributeName:AllLightGrayColor,NSFontAttributeName:[UIFont systemFontOfSize:12]} range:NSMakeRange(0, 5)];
    [attStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(5, model.a_description.length)];
    self.projectDescription.attributedText = attStr;
    self.time.text = model.a_lastUpdatedTime;
}

-(void)layoutSubviews{
    [RKViewFactory autoLabel:self.projectDescription maxWidth:280 maxHeight:40];
    CGFloat height = 0;
    CGRect frame = self.projectDescription.frame;
    self.projectDescription.frame = frame;
    height += CGRectGetHeight(self.projectDescription.frame)+CGRectGetMaxY(self.projectDescription.frame);
    
    frame = self.cutLine2.frame;
    frame.origin.y = height;
    self.cutLine2.frame = frame;
    
    frame = self.time.frame;
    frame.origin.y = height+5;
    frame.origin.x = kScreenWidth - 10 - self.time.width;
    self.time.frame = frame;
    
    
}

-(UILabel *)PCDLabel{
    if(!_PCDLabel){
        _PCDLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, kScreenWidth-30, 20)];
        _PCDLabel.font = [UIFont systemFontOfSize:12];
        _PCDLabel.textColor = BlueColor;
        _PCDLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _PCDLabel;
}

-(UILabel *)projectName{
    if(!_projectName){
        _projectName = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, kScreenWidth-30, 20)];
        _projectName.font = [UIFont systemFontOfSize:16];
        _projectName.textAlignment = NSTextAlignmentLeft;
    }
    return _projectName;
}

-(UIImageView *)cutLine1{
    if(!_cutLine1){
        _cutLine1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, kScreenWidth, 1)];
        _cutLine1.backgroundColor = [UIColor lightGrayColor];
    }
    return _cutLine1;
}

-(UILabel *)projectStage{
    if(!_projectStage){
        _projectStage = [[UILabel alloc] initWithFrame:CGRectMake(15, 65, (kScreenWidth-30)/3+10, 20)];
        _projectStage.textColor = BlueColor;
        _projectStage.font = [UIFont systemFontOfSize:14];
        _projectStage.textAlignment = NSTextAlignmentLeft;
    }
    return _projectStage;
}

-(UILabel *)investment{
    if(!_investment){
        _investment = [[UILabel alloc] initWithFrame:CGRectMake(20+(kScreenWidth-30)/3, 65, (kScreenWidth-30)/3, 20)];
        _investment.textColor = BlueColor;
        _investment.font = [UIFont systemFontOfSize:14];
        _investment.textAlignment = NSTextAlignmentLeft;
    }
    return _investment;
}

-(UILabel *)area{
    if(!_area){
        _area = [[UILabel alloc] initWithFrame:CGRectMake(25+(kScreenWidth-30)/3*2, 65, (kScreenWidth-30)/3, 20)];
        _area.textColor = BlueColor;
        _area.font = [UIFont systemFontOfSize:14];
        _area.textAlignment = NSTextAlignmentLeft;
    }
    return _area;
}

-(UILabel *)projectStageTitle{
    if(!_projectStageTitle){
        _projectStageTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 85, (kScreenWidth-30)/3, 20)];
        _projectStageTitle.textAlignment = NSTextAlignmentLeft;
        _projectStageTitle.text = @"项目阶段";
        _projectStageTitle.textColor = AllLightGrayColor;
        _projectStageTitle.font = [UIFont systemFontOfSize:12];
    }
    return _projectStageTitle;
}

-(UILabel *)investmentTitle{
    if(!_investmentTitle){
        _investmentTitle = [[UILabel alloc] initWithFrame:CGRectMake(20+(kScreenWidth-30)/3, 85, (kScreenWidth-30)/3, 20)];
        _investmentTitle.textAlignment = NSTextAlignmentLeft;
        _investmentTitle.text = @"投资额(百万)";
        _investmentTitle.textColor = AllLightGrayColor;
        _investmentTitle.font = [UIFont systemFontOfSize:12];
    }
    return _investmentTitle;
}

-(UILabel *)areaTitle{
    if(!_areaTitle){
        _areaTitle = [[UILabel alloc] initWithFrame:CGRectMake(25+(kScreenWidth-30)/3*2, 85, (kScreenWidth-30)/3, 20)];
        _areaTitle.textAlignment = NSTextAlignmentLeft;
        _areaTitle.text = @"土地面积(平方米)";
        _areaTitle.textColor = AllLightGrayColor;
        _areaTitle.font = [UIFont systemFontOfSize:12];
    }
    return _areaTitle;
}

-(UILabel *)projectDescription{
    if(!_projectDescription){
        _projectDescription = [[UILabel alloc] initWithFrame:CGRectMake(15, 105, kScreenWidth-30, 20)];
        _projectDescription.textAlignment = NSTextAlignmentLeft;
    }
    return _projectDescription;
}

-(UIImageView *)cutLine2{
    if(!_cutLine2){
        _cutLine2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 110, kScreenWidth, 1)];
        _cutLine2.backgroundColor = [UIColor lightGrayColor];
    }
    return _cutLine2;
}

-(UILabel *)time{
    if(!_time){
        _time = [[UILabel alloc] initWithFrame:CGRectMake(0, 115, 100, 20)];
        _time.textAlignment = NSTextAlignmentRight;
        _time.textColor = AllLightGrayColor;
        _time.font = [UIFont systemFontOfSize:12];
    }
    return _time;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
    }
    return _bottomView;
}
@end
