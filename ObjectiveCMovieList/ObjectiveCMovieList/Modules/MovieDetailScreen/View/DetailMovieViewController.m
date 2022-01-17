//
//  DetailMovieViewController.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/14/22.
//

#import "DetailMovieViewController.h"
#import "DetailMoviePresenter.h"
#import "MovieImageModel.h"

@interface DetailMovieViewController ()

@property (strong, nonatomic) DetailMoviePresenter *presenter;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *runtimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *budgetLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DetailMovieViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [[DetailMoviePresenter alloc] init];
    self.presenter.view = self;
    self.presenter.movieId = _movieId;
    [self.presenter viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (void)setupView: (DetailMovieModel *)movieModel {
    _titleLabel.text = movieModel.title;
    _overviewLabel.text = movieModel.overview;
    _releaseLabel.text = movieModel.releaseDate;
    _runtimeLabel.text = [NSString stringWithFormat:@"%@ %@", movieModel.runTime, @"min"];
    _budgetLabel.text = [NSString stringWithFormat:@"%@%@", movieModel.budget, @"$"];
    [self.presenter getImageWith:movieModel.backdropPath completion:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImageView.image = image;
        });
    }];
}

- (void)setupPosters: (NSMutableArray<MovieImageModel *> *)imageModels {
    self.imageModels = imageModels;
    [self.collectionView reloadData];
}

- (IBAction)backButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageModels count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PosterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PosterCell" forIndexPath:indexPath];
    cell.delegate = self;
    [cell configureWith:self.imageModels[indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = UIScreen.mainScreen.bounds.size.width * 0.7;
    CGFloat height = self.collectionView.frame.size.height;
    return CGSizeMake(width, height);
}

- (void)getImageWith:(NSString *)imageURL completion:(void (^)(UIImage *))completionHandler {
    [self.presenter getCommonImageWith:imageURL completion:completionHandler];
}

@end
