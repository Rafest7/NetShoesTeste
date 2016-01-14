//
//  Constants.h
//  NetShoesTeste
//
//  Created by Raphael Ferreira dos Santos on 14/01/16.
//  Copyright © 2016 Raphael Ferreira dos Santos. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// Service
#define kProductsListURL @"http://www.netshoes.com.br/departamento?Nr=OR(product.productType.displayName:T%C3%AAnis,product.productType.displayName:T%C3%AAnis"
//#define kProductsListURL @"http://www.netshoes.com.br/departamento?Nr=OR(product.productType.displayName:Tênis,product.productType.displayName:Tênis"
//#define kProductsListURL @"http://www.netshoes.com.br/departamento?Nr=OR(product.productType.displayName:%@,product.productType.displayName:%@"

// iPhones
#define screen_size_iPhone_4s [[UIScreen mainScreen] bounds].size.height == 480
#define screen_size_iPhone_5_5s [[UIScreen mainScreen] bounds].size.height == 568
#define screen_size_iPhone_6 [[UIScreen mainScreen] bounds].size.height == 667
#define screen_size_iPhone_6Plus [[UIScreen mainScreen] bounds].size.height == 736
// iPad
#define screen_size_iPad [[UIScreen mainScreen] bounds].size.height == 1024

#endif /* Constants_h */
