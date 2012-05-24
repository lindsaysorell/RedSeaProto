//
//  GestureMovie.m
//  RedSeaProto
//
//  Created by Lindsay Sorell on 12-05-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GestureMovie.h"


@implementation GestureMovie {
    
    /*- (id)initWithFrame:(CGRect)frame
     {
     self = [super initWithFrame:frame];
     if (self) {
     // Initialization code
     }
     return self;
     }
     
     
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     - (void)drawRect:(CGRect)rect
     {
     // Drawing code
     }
     
     @end
     */
    
    //@implementation GestureShape {
    BOOL canMove;
    C4Sample *crowdAudio;
}

-(id)init {
    self = [super init];
    if(self != nil) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    //C4Sample *crowdAudio;
    crowdAudio = [C4Sample sampleNamed:@"crowd.m4a"];
    [crowdAudio prepareToPlay];
    //[crowdAudio play];
    crowdAudio.loops = YES;
    
    
    canMove = YES;
    C4Log(@"should setup");
    //    [self addGesture:SWIPEUP name:@"swipeUpGesture" action:@"swipedUp"];
    [self addGesture:PAN name:@"panGesture" action:@"move:"];
    [self addGesture:TAP name:@"singleTapGesture" action:@"tap"];
    [self addGesture:LONGPRESS name:@"longPressGesture" action:@"longPress"];
}

//-(void)swipedUp {
//    C4Log(@"swiped Up");
//}

+(GestureMovie *)movieNamed:(NSString *)movieName {
    GestureMovie *m = [[GestureMovie alloc] initWithMovieName:movieName];
    [m setup];
    return m;
}


-(void)move:(id)sender {
    
    crowdAudio.volume = 1.0;
    [crowdAudio play];
    
    if(canMove) {
        
        self.opaque = YES;
        self.animationDuration = 0.0f;
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
        CGPoint panPoint = [pan translationInView:self];
        
        if(panPoint.y < 1000) {
            canMove = NO;
            self.center = CGPointMake(self.center.x, self.center.y+panPoint.y);
            [pan setTranslation:CGPointZero inView:self];
        }
        //else {
        //canMove = YES;
        //crowdAudio.enableRate = 20.0f;
        //self.animationDuration = 3.0f;
        //self.center = CGPointMake(300, 900);
        //}
        //        
        //        if(panPoint.y < 1) {
        //            canMove = YES;
        //        }
        //        else {
        //            ; //do nothing
        //        }
        //        if(panPoint.x > 5) {
        //            canMove = NO;
        //        }
        
    }
}
-(void)tap {
    C4Log(@"single tap");
    self.alpha = 0.3;
    self.animationDuration = 5.0f;
    crowdAudio.volume = 0.2;
}


-(void)longPress {
    C4Log(@"long press");
    canMove = YES;
    
    crowdAudio.volume = 0;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    C4Log(@"began");
    canMove = YES;
    self.alpha = 0.9;
    self.loops = YES;
    
    //C4Sample *crowdAudio;
    //crowdAudio = [C4Sample sampleNamed:@"crowd.m4a"];
    //[crowdAudio prepareToPlay];
    //[crowdAudio play];
    //crowdAudio.loops = YES;
}

-(void)touchesEnded {
    //canMove = YES;
    C4Log(@"ended");
    //self.loops = NO;
    
    crowdAudio.volume = 0;
    
    //self.alpha = 0.0;
    //self.animationDuration = 1.0f;
    //self.center = CGPointMake(280, 900);
}


@end