//
//  NetworkService.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NetworkService.h"

@implementation NetworkService

+ (instancetype)sharedManager {
    static NetworkService* sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)getImageWith: (NSString *)url completion: (void (^)(UIImage *movieImage))completionHandler {
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"https://image.tmdb.org/t/p/w500", url]];
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completionHandler(image);
    }] resume];
}

- (void)getOriginalImageWith: (NSString *)url completion: (void (^)(UIImage *movieImage))completionHandler {
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"https://image.tmdb.org/t/p/original", url]];
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completionHandler(image);
    }] resume];
}

- (void)getPopularMovies: (void (^)(NSMutableArray<MovieModel*>*))completionHandler {
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/movie/popular?api_key=de8c410ebd589773b4714db8f59baba3"]];
    
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        NSError *decodeError;
        NSDictionary *moviesJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&decodeError];
        if (decodeError) {
            NSLog(@"%@", decodeError.localizedDescription);
            return;
        }
        
        NSArray *moviesArray = moviesJSON[@"results"];
        NSMutableArray<MovieModel*> *completeMovies = [[NSMutableArray<MovieModel*> alloc] init];
        for (NSDictionary *movie in moviesArray) {
            MovieModel *movieModel = [[MovieModel alloc] init];
            movieModel.movieId = movie[@"id"];
            movieModel.imageURL = movie[@"backdrop_path"];
            movieModel.title = movie[@"title"];
            [completeMovies addObject:movieModel];
        }
        completionHandler(completeMovies);
    }] resume];
}

- (void)getMovieDetail: (NSNumber *)movieId completion: (void (^)(DetailMovieModel *detailMovieModel))completionHandler {
    NSString *url = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=de8c410ebd589773b4714db8f59baba3", movieId];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        NSError *decodeError;
        NSDictionary *movieJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&decodeError];
        if (decodeError) {
            NSLog(@"%@", decodeError.localizedDescription);
            return;
        }
        DetailMovieModel *movieModel = [[DetailMovieModel alloc] init];
        movieModel.movieId = movieJSON[@"id"];
        movieModel.title = movieJSON[@"title"];
        movieModel.releaseDate = movieJSON[@"release_date"];
        movieModel.runTime = movieJSON[@"runtime"];
        movieModel.budget = movieJSON[@"budget"];
        movieModel.backdropPath = movieJSON[@"backdrop_path"];
        movieModel.overview = movieJSON[@"overview"];
        
        completionHandler(movieModel);
    }] resume];
}

- (void)getMovieImages: (NSNumber *)movieId completion: (void (^)(NSMutableArray<MovieImageModel*> *movieImageModels))completionHandler {
    NSString *url = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/images?api_key=de8c410ebd589773b4714db8f59baba3", movieId];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        NSError *decodeError;
        NSDictionary *movieJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&decodeError];
        if (decodeError) {
            NSLog(@"%@", decodeError.localizedDescription);
            return;
        }
        NSArray *moviePosters = movieJSON[@"backdrops"];
        NSMutableArray<MovieImageModel*> *imageModels = [[NSMutableArray alloc] init];
        for (NSDictionary *poster in moviePosters) {
            MovieImageModel *imageModel = [[MovieImageModel alloc] init];
            imageModel.movieId = poster[@"id"];
            imageModel.filePath = poster[@"file_path"];
            [imageModels addObject:imageModel];
        }
        completionHandler(imageModels);
    }] resume];
}

@end
