//
//  ViewController.h
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 09/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "ProductCollectionViewCell.h"
#import "Constants.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

// Array
@property (strong, nonatomic) NSArray *productArray;

// CollectionView
@property (weak, nonatomic) IBOutlet UICollectionView *productCollectionView;

// CollectionCell
@property (nonatomic, strong) ProductCollectionViewCell *estimatedCell;


// Methods
- (void)setCellsConfig;

@end

