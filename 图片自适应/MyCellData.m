//
//  MyCellData.m
//  TestSinaCell
//
//  Created by ibokan on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyCellData.h"

@implementation MyCellData
@synthesize text,cellImage;
-(id)initWithText:(NSString *)theText CellImage:(UIImage *)theImage{
    if (self = [super init]) {
        text = [theText retain];
        cellImage = [theImage retain];
    }
    return self;
}
@end
