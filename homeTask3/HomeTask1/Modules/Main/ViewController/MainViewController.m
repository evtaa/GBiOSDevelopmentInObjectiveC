//
//  ViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//
#define NewsItemCellReuseIdentifier @"NewsItemCellIdentifier"

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "SecondViewController.h"
#import "SearchRequest.h"
#import "APIManager.h"


@interface MainViewController ()
@property (strong, nonatomic) UITextField *searchTextField;
@property (strong, nonatomic) UIButton *searchButton;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *newsItems;
@property (nonatomic) SearchRequest searchRequest;
@end

@implementation MainViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Setup Controls
- (void) setup {
    [self setupView];
    [self setupSearchTextField];
    [self setupTableView];
    [self setupSearchButton];
    
}

- (void) setupView {
    self.title = @"World news";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) setupSearchTextField {
    CGRect frame = CGRectMake(0.0,
                              self.navigationController.navigationBar.bounds.origin.y + self.navigationController.navigationBar.bounds.size.height + 20,
                              [UIScreen mainScreen].bounds.size.width - 50,
                              50.0);
    self.searchTextField =[[UITextField alloc] initWithFrame:frame];
    self.searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchTextField.placeholder = @"Введите значение...";
    
    [self.view addSubview:self.searchTextField];
}

- (void) setupSearchButton {
    CGRect frame = CGRectMake(self.searchTextField.bounds.size.width,
                              self.navigationController.navigationBar.bounds.origin.y + self.navigationController.navigationBar.bounds.size.height + 20,
                              [UIScreen mainScreen].bounds.size.width - self.searchTextField.bounds.size.width,
                              50.0);
    self.searchButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.searchButton setTitle:@"Поиск" forState:UIControlStateNormal];
    self.searchButton.backgroundColor = [UIColor blueColor];
    self.searchButton.tintColor = [UIColor whiteColor];
    self.searchButton.frame = frame;
    [self.searchButton addTarget:self action:@selector(searchButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchButton];
}

- (void) setupTableView {
    CGRect frame = CGRectMake(0.0,
                              self.navigationController.navigationBar.bounds.origin.y + self.navigationController.navigationBar.bounds.size.height + self.searchTextField.bounds.size.height + 20.0,
                             // CGRectGetMaxY(self.searchTextField.frame)+10,
                              [UIScreen mainScreen].bounds.size.width,
                              [UIScreen mainScreen].bounds.size.height - self.searchTextField.bounds.size.height - self.navigationController.navigationBar.bounds.size.height );
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier:NewsItemCellReuseIdentifier];
    [self.view addSubview:self.tableView];
}

#pragma mark - Action
- (void)searchButtonDidTap:(UIButton *)sender{
    _searchRequest.query = self.searchTextField.text;
    [[APIManager sharedInstance] newsItemsWithRequest:_searchRequest withCompletion:^(NSMutableArray *newsItems) {
        if (newsItems.count > 0) {
            self.newsItems = newsItems;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Navigation
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.newsItem = self.newsItems[indexPath.row-1];
    [self.navigationController pushViewController:secondViewController animated:true];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsItems.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NewsItemCellReuseIdentifier forIndexPath:indexPath];
    NewsItem *item = self.newsItems[indexPath.row];
    [cell configCell:item];
    return cell;
}

@end
