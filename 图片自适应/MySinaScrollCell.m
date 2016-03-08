//
//  MySinaScrollCell.m
//  TestSinaWeibo
//
//  Created by ibokan on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MySinaScrollCell.h"

@implementation MySinaScrollCell
@synthesize headImage = _headImage,thumbnailImage = _thumbnailImage,contentText = _contentText;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //头像
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
        _headImageView.backgroundColor = [UIColor blueColor];
        [self addSubview:_headImageView];
        
        //内容
        _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.numberOfLines = 0;
        [self addSubview:_textLabel];
        
        //气泡背景
        _backgroudImageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 5, 280, 0)];
//        _backgroudImageView.frame = CGRectMake(35, 5, 280, 60);
        [self addSubview:_backgroudImageView];
        [self sendSubviewToBack:_backgroudImageView];

        
        //注册监听者
        [self addObserver:self forKeyPath:@"contentText" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"thumbnailImage" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"headImage" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}
-(void)dealloc{
    //释放监听者
    [self removeObserver:self forKeyPath:@"contentText"];
    [self removeObserver:self forKeyPath:@"thumbnailImage"];
    [self removeObserver:self forKeyPath:@"headImage"];
    
    [_headImageView release],_headImageView = nil;
    [_textLabel release],_textLabel = nil;
    [_thumbnailImageView release],_thumbnailImageView = nil;
    [_headImage release],_headImage = nil;
    [_thumbnailImage release],_thumbnailImage = nil;
    [_contentText release],_contentText = nil;
    [_backgroudImageView release],_backgroudImageView = nil;
    [super dealloc];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
//    NSLog(@"keypath = %@,++++change = %@,",keyPath,change);
    //调整文本内容高度
    if (keyPath == @"contentText") {
        _textLabel.text = _contentText;
        CGSize textLabelSize = [_textLabel.text sizeWithFont:_textLabel.font constrainedToSize:CGSizeMake(255, 10000) lineBreakMode:UILineBreakModeWordWrap];
        _textLabel.frame = CGRectMake(55, 5, textLabelSize.width, textLabelSize.height);
    }
    else if (keyPath == @"thumbnailImage") //调整拇指图片高度
    {
        if (_thumbnailImageView == nil && _thumbnailImage != nil ) {
            _thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 20, 60, 160)];
            _thumbnailImageView.backgroundColor = [UIColor blueColor];
            [self addSubview:_thumbnailImageView];            
        }
         
        float textLabelHeight = _textLabel.frame.size.height;
        _thumbnailImageView.image = _thumbnailImage;
        CGRect thumbnailImageViewframe = _thumbnailImageView.frame;
        thumbnailImageViewframe.origin.y = textLabelHeight+10;
        _thumbnailImageView.frame = thumbnailImageViewframe;
        
    } else if (keyPath == @"headImage") //调整头像高度
    {
        _headImageView.image = _headImage;
    }             
    

    //调整总体高度
    float textLabelHeight = _textLabel.frame.size.height;
    float thumbnailImageViewHeight = _thumbnailImageView.frame.size.height;
    CGRect selfFrame = self.frame;
    selfFrame.size.width = 320;
    selfFrame.size.height = textLabelHeight+thumbnailImageViewHeight+15;
    self.frame = selfFrame;
    
    //调整气泡背景和气泡高度
    _backgroudImageView.frame = CGRectMake(35, 5, 280, selfFrame.size.height);
    UIImage * tempImage = [UIImage imageNamed:@"kuang.png"];
    _backgroudImageView.image = [tempImage stretchableImageWithLeftCapWidth:40 topCapHeight:40];  
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
