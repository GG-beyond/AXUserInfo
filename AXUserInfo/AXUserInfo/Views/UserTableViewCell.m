//
//  UserTableViewCell.m
//  AXUserInfo
//
//  Created by anxindeli on 2017/10/10.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "UserTableViewCell.h"
#import "UserItemModel.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.itemImageView];
        [self addSubview:self.itemLabel];
        [self addSubview:self.topLine];
        [self addSubview:self.bottomLine];
    }
    return self;
}
- (UIImageView *)itemImageView{
    
    if (!_itemImageView) {
        
        _itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(17, 15, 30, 30)];
    }
    return _itemImageView;
}

- (UILabel *)itemLabel{
    
    if (!_itemLabel) {
        
        _itemLabel = [self creatCommonLabel];
        _itemLabel.frame = CGRectMake(65, 20, 100, 20);
    }
    return _itemLabel;
}

- (UIView *)topLine{
    
    if (!_topLine) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,0.5)];
        _topLine.backgroundColor = RGBCOLOR(217, 217, 217);
    }
    return _topLine;
}
- (UIView *)bottomLine{
    
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(17, 59.5, SCREEN_WIDTH - 34,0.5)];
        _bottomLine.backgroundColor = RGBCOLOR(217, 217, 217);
    }
    return _bottomLine;
}

- (UILabel *)creatCommonLabel{
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGBCOLOR(102, 102, 102);
    return label;
}
- (void)fillInDataWithModel:(id)itemModel first:(BOOL)isFirst last:(BOOL)isLast{
    
    UserItemModel *model = itemModel;
    self.itemLabel.text = model.title;
    self.itemImageView.image = [UIImage imageNamed:model.imageName];
    
    if (isFirst) {
        self.topLine.hidden = NO;
    }else{
        self.topLine.hidden = YES;
    }
    
    if (isLast) {
        self.bottomLine.frame = CGRectMake(0, 59.5, SCREEN_WIDTH, 0.5);
    }else{
        self.bottomLine.frame = CGRectMake(17, 59.5, SCREEN_WIDTH-34, 0.5);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
