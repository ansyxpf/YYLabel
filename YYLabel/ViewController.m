//
//  ViewController.m
//  YYLabel
//
//  Created by WangFei on 2018/8/22.
//  Copyright © 2018年 Thtf. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __weak typeof(self) _self = self;

    // 1. 创建属性字符串。
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"可以点击的字符串可以点击的字符串可以点击的字符串可以点击的字符串可以点击的字符串可以点击的字符串"];
    
    // 2. 将属性设置为文本，可以使用几乎所有的CoreText属性。
    text.font = [UIFont boldSystemFontOfSize:30];
    text.color = [UIColor blueColor];
    [text setTextHighlightRange:text.rangeOfAll
                         color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000]
               backgroundColor:[UIColor redColor]
                     tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
                         //点击文本的操作
                         [_self showMessage:[NSString stringWithFormat:@"Tap: %@", [text.string substringWithRange:range]]];
                     }];
    
    // 3. 设置为YYLabel或YYTextView。
    YYLabel *label = [YYLabel new];
    label.attributedText = text;
//    label.width = self.view.width;
//    label.height = self.view.height - (kiOS7Later ? 64 : 44);
//    label.top = (kiOS7Later ? 64 : 0);
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    label.displaysAsynchronously = YES;   //比较耗时的渲染操作在后台运行
    label.clearContentsBeforeAsynchronouslyDisplay = NO;  //在进行后台渲染前是否清除掉之前的内容，如果YES就会先清除之前的内容，可能会出现空白
    YYTextContainer  *titleContarer = [YYTextContainer new];
    //限制宽度
    titleContarer.size = CGSizeMake(SCREEN_WIDTH,CGFLOAT_MAX);
    
//    label.textLayout = [YYTextLayout layoutWithContainer:titleContarer text:text];
//    CGFloat titleLabelHeight = label.textLayout.textBoundingSize.height;
    // YYLabel要想自动换行，必须设置最大换行的宽度
    label.preferredMaxLayoutWidth = SCREEN_WIDTH-40;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
/**
 copy自YYKit的DEMO中的方法
 */
- (void)showMessage:(NSString *)msg {
    CGFloat padding = 10;
    
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = self.view.width;
    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    
    label.bottom = (kiOS7Later ? 64 : 0);
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top = (kiOS7Later ? 64 : 0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = (kiOS7Later ? 64 : 0);
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
