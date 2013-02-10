//
//  NodeTable.h
//  AirHockeyApp
//
//  Created by Sam DesRochers on 2013-01-16.
//
//

#import "Node.h"
#import "Border3D.h"

@interface NodeTable : Node

- (id) init;
- (void) render;

// Table's specific methods
- (void) addEdgesToTree;


@end
