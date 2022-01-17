//
//  NetworkService.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "DetailMovieModel.h"
#import "MovieImageModel.h"

@interface NetworkService: NSObject

+ (instancetype)sharedManager;
- (void)getPopularMovies: (void (^) (NSMutableArray<MovieModel*>* movie))completionHandler;
- (void)getImageWith: (NSString *)url completion: (void (^)(UIImage *movieImage))completionHandler;
- (void)getOriginalImageWith: (NSString *)url completion: (void (^)(UIImage *movieImage))completionHandler;
- (void)getMovieDetail: (NSNumber *)movieId completion: (void (^)(DetailMovieModel *detailMovieModel))completionHandler;
- (void)getMovieImages: (NSNumber *)movieId completion: (void (^)(NSMutableArray<MovieImageModel*> *movieImageModels))completionHandler;

@end
