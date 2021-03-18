//
//  SecondViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 02.03.2021.
//

#import "SecondViewController.h"
#import "SecondTableViewCell.h"
#define ReuseIdentifier @"CellIdentifier"

@interface SecondViewController ()
@property (strong, nonnull) NSMutableArray *array;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil ] ;
    [self setup];
}

#pragma mark - Setup Controls

-(void) setup {
    [self setupTableView];
}

-(void) setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.title = @"The tableView as a object";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
}

#pragma mark - TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SecondTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell =[[SecondTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:ReuseIdentifier];
    }
    NSString  *string = [[NSString alloc]  initWithString:self.array[indexPath.row] ];
    [cell configWithString:string];
    return cell;
}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.array removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 40)];
    header.textLabel.text = [NSString stringWithFormat:@"Section %ld", (long)section];
    header.textLabel.textAlignment = NSTextAlignmentLeft;
    return header;
}

@end
