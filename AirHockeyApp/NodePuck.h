//
//  NodePuck.h
//  AirHockeyApp
//
//  Created by Chris on 13-01-22.
//
//

#import "Node.h"
#import "OpenGLWaveFrontObject.h"

@interface NodePuck : Node

@property (nonatomic, retain) OpenGLWaveFrontObject *model;
@property (nonatomic) float coeffFriction;
@property (nonatomic) float coeffRebond;

- (id) init;
- (void) render;

@end
