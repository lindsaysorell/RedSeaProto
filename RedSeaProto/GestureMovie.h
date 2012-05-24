//
//  GestureMovie.h
//  RedSeaProto
//
//  Created by Lindsay Sorell on 12-05-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "C4Movie.h"

@interface GestureMovie : C4Movie

+(GestureMovie *)movieNamed:(NSString *)movieName;
-(void)tap;
-(void)longPress;
@end
