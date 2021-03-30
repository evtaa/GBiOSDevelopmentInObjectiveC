//
//  ViewController.h
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

typedef enum TypeOfSpace {
    TypeOfSpaceFirst, TypeOfSpaceSecond
} TypeOfSpace;

@interface MainViewController : UIViewController 
-(instancetype) initWithTypeOfSpace: (TypeOfSpace) typeOfSpace;
@end

