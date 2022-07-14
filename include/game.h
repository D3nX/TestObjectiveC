#ifndef __GAME__
#define __GAME__

#import <Foundation/Foundation.h>
#include <SFML/Graphics.h>

@interface Game : NSObject
{
    sfRectangleShape *_rect;
}

@property sfRectangleShape *rect;

- (void) update;
- (void) run: (int)width
         andHeight: (int)height
         andPixelsDepth: (int)pixelsDepth;
+ (int) getWidth;
+ (int) getHeight;

@end

#endif