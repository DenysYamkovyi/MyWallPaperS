//
//  WallpaperCollectionViewController.h
//  MyWallPaperS
//
//  Created by Denis Yamkovyy on 7/18/16.
//  Copyright © 2016 CompanyYamkovyiBrother's. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallpaperCollectionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSUInteger currentIndex;

@end
