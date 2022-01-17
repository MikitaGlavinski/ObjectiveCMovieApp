//
//  ListTableViewCell.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void) setImage:(NSString*)imageURL title: (NSString*)title {
    self.movieTitle.text = title;
    
    [self.delegate getImageWith:imageURL completion:^(UIImage *movieImage) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.moviewImageView.image = movieImage;
        });
    }];
}

@end
