//
//  ProductDetailViewController.h
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 13/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface ProductDetailViewController : UIViewController <UIScrollViewDelegate>

// UIView
@property (weak, nonatomic) IBOutlet UIView *imageContainerView;

// UIScrollView
@property (weak, nonatomic) IBOutlet UIScrollView *productImageScrollView;

// UIPageControl
@property (weak, nonatomic) IBOutlet UIPageControl *pgControl;

// UILabel
@property (weak, nonatomic) IBOutlet UILabel *productDiscountPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *productOlderPriceLabel;

// Float
@property (assign, nonatomic) float scrViewWidth;
@property (assign, nonatomic) float scrViewHeight;

// Constraint
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgContainerConstraint;


// Method
- (void)updateConstraint;

@end
