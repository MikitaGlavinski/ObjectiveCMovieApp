//
//  ViewController.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <UIKit/UIKit.h>
#import "ListTableViewCell.h"
#import "MovieModel.h"
#import "DetailMovieViewController.h"
#import "DetailMoviePresenter.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ListCellDelegate>

- (void)setupTableView: (NSMutableArray<MovieModel *> *)models;
@end

