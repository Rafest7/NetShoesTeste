//
//  ProductDetailViewController.m
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 13/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.productImageScrollView.delegate = self;
    self.productImageScrollView.pagingEnabled = YES;
    
    self.productDiscountPercentageLabel.layer.cornerRadius = 3;
    self.productDiscountPercentageLabel.clipsToBounds = YES;
    
    // Navigation Bar Logo
    UIImage *img = [UIImage imageNamed:@"netshoes_logo.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 125, 19)];
    [imgView setImage:img];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    
    // Fill the older price label (TEMP)
    NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
    NSAttributedString* attributedText = [[NSAttributedString alloc] initWithString:@"R$ 99.999,00"
                                                                         attributes:attributes];
    self.productOlderPriceLabel.attributedText = attributedText;
    
}

- (void)viewDidLayoutSubviews
{
    [self updateConstraint];
    
    self.scrViewWidth = self.productImageScrollView.frame.size.width;
    self.scrViewHeight = self.productImageScrollView.frame.size.height;
    
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrViewWidth, self.scrViewHeight)];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrViewWidth, 0, self.scrViewWidth, self.scrViewHeight)];
    UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrViewWidth*2, 0, self.scrViewWidth, self.scrViewHeight)];
    
    img1.image = [UIImage imageNamed:@"thumb_tenis"];
    img2.image = [UIImage imageNamed:@"thumb_tenis"];
    img3.image = [UIImage imageNamed:@"thumb_tenis"];
    
    [self.productImageScrollView addSubview:img1];
    [self.productImageScrollView addSubview:img2];
    [self.productImageScrollView addSubview:img3];
    
    self.productImageScrollView.contentSize = CGSizeMake(self.scrViewWidth*3, self.scrViewHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = floor((self.productImageScrollView.contentOffset.x - self.scrViewWidth / 2) / self.scrViewWidth) + 1;
    
    self.pgControl.currentPage = page;
}

#pragma mark - Method
- (void)updateConstraint
{
    [super updateViewConstraints];
    
    if (screen_size_iPhone_4s || screen_size_iPhone_5_5s)
    {
        self.imgContainerConstraint.constant = 318.0;
        self.imageContainerView.frame = CGRectMake(0, 0, 320.0, 318.0);
        self.productImageScrollView.frame = CGRectMake(0, 0, 320.0, 318.0);
    }
    else if (screen_size_iPhone_6)
    {
        self.imgContainerConstraint.constant = 373.0;
        self.imageContainerView.frame = CGRectMake(0, 0, 375.0, 373.0);
        self.productImageScrollView.frame = CGRectMake(0, 0, 375.0, 373.0);
    }
    else if (screen_size_iPhone_6Plus)
    {
        self.imgContainerConstraint.constant = 412.0;
        self.imageContainerView.frame = CGRectMake(0, 0, 414.0, 412.0);
        self.productImageScrollView.frame = CGRectMake(0, 0, 414.0, 412.0);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
