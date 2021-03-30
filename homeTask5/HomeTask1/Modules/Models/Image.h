//
//  Image.h
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 18.03.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Image : NSObject
@property (strong, nonatomic) NSMutableString *name;
@property (strong, nonatomic) UIImage *image;
-(instancetype) initWithName: (NSString *) name;
@end


