//
//  MainTableViewCell.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 10.03.2021.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()
@property (strong,nonatomic) UILabel *labelForTitleOfNewsItem;
@end

@implementation MainTableViewCell

#pragma mark - Initailisation
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup cell
-(void) setup {
    [self setupLabel];
}

-(void) setupLabel {
    self.labelForTitleOfNewsItem = [[UILabel alloc] initWithFrame:self.bounds];
    self.labelForTitleOfNewsItem.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular];
    //self.labelForTitleOfNewsItem.numberOfLines = 0;
    [self.contentView addSubview:self.labelForTitleOfNewsItem];
   
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50);
    self.labelForTitleOfNewsItem.frame = frame;
}

#pragma mark - Config cell
- (void)configCell:(NewsItem *)newsItem {
    self.labelForTitleOfNewsItem.text = newsItem.title;
}

@end
