//
//  MainViewCell.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 18.03.2021.
//

#import "MainViewCell.h"

@interface MainViewCell ()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *label;
@end

@implementation MainViewCell

#pragma mark - Initialisation

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return  self;
}

#pragma mark - Setup Cell
- (void) setup {
    [self setupView];
    [self setupImageView];
    [self setupLabel];
}

- (void) setupView {
    self.backgroundColor =[UIColor blackColor];
}
- (void) setupImageView {
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:self.imageView];
}
- (void) setupLabel {
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
    self.label.textColor =[UIColor whiteColor];
    [self.contentView addSubview:self.label];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0,
                                      0,
                                      self.contentView.bounds.size.width,
                                      self.contentView.bounds.size.height - 20);
    self.label.frame = CGRectMake(0,
                                  self.imageView.bounds.size.height,
                                  self.imageView.bounds.size.width,
                                  20);
}

#pragma mark - Config Cell
- (void) configWithImage: (Image *) image {
    self.imageView.image = image.image;
    self.label.text = image.name;
}

@end
