//
//  CollegeLocalStore.h
//  Project
//
//  Created by Siddharth Kucheria on 8/11/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface CollegeLocalStore : NSObject

@property (nonatomic, retain) NSString *someProperty;

@property NSInteger currentIndex;

+ (Global *)sharedManager;




@end