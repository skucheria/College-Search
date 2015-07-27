//
//  Global.h
//  Project
//
//  Created by Siddharth Kucheria on 7/27/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject

@property (nonatomic, retain) NSString *someProperty;

+ (Global *)sharedManager;

@end