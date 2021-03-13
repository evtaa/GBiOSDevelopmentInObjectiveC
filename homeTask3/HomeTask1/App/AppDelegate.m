//
//  AppDelegate.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    MainViewController* mainViewController = [[MainViewController alloc] init];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController: mainViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
