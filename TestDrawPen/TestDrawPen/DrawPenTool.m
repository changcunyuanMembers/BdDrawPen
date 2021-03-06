//
//  DrawPenTool.m
//  BigClassRoom
//
//  Created by apple  on 13-5-6.
//
//

#import "DrawPenTool.h"

@implementation DrawPenTool
@synthesize lineColor = _lineColor;
@synthesize lineAlpha = _lineAlpha;

-(CGPoint)midPoint:(CGPoint)p1 point2:(CGPoint)p2{
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
    
}
- (id)init
{
    self = [super init];
    if (self != nil) {
        self.lineCapStyle = kCGLineCapRound;
    }
    return self;
}

- (void)setInitialPoint:(CGPoint)firstPoint
{
    [self moveToPoint:firstPoint];
}

- (void)moveFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint
{
    [self addQuadCurveToPoint:[self midPoint:endPoint point2:startPoint] controlPoint:startPoint];
}

- (void)draw
{
    [self.lineColor setStroke];
    [self strokeWithBlendMode:kCGBlendModeCopy alpha:self.lineAlpha];
}
- (void)dealloc
{
    self.lineColor = nil;
}

@end
