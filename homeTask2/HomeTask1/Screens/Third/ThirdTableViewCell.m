//
//  ThirdTableViewCell.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 06.03.2021.
//

#import "ThirdTableViewCell.h"

@interface ThirdTableViewCell ()
@property (strong, nonatomic) UILabel *leftLabel;
@property (strong, nonatomic) UILabel *rightLabel;
@end

@implementation ThirdTableViewCell

#pragma  mark - Initialisation
-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma  mark - Setup Cell
-(void) setup {
    [self setupLeftLabel];
    [self setupRightLabel];
}

-(void) setupLeftLabel {
   
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width/2, 50.0)];
    self.leftLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.leftLabel];
    
}

-(void) setupRightLabel {
    self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.leftLabel.bounds.size.width,0, [UIScreen mainScreen].bounds.size.width - self.leftLabel.bounds.size.width, 50.0)];
    self.rightLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.rightLabel];
}

#pragma mark - Config Cell
-(void) configWithString: (NSString*) string {
    self.leftLabel.text = string;
    self.rightLabel.text = string;
}

@end
