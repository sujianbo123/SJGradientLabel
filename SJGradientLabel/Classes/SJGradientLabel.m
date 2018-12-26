
//
//  SJGradientLabel.m
//  ColorsLabel
//
//  Created by edz on 2018/12/26.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "SJGradientLabel.h"

@interface SJGradientLabel ()

@property (nonatomic,strong)CAGradientLayer * gradientLayer;
@end

@implementation SJGradientLabel

//初始化方法
- (instancetype)init
{
    if (self = [super init]) {
        [self addSubview:self.textLabel];
        [self.layer addSublayer:self.gradientLayer];
        self.gradientLayer.mask = self.textLabel.layer;
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(textColorChange)];
         [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

#pragma mark - 重写
- (void)sizeToFit
{
    [self.textLabel sizeToFit];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,self.textLabel.frame.size.width , self.textLabel.frame.size.height);
}

#pragma mark -布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
    self.gradientLayer.frame = self.bounds;
}

#pragma mark -懒加载

- (UILabel *)textLabel
{
    if (_textLabel  == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:20];
    }
    return _textLabel;
}

- (CAGradientLayer *)gradientLayer
{
    if (_gradientLayer == nil) {
        // 创建渐变层
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}

#pragma mark -私有方法
// 定时器触发方法
-(void)textColorChange {
    _gradientLayer.colors = @[(id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor,
                              (id)[self randomColor].CGColor];
}

// 随机颜色方法
-(UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}



@end
