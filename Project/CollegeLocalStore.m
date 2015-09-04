//
//  CollegeLocalStore.m
//  Project
//
//  Created by Siddharth Kucheria on 8/11/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//
#import <Parse/Parse.h>
#import "CollegeLocalStore.h"

@implementation CollegeLocalStore

@end


+ (Global *)sharedManager {
    static Global *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
//        someProperty = @"Default Property Value";
//        currentIndex = 100;
    }
    
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end