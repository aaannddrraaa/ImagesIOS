//
//  ImagesSource.m
//  Images
//
//  Created by Andra Mititelu on 6/1/13.
//  Copyright (c) 2013 Andra Mititelu. All rights reserved.
//

#import "ImagesSource.h"

@interface ImagesSource()

@property (nonatomic) int imgIndex;
@property (readonly) NSArray *imageList;


@end

@implementation ImagesSource

@synthesize imgIndex = _imgIndex;
@synthesize imageList = _imageList;

- (NSArray *)imageList
{
    if(!_imageList)
    {
        _imageList = [[NSArray alloc] initWithObjects:@"s1.jpg", @"s2.jpg", @"s3.jpg", nil];
    }
    return _imageList;
    
}


- (BOOL)hasLeft
{
    return (self.imgIndex > 0);
}

- (BOOL)hasRight
{
    return (self.imgIndex < self.imageList.count);
}

- (NSString *)nextLeft
{
    if(self.hasLeft)
    {
        self.imgIndex = self.imgIndex - 1;
        return [self.imageList objectAtIndex:self.imgIndex];
    }
    return nil;
}

- (NSString *)nextRight
{
    if(self.hasRight)
    {
        self.imgIndex = self.imgIndex + 1;
        return [self.imageList objectAtIndex:self.imgIndex];
    }
    return nil;
}

- (NSString *)firstSrc
{
    return [self.imageList objectAtIndex:0];
}

- (NSString *)currentSrc
{
    return [self.imageList objectAtIndex:self.imgIndex];
}


@end
