//
//  MySinaScrollCell.h
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySinaScrollCell : UIView
{
    UILabel * _textLabel;
    UIImageView * _headImageView;
    UIImageView * _thumbnailImageView;
    UIImageView * _backgroudImageView;
}
@property (nonatomic,retain)UIImage * headImage;
@property (nonatomic,retain)NSString * contentText;
@property (nonatomic,retain)UIImage * thumbnailImage;
@end
