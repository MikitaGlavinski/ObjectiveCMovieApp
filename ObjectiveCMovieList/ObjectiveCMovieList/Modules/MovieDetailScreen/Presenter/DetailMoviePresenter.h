//
//  DetailMoviePresenter.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import <UIKit/UIKit.h>
#import "DetailMovieViewController.h"
#import "NetworkService.h"

@interface DetailMoviePresenter : NSObject

@property (weak, nonatomic) DetailMovieViewController *view;
@property (strong, nonatomic) NSNumber *movieId;
- (void)viewDidLoad;
- (void)getImageWith: (NSString *)filePath completion: (void (^)(UIImage *image))completionHandler;
- (void)getCommonImageWith: (NSString *)filePath completion: (void (^)(UIImage *image))completionHandler;

@end
