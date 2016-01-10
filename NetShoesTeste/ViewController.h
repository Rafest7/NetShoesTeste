//
//  ViewController.h
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 09/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCollectionViewCell.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

// Array
@property (strong, nonatomic) NSArray *canaisDicArray;

// CollectionView
@property (weak, nonatomic) IBOutlet UICollectionView *productsCollectionView;

// CollectionCell
@property (nonatomic, strong) ProductCollectionViewCell *regularCell;


// Methods
- (void)setCellsConfig;

@end

