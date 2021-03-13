//
//  SecondViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 02.03.2021.
//

#import "SecondViewController.h"
#import <YYWebImage/YYWebImage.h>
#define ReuseIdentifier @"CellIdentifier"


@interface SecondViewController ()
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *contentLabel;
@property (strong,nonatomic) UIImageView *imageNewsItemView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self configView];
}

#pragma mark - Setup Controls

-(void) setup {
    [self setupView];
    [self setupTitleLabel];
    [self setupContentLabel];
    [self setupImageNewsItemView];
    
}

-(void) setupView {
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void) setupTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    self.titleLabel.font = [UIFont systemFontOfSize:25.0 weight:UIFontWeightRegular];
    self.titleLabel.numberOfLines = 0;
    [self.view addSubview:self.titleLabel];
}

-(void) setupContentLabel {
    self.contentLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    self.contentLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular];
    self.contentLabel.numberOfLines = 0;
    [self.view addSubview:self.contentLabel];
}

-(void) setupImageNewsItemView {
    self.imageNewsItemView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageNewsItemView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageNewsItemView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.view.frame = CGRectMake(0,
                                 0,
                                 [UIScreen mainScreen].bounds.size.width,
                                 [UIScreen mainScreen].bounds.size.height);
    self.titleLabel.frame = CGRectMake(10.0,
                                       self.navigationController.navigationBar.bounds.origin.y + self.navigationController.navigationBar.bounds.size.height + 50.0,
                                       [UIScreen mainScreen].bounds.size.width-20,
                                       50);
    
    self.contentLabel.frame = CGRectMake(10.0,
                                         CGRectGetMaxY(self.titleLabel.frame),
                                         [UIScreen mainScreen].bounds.size.width-20,
                                         200);
    
    self.imageNewsItemView.frame = CGRectMake(10.0,
                                              CGRectGetMaxY(self.contentLabel.frame) + 10.0,
                                              [UIScreen mainScreen].bounds.size.width-20,
                                              100);
}

#pragma mark - ConfigView

-(void) configView {
    self.titleLabel.text = self.newsItem.title;
    self.contentLabel.text = self.newsItem.descriptionNewsItem;
    NSURL *imageURL = [NSURL URLWithString:self.newsItem.urlToImage];
    [self.imageNewsItemView yy_setImageWithURL:imageURL options:YYWebImageOptionSetImageWithFadeAnimation];
}

@end
