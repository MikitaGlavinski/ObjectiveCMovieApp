//
//  DetailMoviePresenter.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import "DetailMoviePresenter.h"

@implementation DetailMoviePresenter

- (void)viewDidLoad {
    [NetworkService.sharedManager getMovieDetail:self.movieId completion:^(DetailMovieModel *detailMovieModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view setupView:detailMovieModel];
        });
    }];
    
    [NetworkService.sharedManager getMovieImages:self.movieId completion:^(NSMutableArray<MovieImageModel *> *movieImageModels) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view setupPosters:movieImageModels];
        });
    }];
}

- (void)getImageWith: (NSString *)filePath completion: (void (^)(UIImage *image))completionHandler {
    [NetworkService.sharedManager getOriginalImageWith:filePath completion:completionHandler];
}

- (void)getCommonImageWith: (NSString *)filePath completion: (void (^)(UIImage *image))completionHandler {
    [NetworkService.sharedManager getImageWith:filePath completion:completionHandler];
}

@end
