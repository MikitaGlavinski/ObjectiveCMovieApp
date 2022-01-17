//
//  ListTableViewCell.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import <UIKit/UIKit.h>
#import "NetworkService.h"

@protocol ListCellDelegate

@required
- (void)getImageWith: (NSString *)imageURL completion: (void (^)(UIImage *movieImage))completionHandler;

@end

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *moviewImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) id <ListCellDelegate> delegate;

- (void) setImage:(NSString*)imageURL title: (NSString*)title;

@end
