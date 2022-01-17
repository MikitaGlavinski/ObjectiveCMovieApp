//
//  ListPresenter.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "NetworkService.h"

@interface ListPresenter: NSObject
@property (weak, nonatomic) ViewController *view;
- (void)viewDidLoad;
- (void)getImageWith: (NSString *)imageURL completion: (void (^)(UIImage *movieImage))completionHandler;

@end
