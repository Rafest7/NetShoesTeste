//
//  ProductCollectionViewCell.m
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 10/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import "ProductCollectionViewCell.h"

@implementation ProductCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - Method
- (void)fillCellContent:(NSDictionary*)cellDic
{
    // Start activity indicator animation
    [self.productActIndicator startAnimating];
    
//    // Adjust the labels' size
//    if(screen_size_iPhone_4s || screen_size_iPhone_5_5s)
//    {
//        // Show Category
//        self.canaisShowCategoryLabel.font = [UIFont systemFontOfSize: 9.5];
//        self.canaisShowCategoryLabel.textAlignment = NSTextAlignmentLeft;
//        [self.canaisShowCategoryLabel sizeToFit];
//        
//        // Additional Info
//        self.canaisAdditionalInfoLabel.font = [UIFont systemFontOfSize: 7.5];
//        self.canaisAdditionalInfoLabel.textAlignment = NSTextAlignmentLeft;
//        [self.canaisAdditionalInfoLabel sizeToFit];
//    }
    
    // Filling the content
    self.productDiscountPercentageLabel.text = @"-70%";
    self.productDescriptionLabel.text = @"Meia GONEW Running Cano Baixo";
    self.productPriceLabel.text = @"R$ 1.500,00";


    NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    NSAttributedString* attributedText = [[NSAttributedString alloc] initWithString:@"R$ 1.800,00"
                                                                         attributes:attributes];
    self.productOlderPriceLabel.attributedText = attributedText;
    
    
    // Config the image
    //    NSString *imgURL = [cellDic objectForKey:@""];
    //
    //    [self.canaisCellThumbnail sd_setImageWithURL:[NSURL URLWithString:imgURL]
    //                                placeholderImage:[UIImage imageNamed:@"placeholder"]
    //                                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //                                           // Hide the activity indicator
    //                                           [self.canaisActIndicator stopAnimating];
    //                                       }];
    
    // TEMP IMAGE (Deletar isso depois \/)
    self.productCellThumbnail.image = [UIImage imageNamed:@"thumb_test"];
}

@end
