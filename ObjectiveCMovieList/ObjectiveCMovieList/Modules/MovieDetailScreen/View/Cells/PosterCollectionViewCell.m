//
//  PosterCollectionViewCell.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import "PosterCollectionViewCell.h"
#import "MovieImageModel.h"

@implementation PosterCollectionViewCell

- (void)configureWith: (MovieImageModel *)image {
    [self.delegate getImageWith:image.filePath completion:^(UIImage *movieImage) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = movieImage;
        });
    }];
}

@end
