//
//  Image.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 18.03.2021.
//

#import "Image.h"

@implementation Image

-(instancetype) initWithName: (NSString *) name{
    self = [super init];
    if (self) {
        _image = [UIImage imageNamed:name];
        _name = name;
    }
    return self;
}
@end
