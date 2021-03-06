//
//  ViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//

#import "MainViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) UIButton *buttonToPushSecondViewController;
@property (strong, nonatomic) UIButton *buttonToPushThirdViewController;
@property (strong, nonatomic) UILabel *label;
@end

@implementation MainViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Setup Controls
- (void) setup {
    [self setupButtonToPushSecondViewController];
    [self setupButtonToPushThirdViewController];
    [self setupLabel];
    [self setupView];
}

- (void) setupView {
    self.view.backgroundColor = [UIColor redColor];
}

- (void) setupButtonToPushSecondViewController {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150.0, [UIScreen mainScreen].bounds.size.height/2 - 25.0, 300.0, 50.0);
    self.buttonToPushSecondViewController = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.buttonToPushSecondViewController setTitle:@"The tableView as a object" forState:UIControlStateNormal];
    self.buttonToPushSecondViewController.backgroundColor = [UIColor blueColor];
    self.buttonToPushSecondViewController.tintColor = [UIColor whiteColor];
    self.buttonToPushSecondViewController.frame = frame;
    [self.buttonToPushSecondViewController addTarget:self action:@selector(pushSecondViewControllerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonToPushSecondViewController];
}

- (void) setupButtonToPushThirdViewController {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150.0, [UIScreen mainScreen].bounds.size.height/2 + 50.0, 300.0, 50.0);
    self.buttonToPushThirdViewController = [UIButton buttonWithType: UIButtonTypeSystem];
    [ self.buttonToPushThirdViewController setTitle:@"The tableView as a viewController" forState:UIControlStateNormal];
    self.buttonToPushThirdViewController.backgroundColor = [UIColor blueColor];
    self.buttonToPushThirdViewController.tintColor = [UIColor whiteColor];
    self.buttonToPushThirdViewController.frame = frame;
    [ self.buttonToPushThirdViewController addTarget:self action:@selector(pushThirdViewControllerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.buttonToPushThirdViewController];
}

- (void) setupLabel {
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
    [self.navigationController pushViewController: secondViewController animated:false];
}

- (void)pushThirdViewControllerButtonDidTap:(UIButton *)sender
{
    ThirdViewController* thirdViewController = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController: thirdViewController animated:false];
}

@end
