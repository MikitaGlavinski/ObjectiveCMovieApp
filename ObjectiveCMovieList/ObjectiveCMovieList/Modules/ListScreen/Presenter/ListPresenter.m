//
//  ListPresenter.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <Foundation/Foundation.h>
#import "ListPresenter.h"

@implementation ListPresenter

- (void)viewDidLoad {
    __weak typeof(self) weakSelf = self;
    [NetworkService.sharedManager getPopularMovies:^(NSMutableArray<MovieModel *> *movie) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.view setupTableView:movie];
        });
    }];
}

- (void)getImageWith:(NSString *)imageURL completion:(void (^)(UIImage *))completionHandler {
    [NetworkService.sharedManager getImageWith:imageURL completion:completionHandler];
}
@end
