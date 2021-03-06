//
//  ViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

#pragma mark - Configure Controls
- (void) config {
    [self configButtonToPushSecondViewController];
    [self configLabel];
    [self configView];
}

- (void) configView {
    self.view.backgroundColor = [UIColor redColor];
}

- (void) configButtonToPushSecondViewController {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, [UIScreen mainScreen].bounds.size.height/2 - 25.0, 200.0, 50.0);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Перейти" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(pushSecondViewControllerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) configLabel {
    CGRect labelFrame = CGRectMake(40.0, 40.0, [UIScreen mainScreen].bounds.size.width - 80.0, [UIScreen mainScreen].bounds.size.height/2 - 80.0);
    UILabel *label = [[UILabel alloc] initWithFrame: labelFrame];
    label.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Первое окно!";
    [self.view addSubview: label];

}

#pragma mark - Navigation
- (void)pushSecondViewControllerButtonDidTap:(UIButton *)sender
{
    SecondViewController* secondViewController = [[SecondViewController alloc] init];
    secondViewController.view.backgroundColor = [UIColor greenColor];
    //[self.navigationController showViewController: secondViewController sender:nil];
    [self.navigationController pushViewController: secondViewController animated:false];
}

@end
