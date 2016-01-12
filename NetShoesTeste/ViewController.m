//
//  ViewController.m
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 09/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Datasource and delegate
    self.productCollectionView.dataSource = self;
    self.productCollectionView.delegate = self;
    
    // Removing the text from the back button
    self.navigationController.navigationBar.topItem.title = @"";
    
    // 
    [self setCellsConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.productDicArray.count;
    return 16;
}

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------ */

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ProductCell";
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID
                                                                                forIndexPath:indexPath];
    
    // Fill content
    [cell fillCellContent:[self.productDicArray objectAtIndex:indexPath.row]];
    
    // Adding border
    cell.layer.borderWidth = 2.0f;
    cell.layer.borderColor = [UIColor colorWithRed:100
                                             green:100
                                              blue:100
                                             alpha:1.0].CGColor;
    
    return cell;
}

// Cell size adjustments
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width;
    CGFloat height;
    CGRect frame;
    UINib *nib;
    
    width = (CGRectGetWidth(self.productCollectionView.frame) - 24) / 2;
    height = width + 92;

    
    if(!self.estimatedCell)
    {
        nib = [UINib nibWithNibName:@"ProductCollectionViewCell"
                             bundle:nil];
        
        self.estimatedCell = (ProductCollectionViewCell *)[nib instantiateWithOwner:nil options:nil].firstObject;
    }
    
    frame = self.estimatedCell.frame;
    frame.size = CGSizeMake(width, height);
    self.estimatedCell.frame = frame;
    
    
    NSLog(@"Width: %.f", width);
    NSLog(@"Height: %.f", height);
    
    
    return self.estimatedCell.frame.size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected collection cell: %li", (long)indexPath.row);
}

#pragma mark - Methods
- (void)setCellsConfig
{
    /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
    // Register Class
    [self.productCollectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:@"ProductCell"];
    
    // Register Xib
    [self.productCollectionView registerNib:[UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ProductCell"];
    /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
    
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumInteritemSpacing = 8;
    flow.sectionInset = UIEdgeInsetsMake((int)flow.minimumInteritemSpacing, (int)flow.minimumInteritemSpacing, (int)flow.minimumInteritemSpacing, (int)flow.minimumInteritemSpacing);
    flow.minimumLineSpacing = 8;
    self.productCollectionView.collectionViewLayout = flow;
}

@end
