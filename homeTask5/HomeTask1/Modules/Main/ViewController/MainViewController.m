//
//  ViewController.m
//  SearchForAirTickets
//
//  Created by Alexandr Evtodiy on 27.02.2021.
//

#define ReuseIdentifier @"Identifier"

#import "MainViewController.h"
#import "MainViewCell.h"
#import "Image.h"


@interface MainViewController () <UICollectionViewDataSource, UISearchResultsUpdating>
@property (strong,nonatomic) NSMutableArray <Image *> *images;
@property (strong,nonatomic) NSMutableArray <Image *> *searchImages;
@property (strong,nonatomic) UICollectionView *collectionView;
@property (strong,nonatomic) UISearchController *searchController;
@property (nonatomic) TypeOfSpace typeOfSpace;
@end

@implementation MainViewController

-(instancetype) initWithTypeOfSpace: (TypeOfSpace) typeOfSpace {
    self = [super init];
    if (self) {
        _typeOfSpace = typeOfSpace;
    }
    return  self;
}

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    self.images = [self createArrayOfImages];
    // NSLog(@"%@",[self.images objectAtIndex:2].name);
    
}

#pragma mark - Configure Controls

- (void) config {
    [self configView];
    [self configSearchController];
    [self configCollectionView];
    
}

- (void) configView {
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}

- (void) configSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.obscuresBackgroundDuringPresentation = false;
    self.searchController.searchBar.placeholder = @"Search image";
    if (@available (iOS 11, *)) {
        self.navigationItem.searchController = self.searchController;
    } else {
       // self.collectionView.view = self.searchController.searchBar;
    }
     self.view.backgroundColor = [UIColor redColor];
}

- (void) configCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(100.0, 100.0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor =[UIColor blackColor];
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[MainViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
    [self.view addSubview:self.collectionView];
}

#pragma mark - Private

- (NSMutableArray <Image *> *) createArrayOfImages {
    NSMutableArray <Image *> *images;
    if (self.typeOfSpace == TypeOfSpaceFirst) {
        images = [NSMutableArray arrayWithObjects:
                                            [[Image alloc] initWithName:@"space2_02"],
                                            [[Image alloc] initWithName:@"space2_03"],
                                            [[Image alloc] initWithName:@"space2_04"],
                                            [[Image alloc] initWithName:@"space2_05"],
                                            [[Image alloc] initWithName:@"space2_06"],
                                            [[Image alloc] initWithName:@"space2_07"],
                                            [[Image alloc] initWithName:@"space2_08"],
                                            [[Image alloc] initWithName:@"space2_09"],
                                            [[Image alloc] initWithName:@"space2_10"],
                                            [[Image alloc] initWithName:@"space2_11"],
                                            [[Image alloc] initWithName:@"space2_12"],
                                            [[Image alloc] initWithName:@"space2_13"],
                                            [[Image alloc] initWithName:@"space2_14"],
                                            [[Image alloc] initWithName:@"space2_15"],
                                            [[Image alloc] initWithName:@"space2_16"],
                                            [[Image alloc] initWithName:@"space2_17"],
                                            [[Image alloc] initWithName:@"space2_18"],
                                            [[Image alloc] initWithName:@"space2_19"],
                                            [[Image alloc] initWithName:@"space2_20"],
                                            [[Image alloc] initWithName:@"space2_21"],
                                            [[Image alloc] initWithName:@"space2_22"],
                                            [[Image alloc] initWithName:@"space2_23"],
                                            [[Image alloc] initWithName:@"space2_24"],
                                            [[Image alloc] initWithName:@"space2_25"],
                                            [[Image alloc] initWithName:@"space2_26"],
                                            [[Image alloc] initWithName:@"space2_27"],
                                            [[Image alloc] initWithName:@"space2_28"],
                                            [[Image alloc] initWithName:@"space2_29"],
                                            [[Image alloc] initWithName:@"space2_30"],
                                            nil];
    } else {
    images = [NSMutableArray arrayWithObjects:
                                        [[Image alloc] initWithName:@"space3_02"],
                                        [[Image alloc] initWithName:@"space3_03"],
                                        [[Image alloc] initWithName:@"space3_04"],
                                        [[Image alloc] initWithName:@"space3_05"],
                                        [[Image alloc] initWithName:@"space3_06"],
                                        [[Image alloc] initWithName:@"space3_07"],
                                        [[Image alloc] initWithName:@"space3_08"],
                                        [[Image alloc] initWithName:@"space3_09"],
                                        [[Image alloc] initWithName:@"space3_10"],
                                        [[Image alloc] initWithName:@"space3_11"],
                                        [[Image alloc] initWithName:@"space3_12"],
                                        [[Image alloc] initWithName:@"space3_13"],
                                        [[Image alloc] initWithName:@"space3_14"],
                                        [[Image alloc] initWithName:@"space3_15"],
                                        [[Image alloc] initWithName:@"space3_16"],
                                        [[Image alloc] initWithName:@"space3_17"],
                                        [[Image alloc] initWithName:@"space3_18"],
                                        [[Image alloc] initWithName:@"space3_19"],
                                        [[Image alloc] initWithName:@"space3_20"],
                                        [[Image alloc] initWithName:@"space3_21"],
                                        [[Image alloc] initWithName:@"space3_22"],
                                        [[Image alloc] initWithName:@"space3_23"],
                                        [[Image alloc] initWithName:@"space3_24"],
                                        [[Image alloc] initWithName:@"space3_25"],
                                        [[Image alloc] initWithName:@"space3_26"],
                                        [[Image alloc] initWithName:@"space3_27"],
                                        [[Image alloc] initWithName:@"space3_28"],
                                        [[Image alloc] initWithName:@"space3_29"],
                                        [[Image alloc] initWithName:@"space3_30"],
                                        nil];
    }
    return images;
}

#pragma mark - UIColectionViewDataSource

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.searchController.isActive && (self.searchImages.count > 0))
    {
        return self.searchImages.count;
    }
    return self.images.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    if (self.searchController.isActive && (self.searchImages.count > 0))
    {
        Image *image = self.searchImages[indexPath.row];
        [cell configWithImage:image];
    } else {
        Image *image = self.images[indexPath.row];
        [cell configWithImage:image];
    }
    return cell;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if (searchController.searchBar.text) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", searchController.searchBar.text];
        self.searchImages = [self.images filteredArrayUsingPredicate: predicate];
        [self.collectionView reloadData];
    }
}



@end
