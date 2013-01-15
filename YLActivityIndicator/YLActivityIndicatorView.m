//
//  YLActivityIndicatorView.m
//  YLActivityIndicator
//
//  Created by Eric Yuan on 13-1-15.
//  Copyright (c) 2013年 jimu.tv. All rights reserved.
//

#import "YLActivityIndicatorView.h"
#import "UIColor+HexString.h"

@implementation YLActivityIndicatorView

@synthesize hidesWhenStopped = _hidesWhenStopped;

- (void)initProperty
{
    _currentStep = 0;
    _finCount = 3;
    _isAnimating = NO;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initProperty];
    }
    return self;
}

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    self = [self initWithFrame:CGRectMake(0, 0, 20, 10)];
    
    return self;
}

#pragma mark - public
- (void)startAnimating
{
    if (_isAnimating) {
        return;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:.12
                                              target:self
                                            selector:@selector(repeatAnimation)
                                            userInfo:nil
                                             repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    _isAnimating = YES;
    
    if (_hidesWhenStopped)
        self.hidden = NO;
}

- (void)stopAnimating
{
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
    
    _isAnimating = NO;
    
    if (_hidesWhenStopped)
        self.hidden = YES;
}

- (BOOL)isAnimating
{
    return _isAnimating;
}

#pragma mark - drawing
- (UIColor*)currentBorderColor:(NSInteger)index
{
    if (_currentStep == index) {
        return [UIColor colorWithRed:31.0f/255.0f
                               green:217.0f/255.0f
                                blue:242.0f/255.0f
                               alpha:1];
    } else if (_currentStep < index) {
        return [UIColor clearColor];
    } else {
        if (_currentStep - index == 1) {
            return [UIColor colorWithRed:126.0f/255.0f
                                   green:231.0f/255.0f
                                    blue:246.0f/255.0f
                                   alpha:1];
        } else {
            return [UIColor colorWithRed:224.0f/255.0f
                                   green:248.0f/255.0f
                                    blue:252.0f/255.0f
                                   alpha:1];
        }
    }
}

- (UIColor*)currentInnerColor:(NSInteger)index
{
    if (_currentStep == index) {
        return [UIColor colorWithRed:82.0f/255.0f
                               green:223.0f/255.0f
                                blue:243.0f/255.0f
                               alpha:1];
    } else if (_currentStep < index) {
        return [UIColor clearColor];
    } else {
        if (_currentStep - index == 1) {
            return [UIColor colorWithRed:199.0f/255.0f
                                   green:243.0f/255.0f
                                    blue:250.0f/255.0f
                                   alpha:1];
        } else {
            return [UIColor colorWithRed:241.0f/255.0f
                                   green:251.0f/255.0f
                                    blue:253.0f/255.0f
                                   alpha:1];
        }
    }
}

- (CGRect)currentRect:(NSInteger)index
{
    if (_currentStep == index) {
        return CGRectMake(0,
                          0,
                          self.frame.size.width/(_finCount+4),
                          self.frame.size.height);
    } else if (_currentStep < index) {
        return CGRectMake(0,
                          self.frame.size.height/5.0,
                          self.frame.size.width/(_finCount+4),
                          self.frame.size.height*3.0/5.0);
    } else {
        if (_currentStep - index == 1) {
            return CGRectMake(0,
                              self.frame.size.height/10.0,
                              self.frame.size.width/(_finCount+4),
                              self.frame.size.height*4.0/5.0);
        } else {
            return CGRectMake(0,
                              self.frame.size.height/5.0,
                              self.frame.size.width/(_finCount+4),
                              self.frame.size.height*3.0/5.0);
        }
    }
}

- (void)repeatAnimation
{
    _currentStep = ++_currentStep % 7;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    for (int i = 0; i < _finCount; i++) {
        [[self currentInnerColor:i] setFill];
        [[self currentBorderColor:i] setStroke];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGRect rect1 = [self currentRect:i];
        CGPathAddRect(path, NULL, rect1);
        
        CGContextBeginPath(context);
        CGContextAddPath(context, path);
        CGContextSetLineWidth(context, 1);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        CGContextTranslateCTM(context, self.frame.size.width/3.0, 0);
        CGPathRelease(path);
    }
}

@end
