//
//  DetailMovieModel.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import <UIKit/UIKit.h>

@interface DetailMovieModel : NSObject

@property (strong, nonatomic) NSNumber *movieId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSNumber *runTime;
@property (strong, nonatomic) NSNumber *budget;
@property (strong, nonatomic) NSString *backdropPath;
@property (strong, nonatomic) NSString *overview;

@end
