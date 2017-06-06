# blendmode
How to use kCGBlendModeSoftLight? The key is the difference between CoreGraph and UIKit.

# A piece of code

**Error**

`- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (!_isScrollTop) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(ctx, [UIColor colorWithRGBString:@"#030303" alpha:0.09].CGColor);
        CGRect  frame = CGRectMake(0, 0, self.width, self.height);
        CGContextFillRect(ctx,frame);
        UIRectFillUsingBlendMode(frame, kCGBlendModeSoftLight);
        CGContextDrawPath(ctx, kCGPathFillStroke);
    }
}`

**Correct**

`if (_isScrollTop) {

        UIColor *color = [UIColor colorWithRed:3/255 green:3/255 blue:3/255 alpha:_alpha];
        
        [color setFill];
        

        UIRectFillUsingBlendMode(rect, kCGBlendModeSoftLight);
    }`
