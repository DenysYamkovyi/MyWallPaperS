//
//  WallpaperCollectionViewController.m
//  MyWallPaperS
//
//  Created by Denis Yamkovyy on 7/18/16.
//  Copyright © 2016 CompanyYamkovyiBrother's. All rights reserved.
//

#import "WallpaperCollectionViewController.h"
#import "UIImage+LoadJPG.h"


@interface WallpaperCollectionViewController() <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *bottomTitle;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *imagesNamesLarge;

@end

@implementation WallpaperCollectionViewController


static NSString * const reuseIdentifier = @"WallpaperCell";

#pragma mark - Memory management

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagesNamesLarge  = @[@"1-Large", @"2-Large", @"3-Large", @"4-Large", @"5-Large",@"6-Large", @"7-Large", @"8-Large", @"9-Large", @"10-Large"];
    self.collectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden: true];
    self.navigationController.toolbarHidden = false;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.currentIndex inSection:0] atScrollPosition:0 animated:false];
}

#pragma mark - Action Handlers

#pragma mark - Public

#pragma mark - Private

#pragma mark - Delegates

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size.height);
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesNamesLarge.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height)];
    
    UIImage *im = [UIImage imageWithJPGName:self.imagesNamesLarge[indexPath.row]];
    imageView.image = im;
    
    [cell.contentView addSubview: imageView];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
- (IBAction)onShareAction:(id)sender
{
    
}

- (IBAction)onCloseWallpaperAction:(id)sender
{
    
}

- (IBAction)onGiveMoreInfoAction:(id)sender
{
    
}


@end
