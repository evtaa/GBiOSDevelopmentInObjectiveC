//
//  TabBarController.m
//  HomeTask1
//
//  Created by Alexandr Evtodiy on 18.03.2021.
//

#import "TabBarController.h"
#import "MainViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

-(instancetype) init {
    self = [super init];
    if (self) {
        self.viewControllers = [self createViewControllers];
        self.selectedIndex = 0;
        self.tabBar.tintColor = [UIColor purpleColor];
        self.tabBar.barTintColor =[UIColor blackColor];
    }
    return  self;
}

- (NSMutableArray <UIViewController *> *) createViewControllers {
    MainViewController *firstMainViewController = [[MainViewController alloc] initWithTypeOfSpace:TypeOfSpaceFirst];
    firstMainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Космос" image:[UIImage imageNamed:@"space"] tag:0];
    UINavigationController* firstNavigationController = [[UINavigationController alloc] initWithRootViewController: firstMainViewController];
    MainViewController *secondMainViewController = [[MainViewController alloc] initWithTypeOfSpace:TypeOfSpaceSecond];
    secondMainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Еще космоса" image:[UIImage imageNamed:@"space"] tag:1];
    UINavigationController* secondNavigationController = [[UINavigationController alloc] initWithRootViewController: secondMainViewController];
    NSMutableArray <UIViewController *> *controllers = [[NSMutableArray alloc] initWithObjects:firstNavigationController, secondNavigationController, nil];
    return controllers;
}

@end
