//
//  APIManager.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 10.03.2021.
//
#define API_TOKEN @"5528435fe1e44342b911aec8367b30ff"
#define API_URL_NEWS_ITEMS @"https://newsapi.org/v2/everything"

#import "APIManager.h"
#import "SearchRequest.h"
#import "NewsItem.h"
#import <UIKit/UIKit.h>

@implementation APIManager

#pragma mark - Singleton
+ (instancetype)sharedInstance {
    static APIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[APIManager alloc] init];
    });
    return instance;
}

#pragma mark - Public

- (void)newsItemsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSMutableArray *newsItems))completion {
    NSString *urlString = [NSString stringWithFormat:@"%@?%@&apiKey=%@", API_URL_NEWS_ITEMS, SearchRequestQuery(request), API_TOKEN];
    [self load:urlString withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
        
        if (response) {
            NSMutableArray *array = [[NSMutableArray alloc] init];
            NSArray *articles = [response valueForKey:@"articles"];
            for (NSDictionary *object in articles) {
                NewsItem *item = [[NewsItem alloc] initWithDictionary:object];
                [array addObject:item];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(array);
            });
        }
        
//        if (response) {
//            NSDictionary *json = [[response valueForKey:@"data"] valueForKey:request.destination];
//            NSMutableArray *array = [NSMutableArray new];
//            for (NSString *key in json) {
//                NSDictionary *value = [json valueForKey: key];
//                Ticket *ticket = [[Ticket alloc] initWithDictionary:value];
//                ticket.from = request.origin;
//                ticket.to = request.destination;
//                [array addObject:ticket];
//            }
//            dispatch_async(dispatch_get_main_queue(), ^{
//                completion(array);
//            });
//        }
    }];
}

#pragma mark - Private
- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
    }] resume] ;
}

NSString * SearchRequestQuery(SearchRequest request) {
    NSString *result = [NSString stringWithFormat:@"q=%@", request.query];
//    if (request.departDate && request.returnDate) {
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.dateFormat = @"yyyy-MM";
//        result = [NSString stringWithFormat:@"%@&depart_date=%@&return_date=%@", result, [dateFormatter stringFromDate:request.departDate], [dateFormatter stringFromDate:request.returnDate]];
//    }
    return result;
}

@end
