//
//  FilterCell.h
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Filter;

@interface FilterCell : UICollectionViewCell

@property (strong, nonatomic) Filter *filter;

- (void) construct;

@end
