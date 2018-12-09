//
//  Filter.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "Filter.h"

@interface Filter()

@property (strong, nonatomic) UIImage *output;

@end

@implementation Filter

#pragma mark - Init

+ (instancetype) withName: (NSString *) name image: (UIImage *) input {
    Filter *filter = [Filter new];
    filter.name = name;
    filter.input = input;
    return filter;
}

+ (NSArray <Filter *> *) withNames: (NSArray <NSString *> *) names image: (UIImage *) image {
    NSMutableArray* mapped = [[NSMutableArray alloc] initWithCapacity: names.count];
    [names enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Filter *filter = [Filter withName: obj image: image];
        [mapped addObject: filter];
    }];
    return mapped;
}

#pragma mark - Filtering

- (void) loadImage: (void(^)(UIImage *image)) block {
    if (_output) {
        block(_output);
    } else {
        __strong typeof(self) strongSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            CIContext *imageContext = [CIContext contextWithOptions: nil];
            CIFilter *filter = [CIFilter filterWithName: self.name];
            [filter setValue: [CIImage imageWithCGImage: self.input.CGImage] forKey: kCIInputImageKey];
            CIImage *ciImage = filter.outputImage;
            CGImageRef cgImageRef = [imageContext createCGImage: ciImage fromRect: [ciImage extent]];
            strongSelf.output = [UIImage imageWithCGImage: cgImageRef scale: self.input.scale orientation: self.input.imageOrientation];
            
            CGImageRelease(cgImageRef);
            ciImage = nil;
            filter = nil;
            imageContext = nil;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                block(strongSelf.output);
            });
        });
    }
}

#pragma mark - Accessors

- (BOOL) isNormal {
    return [self.name isEqualToString: @"CIFilterNone"];
}

@end
