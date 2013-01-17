YLActivityIndicatorView
=======================

A facebook like loading indicator.

Like this: ![loading.gif](https://github.com/yuanlizbyy/YLActivityIndicatorView/blob/master/facebook_loading.gif?raw=true)

![screenshot.png](https://raw.github.com/yuanlizbyy/YLActivityIndicatorView/master/screenshot.png)

## Example Usage

```objective-c
YLActivityIndicatorView* v1 = [[YLActivityIndicatorView alloc] init];
v1.center = CGPointMake(160, 20);
[self.view addSubview:v1];
[v1 startAnimating];

YLActivityIndicatorView* v2 = [[YLActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
v2.center = CGPointMake(160, 55);
v2.duration = .8f;
[self.view addSubview:v2];
[v2 startAnimating];

YLActivityIndicatorView* v3 = [[YLActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
v3.center = CGPointMake(160, 90);
v3.dotCount = 5;
[self.view addSubview:v3];
[v3 startAnimating];
```
## Contact

Eric Yuan
- http://github.com/yuanlizbyy
- weibo: @袁力Eric
- http://yuan.li
- yuanlizbyy@gmail.com

## License

YLActivityIndicatorView is available under the MIT license. 


