//
//  NewsItem.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 10.03.2021.
//

#import "NewsItem.h"

@implementation NewsItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSDictionary *source = [dictionary valueForKey:@"source"];
        _id = [source valueForKey:@"id"];
        _name = [source valueForKey:@"name"];
        _author = [dictionary valueForKey:@"author"];
        _title = [dictionary valueForKey:@"title"];
        _descriptionNewsItem = [dictionary valueForKey:@"description"];
        _url = [dictionary valueForKey:@"url"];
        _urlToImage = [dictionary valueForKey:@"urlToImage"];
        _publishedAt = dateFromString([dictionary valueForKey:@"publishedAt"]);
        _content = [dictionary valueForKey:@"content"];
    }
    return self;
}

NSDate *dateFromString(NSString *dateString) {
    if (!dateString) { return  nil; }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *correctSrtingDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctSrtingDate = [correctSrtingDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter dateFromString: correctSrtingDate];
}

@end
