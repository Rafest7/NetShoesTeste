//
//  ProductCollectionViewCell.m
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 10/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import "ProductCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ProductCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - Method
- (void)fillCellContent:(NSDictionary*)cellDic
{
    // Start activity indicator animation
    [self.productActIndicator startAnimating];
    
    // Filling the content
//    self.productDiscountPercentageLabel.text = @"-70%";
    self.productDiscountPercentageLabel.text = [cellDic objectForKey:@""];
    
//    self.productDescriptionLabel.text = @"Meia GONEW Running Cano Baixo";
    self.productDescriptionLabel.text = [cellDic objectForKey:@""];
    
//    self.productPriceLabel.text = @"R$ 1.500,00";
    self.productPriceLabel.text = [cellDic objectForKey:@""];
    


    NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    NSAttributedString* attributedText = [[NSAttributedString alloc] initWithString:@"R$ 900,00" // [cellDic objectForKey:@""]
                                                                         attributes:attributes];
    self.productOlderPriceLabel.attributedText = attributedText;
    
    
    // Config the image
        NSString *imgURL = [cellDic objectForKey:@""];
    
        [self.productCellThumbnail sd_setImageWithURL:[NSURL URLWithString:imgURL]
                                     placeholderImage:[UIImage imageNamed:@"placeholder"]
                                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                                // Hide the activity indicator
                                                [self.productActIndicator stopAnimating];
          
                                           }];
    
    // TEMP IMAGE (Deletar isso depois \/)
//    self.productCellThumbnail.image = [UIImage imageNamed:@"thumb_test"];
}

@end
