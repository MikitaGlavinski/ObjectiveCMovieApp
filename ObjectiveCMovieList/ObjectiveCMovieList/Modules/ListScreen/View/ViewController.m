//
//  ViewController.m
//  ObjectiveCMovieList
//
//  Created by Mikita Glavinski on 1/13/22.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "ListPresenter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<MovieModel *> *movies;
@property (strong, nonatomic) ListPresenter *presenter;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [[ListPresenter alloc] init];
    self.presenter.view = self;
    [self.presenter viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.movies = [NSMutableArray<MovieModel*> arrayWithObjects:[[MovieModel alloc] initWithImage: [UIImage imageNamed:@"tiger"] title:@"Spider-man"], nil];
    [self.movies addObject: [[MovieModel alloc] initWithImage: [UIImage imageNamed:@"tiger"] title:@"Spider-man"]];
    self.tableView.dataSource = self;
    self.tableView.delegate = self; 
}

- (void)setupTableView:(NSMutableArray<MovieModel *> *)models {
    self.movies = models;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    cell.delegate = self;
    [cell setImage: self.movies[indexPath.row].imageURL title: self.movies[indexPath.row].title];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailMovieViewController *detailView = [storyboard instantiateViewControllerWithIdentifier:@"DetailMovie"];
    detailView.movieId = self.movies[indexPath.row].movieId;
    [self.navigationController pushViewController:detailView animated:YES];
}

- (void)getImageWith:(nonnull NSString *)imageURL completion:(nonnull void (^)(UIImage * _Nonnull))completionHandler {
    [self.presenter getImageWith:imageURL completion:completionHandler];
}

@end
