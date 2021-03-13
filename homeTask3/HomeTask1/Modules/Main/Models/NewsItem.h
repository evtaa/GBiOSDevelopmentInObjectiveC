//
//  NewsItem.h
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 10.03.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsItem : NSObject
@property (strong,nonatomic) NSString *id;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *author;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *descriptionNewsItem;
@property (strong,nonatomic) NSString *url;
@property (strong,nonatomic) NSString *urlToImage;
@property (strong,nonatomic) NSDate *publishedAt;
@property (strong,nonatomic) NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
