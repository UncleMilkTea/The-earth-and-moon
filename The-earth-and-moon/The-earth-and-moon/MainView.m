//
//  MainView.m
//  The-earth-and-moon
//
//
//  Copyright © 2016年 suger. All rights reserved.
//

#import "MainView.h"
#import "LineColor.h"

@implementation MainView

- (void)drawRect:(CGRect)rect {

    LineColor *path = [LineColor bezierPathWithOvalInRect:rect];
    
    path.lineWidth = 4;
    
    path.lineColor = [UIColor whiteColor];
    
    [path.lineColor setStroke];
    
    [path stroke];
    
        
}
@end
