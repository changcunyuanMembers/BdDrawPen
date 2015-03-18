//
//  DrawPenView.m
//  BigClassRoom
//
//  Created by apple  on 13-5-6.
//
//

#import "DrawPenView.h"

@implementation DrawPenView
@synthesize image;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        pathArray=[[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

-(void)dealloc{
    
    self.image = nil;

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
   
   [self.image drawInRect:self.bounds];
   [penTool draw];
   
}
- (void)updateCacheImage:(BOOL)redraw
{
    // init a context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    
    if (redraw) {
        // erase the previous image
        self.image = nil;
        // I need to redraw all the lines
        for (DrawPenTool *pen_tool in pathArray) {
            [pen_tool draw];
        }
       
    } else {
        // set the draw point
        [self.image drawAtPoint:CGPointZero];
        [penTool draw];
    }
    
    // store the image
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // init the bezier path
    
    penTool=[[DrawPenTool alloc]init];
    penTool.lineAlpha=kDefaultLineAlpha;
    penTool.lineColor=kDefaultLineColor;
    penTool.lineWidth=kDefaultLineWidth;
    [pathArray addObject:penTool];
    
    // add the first touch
    UITouch *touch = [touches anyObject];
    [penTool setInitialPoint:[touch locationInView:self]];
    
        
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // save all the touches in the path
    UITouch *touch = [touches anyObject];
    
    // add the current point to the path
    CGPoint currentLocation = [touch locationInView:self];
    CGPoint previousLocation = [touch previousLocationInView:self];
    [penTool moveFromPoint:previousLocation toPoint:currentLocation];
    

    [self setNeedsDisplay];
    
       
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // make sure a point is recorded
    //[self touchesMoved:touches withEvent:event];
    
    // update the image
    [self updateCacheImage:NO];
    
}




@end
