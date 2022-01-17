//
//  MovieModel.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <UIKit/UIKit.h>

@interface MovieModel: NSObject

@property (strong, nonatomic) NSNumber *movieId;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imageURL;

- (instancetype) initWithImage: (UIImage*)image title: (NSString*)title;

@end
