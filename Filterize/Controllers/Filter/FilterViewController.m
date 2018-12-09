//
//  FilterViewController.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCell.h"
#import "Filter.h"

@interface FilterViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UICollectionView *filtersCollection;

@property (strong, nonatomic) NSArray <Filter *> *filters;

@end

@implementation FilterViewController

#pragma mark - Life Cycle

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self configureNavigationBar];
    [self configureVariables];
    [self configureCollectionView];
}

#pragma mark - Configuring

- (void) configureNavigationBar {
    UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage flt_header]];
    self.navigationItem.titleView = imageView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage: [UIImage flt_ic_share].flt_original style: UIBarButtonItemStylePlain target: self action: @selector(share)];
}

- (void) configureVariables {
    self.filters = [Filter withNames: [NSString flt_filters] image: [UIImage flt_flamingo]];
    self.imageView.image = self.image;
}

- (void) configureCollectionView {
    self.filtersCollection.delegate = self;
    self.filtersCollection.dataSource = self;
    
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *) self.filtersCollection.collectionViewLayout;
    flow.estimatedItemSize = CGSizeMake(96.f, 128.f);
    flow.itemSize = UICollectionViewFlowLayoutAutomaticSize;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.filtersCollection registerNib: [FilterCell flt_nib]
             forCellWithReuseIdentifier: [FilterCell flt_identifier]];
}

#pragma mark - Actions

- (void) share {
    NSArray *items = @[[UIImage imageWithCGImage: self.imageView.image.CGImage]];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems: items applicationActivities: nil];
    [self presentViewController: activityViewController animated: YES completion: nil];
}

#pragma mark - Collection View

- (NSInteger) collectionView:(UICollectionView *)collectionView
      numberOfItemsInSection:(NSInteger)section {
    return self.filters.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [FilterCell flt_identifier];
    FilterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier
                                                                 forIndexPath: indexPath];
    cell.filter = self.filters[indexPath.row];
    [cell construct];
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath: indexPath animated: YES];
    
    Filter *filter = self.filters[indexPath.row];
    self.imageView.image = filter.isNormal ? self.image : [self.image flt_filterize: filter.name];
}

@end
