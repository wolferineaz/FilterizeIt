//
//  FilterCell.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "FilterCell.h"
#import "Filter.h"

@interface FilterCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation FilterCell

- (void) awakeFromNib {
    [super awakeFromNib];
    
    self.imageView.layer.cornerRadius = 8.f;
    self.imageView.clipsToBounds = YES;
}

- (void) construct {
    self.nameLabel.text = self.filter.name.flt_localized;
    if (self.filter.isNormal) {
        self.imageView.image = self.filter.input;
        [self.activityIndicator stopAnimating];
    } else {
        [self.filter loadImage:^(UIImage *image) {
            self.imageView.image = image;
            [self.activityIndicator stopAnimating];
        }];
    }
}

- (void) setSelected:(BOOL)selected {
    [super setSelected: selected];
    self.imageView.alpha = selected ? 0.5f : 1.0f;
    self.nameLabel.alpha = selected ? 0.5f : 1.0f;
}

- (void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.imageView.alpha = highlighted ? 0.5f : 1.0f;
    self.nameLabel.alpha = highlighted ? 0.5f : 1.0f;
}

@end
