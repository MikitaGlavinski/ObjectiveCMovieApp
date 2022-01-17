//
//  MovieModel.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <Foundation/Foundation.h>
#import "MovieModel.h"

@implementation MovieModel

- (instancetype) initWithImage: (UIImage*)image title: (NSString*)title {
    self = [super init];
    
    if (self) {
        self.image = image;
        self.title = title;
    }
    return  self;
}
@end
