//
//  NodePommeau.m
//  AirHockeyApp
//
//  Created by Chris on 13-01-22.
//
//

#import "NodePommeau.h"

@implementation NodePommeau

@synthesize model;

float lightAmbient1[] = { 0.2f, 0.3f, 0.6f, 1.0f };
float lightDiffuse1[] = { 0.2f, 0.3f, 0.6f, 1.0f };
float matAmbient1[] = { 0.6f, 0.6f, 0.6f, 1.0f };
float matDiffuse1[] = { 0.6f, 0.6f, 0.6f, 1.0f };

- (id) init
{
    if((self = [super init])) {
        self.isWaveFrontObject = YES;
        self.type = @"POMMEAU";
        self.xmlType = @"Pommeau";

        NSString *path = [[NSBundle mainBundle] pathForResource:@"pommeau" ofType:@"obj"];
        OpenGLWaveFrontObject *theObject = [[OpenGLWaveFrontObject alloc] initWithPath:path];
        Vertex3D position = Vertex3DMake(0, 0, 10.0);
        self.model = theObject;
        self.position = position;
        self.isScalable = NO;
        self.isCopyable = NO;
        self.model.currentPosition = self.position;
        [theObject release];
    }
    return self;
}

- (void) render
{
    // Update the 3D Model Position
    self.model.currentPosition = self.position;
    
    // Save the current transformation by pushing it on the stack
	glPushMatrix();
    
	// Translate to the current position
	glTranslatef(self.model.currentPosition.x, self.model.currentPosition.y, self.model.currentPosition.z);
    
    // Specific object rotation and scaling for this node
    glRotatef(90, 1.0, 0.0, 0.0);
    glScalef(2.5f, 2.5f, 2.5f);

	// Rotate to the current rotation in Z
	glRotatef(self.angle, 0.0, 0.0, 1.0);
    
    // Scale the model
    glScalef(self.scaleFactor, self.scaleFactor, self.scaleFactor);
    
    //Prepare the light
    glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, matAmbient1);
	glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, matDiffuse1);
    glLightfv(GL_LIGHT0, GL_AMBIENT, lightAmbient1);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, lightDiffuse1);
    
    // Draw the .obj Model
    [model drawSelf];
    
    glPopMatrix();
    
}

- (void) setRotation:(Rotation3D)rot
{
    self.model.currentRotation = rot;
}
- (void) dealloc
{
    [model release];
    [super dealloc];
}

@end
