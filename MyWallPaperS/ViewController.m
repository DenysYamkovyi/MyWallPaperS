//
//  ViewController.m
//  MyWallPaperS
//
//  Created by Denis Yamkovyy on 6/11/16.
//  Copyright © 2016 CompanyYamkovyiBrother's. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+LoadJPG.h"
#import "WallpaperCollectionViewController.h"


#define kNumberOfCellsPerLine 3
#define kCollectionImageTag 10


@interface ViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray *imagesNamesSmall;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagesNamesSmall  = @[@"1-Small", @"2-Small", @"3-Small", @"4-Small", @"5-Small",@"6-Small", @"7-Small", @"8-Small", @"9-Small", @"10-Small"];
    self.title = @"Wallpapers";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(openMenu)];
    self.navigationItem.leftBarButtonItem = leftButton;
//    
//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] init];
//    leftBarButtonItem.title = @"Menu";
//    [leftBarButtonItem setAction:@selector(openMenu)];
//    self.navigationController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((collectionView.bounds.size.width - 4) / kNumberOfCellsPerLine, (collectionView.bounds.size.width  / kNumberOfCellsPerLine) * 1.2 ) ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesNamesSmall.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if(!cell)
    {
        cell = [[UICollectionViewCell alloc] init];
    }
    
    UIImageView *imageView = [cell viewWithTag:kCollectionImageTag];
    if(!imageView)
    {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height)];
        [cell addSubview:imageView];
    }
    imageView.tag = kCollectionImageTag;
    imageView.image = [UIImage imageWithJPGName:self.imagesNamesSmall[indexPath.row]];
    
    return cell;
}

- (void) openMenu
{
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] init];
    leftBarButtonItem.title = @"Menu";
    [leftBarButtonItem setAction:@selector(openMenu)];
    self.navigationController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationController.navigationBarHidden = false;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"segueIdentifier" sender:[collectionView cellForItemAtIndexPath:indexPath]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueIdentifier"])
    {
        WallpaperCollectionViewController *wc = segue.destinationViewController;
        NSUInteger item = [self.collectionView indexPathForCell:(UICollectionViewCell*) sender].row;
        wc.currentIndex = item;
    }
}

@end
