# YYLabel
YYLabel文本响应点击及YYLabel换行

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
// YYLabel要想自动换行，必须设置最大换行的宽度
label.preferredMaxLayoutWidth = SCREEN_WIDTH-40;
