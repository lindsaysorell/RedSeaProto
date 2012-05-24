//
//  C4WorkSpace.m
//  RedSeaProto
//
//  Created by Lindsay Sorell on 12-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "C4WorkSpace.h"
#import "GestureMovie.h"

@implementation C4WorkSpace {
    C4Movie *background;
    C4Movie *glitchMovie;
    C4Movie *newMovie;
    NSMutableArray *movies;
    C4Sample *redAudio;
    C4Sample *crowdAudio;
}

-(void)setup {
    
    
    redAudio = [C4Sample sampleNamed:@"redsea.m4a"];
    [redAudio prepareToPlay];
    [redAudio play];
    redAudio.loops = YES;
    
    //crowdAudio = [C4Sample sampleNamed:@"crowd.m4a"];
    //[crowdAudio prepareToPlay];
    //[crowdAudio play];
    //crowdAudio.loops = YES;
    
    background = [C4Movie movieNamed:@"RedSeaBefore1080.mov"];
    background.center = CGPointMake(320, 350);
    //background.width = 2500;
    background.height = 768;
    //background.transform = CGAffineTransformMakeScale(1.5, 1.5);
    background.transform = CGAffineTransformMakeRotation(DegreesToRadians(90));
    background.loops = YES;
    [background sizeToFit];
    [self.canvas addMovie:background];
    
    glitchMovie = [GestureMovie movieNamed:@"RedSeaBeforeglitch1080.mov"];
    glitchMovie.center = CGPointMake(320, 350);
    glitchMovie.loops = YES;
    //glitchMovie.width = 2500;
    glitchMovie.height = 768;
    glitchMovie.alpha = 0.3;
    glitchMovie.transform = CGAffineTransformMakeRotation(HALF_PI);
    //glitchMovie.transform = CGAffineTransformMakeRotation(3.15);
    [self.canvas addMovie:glitchMovie];
    
    newMovie = [GestureMovie movieNamed:@"pan1080.mov"];
    newMovie.center = CGPointMake(100, 350);
    newMovie.loops = YES;
    newMovie.height = 768;
    //newMovie.transform = CGAffineTransformMakeScale(0.3, 0.3);
    newMovie.width = 2500;
    //newMovie.alpha = 0.1;
    newMovie.opaque = NO;
    newMovie.transform = CGAffineTransformMakeRotation(DegreesToRadians(90));
    //newMovie = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    //newMovie.transform = CGAffineTransformMakeRotation(3.15);
    [self.canvas addMovie:newMovie];
    
    //GestureShape *g = [GestureShape new];
    //[g ellipse:CGRectMake(284, 412, 200, 200)];
    //[self.canvas addShape:newMovie];
    
}

/*-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 
 C4Log(@"began");
 crowdAudio = [C4Sample sampleNamed:@"crowd.m4a"];
 [crowdAudio prepareToPlay];
 [crowdAudio play];
 crowdAudio.loops = YES;
 
 }*/

@end