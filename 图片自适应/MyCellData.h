//
//  MyCellData.h
//  TestSinaCell
//
//  Created by ibokan on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCellData : NSObject
@property(nonatomic,retain)NSString * text;
@property(nonatomic,retain)UIImage * cellImage;
-(id)initWithText:(NSString *)theText CellImage:(UIImage *)theImage;
@end
