//
//  MainTableViewCell.h
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 10.03.2021.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface MainTableViewCell : UITableViewCell

- (void)configCell:(NewsItem *)newsItem;

@end

