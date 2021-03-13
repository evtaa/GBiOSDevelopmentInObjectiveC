//
//  APIManager.h
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 10.03.2021.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"
#import "SearchRequest.h"

@interface APIManager : NSObject
+ (instancetype)sharedInstance;
- (void) newsItemsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSMutableArray *newsItems))completion;
@end


