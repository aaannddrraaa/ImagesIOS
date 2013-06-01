//
//  ImagesSource.h
//  Images
//
//  Created by Andra Mititelu on 6/1/13.
//  Copyright (c) 2013 Andra Mititelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagesSource : NSObject

- (BOOL)hasLeft;
- (BOOL)hasRight;
- (NSString *)nextLeft;
- (NSString *)nextRight;
- (NSString *)firstSrc;
- (NSString *)currentSrc;

@end
