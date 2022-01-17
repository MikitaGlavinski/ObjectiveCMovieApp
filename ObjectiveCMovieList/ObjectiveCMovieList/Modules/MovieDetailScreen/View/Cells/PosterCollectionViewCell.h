//
//  PosterCollectionViewCell.h
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import <UIKit/UIKit.h>
#import "MovieImageModel.h"

@protocol PosterCellDelegate

@required
- (void)getImageWith: (NSString *)imageURL completion: (void (^)(UIImage *movieImage))completionHandler;

@end

@interface PosterCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id <PosterCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (void)configureWith: (MovieImageModel *)image;

@end
