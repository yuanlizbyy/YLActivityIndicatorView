//
//  YLActivityIndicatorView.h
//  YLActivityIndicator
//
//  Created by Eric Yuan on 13-1-15.
//  Copyright (c) 2013年 jimu.tv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLActivityIndicatorView : UIView {
    BOOL      _isAnimating;
    NSTimer*  _timer;
    BOOL      _hidesWhenStopped;
    NSInteger _currentStep;
    NSInteger _finCount;
}

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;

@property(nonatomic) BOOL hidesWhenStopped;
@end
