//
//  DetailMovieViewController.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import <UIKit/UIKit.h>
#import "DetailMovieModel.h"
#import "MovieImageModel.h"
#import "PosterCollectionViewCell.h"

@interface DetailMovieViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PosterCellDelegate>

@property (strong, nonatomic) NSNumber *movieId;
@property (strong, nonatomic) NSMutableArray<MovieImageModel*> *imageModels;
- (void)setupView: (DetailMovieModel *)movieModel;
- (void)setupPosters: (NSMutableArray<MovieImageModel *> *)imageModels;

@end
