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
    
    // Navigation Bar Logo
    UIImage *img = [UIImage imageNamed:@"netshoes_logo.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 125, 19)];
    [imgView setImage:img];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    
    // Removing the text from the back button
    self.navigationController.navigationBar.topItem.title = @"";
    
    // AFNetworking
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    /* -------------------------- New part for Netshoes -------------------------------- */
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];    
//    [manager.requestSerializer setValue:@"Netshoes App" forHTTPHeaderField:@"User-Agent"];
//    /* -------------------------------------------------------------------------------------------------------------- */
//    
//    [manager GET:kProductsListURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
//    {
//        NSString* stringResponse = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSError *jsonError;
//        NSData *objectData = [stringResponse dataUsingEncoding:NSUTF8StringEncoding];
//        self.productArray = [NSJSONSerialization JSONObjectWithData:objectData
//                                                            options:NSJSONReadingMutableContainers
//                                                              error:&jsonError];
//        
//        NSLog(@"%@", self.productArray);
//        [self.productCollectionView reloadData];
//        
//    }
//    failure:^(AFHTTPRequestOperation *operation, NSError *error)
//    {
//        NSLog(@"Error: %@", error.localizedDescription);
//    }];
    
    // Cells config
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
//    return self.productArray.count;
    return 16;
}

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------ */

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ProductCell";
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID
                                                                                forIndexPath:indexPath];
    
    // Fill content
    [cell fillCellContent:[self.productArray objectAtIndex:indexPath.row]];
    
    // Adding border
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
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

// Cell selection
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected collection cell: %li", (long)indexPath.row);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ProductDetail"
                                                         bundle:nil];
    
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"productDetail"];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
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
