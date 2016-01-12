//
//  ProductCollectionViewCell.h
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 10/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectionViewCell : UICollectionViewCell

// Image View
@property (weak, nonatomic) IBOutlet UIImageView *productCellThumbnail;

// Labels
@property (weak, nonatomic) IBOutlet UILabel *productDiscountPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *productOlderPriceLabel;

// Activity Indicator
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *productActIndicator;


// Method
- (void)fillCellContent:(NSDictionary*)cellDic;

@end
