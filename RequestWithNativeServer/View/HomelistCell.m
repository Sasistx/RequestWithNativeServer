//
//  HomelistCell.m
//  RequestWithNativeServer
//
//  Created by 高天翔 on 2017/9/7.
//  Copyright © 2017年 chunyu. All rights reserved.
//

#import "HomelistCell.h"
#import "ListViewModel.h"

@interface HomelistCell ()
@property (nonatomic, strong) UIButton* nextButton;
@end

@implementation HomelistCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 30, 70, 40)];
        [_nextButton setTitle:@"next" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_nextButton];
    }
    return self;
}


- (void)updateCellWithViewModel:(id)viewModel cellModel:(HomeListModel *)cellModel {

    self.textLabel.text = cellModel.Id;
    
    [[[_nextButton rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(id x) {
        
        ListViewModel* listViewModel = (ListViewModel*)viewModel;
        [listViewModel.pushToNextController sendNext:cellModel];
    }];
}


@end
