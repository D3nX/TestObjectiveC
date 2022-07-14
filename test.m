#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#include <stdio.h>
#include "game.h"

static int screenWidth = 0;
static int screenHeight = 0;

@implementation Game

- (void) update {
    sfVector2f position = sfRectangleShape_getPosition(self.rect);

    position.x += 2;
    position.y += 2;
    sfRectangleShape_setPosition(self.rect, position);
}

- (void) run: (int)width
         andHeight: (int)height
         andPixelsDepth: (int)pixelsDepth {
    screenWidth = width;
    screenHeight = height;
    NSString *title = @"Objective C string as a title!";
    
    sfRenderWindow *window = sfRenderWindow_create((sfVideoMode) {width, height, pixelsDepth},
                                                    [title UTF8String],
                                                    sfClose,
                                                    NULL);

    sfRenderWindow_setFramerateLimit(window, 60);

    self.rect = sfRectangleShape_create();
    sfRectangleShape_setSize(self.rect, (sfVector2f) {20, 20});

    while (sfRenderWindow_isOpen(window)) {
        sfEvent event;
        while (sfRenderWindow_pollEvent(window, &event)) {
            if (event.type == sfEvtClosed)
                sfRenderWindow_close(window);
        }
        sfRenderWindow_clear(window, sfBlack);
        [self update];
        sfRenderWindow_drawRectangleShape(window, self.rect, NULL);
        sfRenderWindow_display(window);
    }
    sfRenderWindow_destroy(window);
}

+ (int) getWidth { return screenWidth; }

+ (int) getHeight { return screenHeight; }

@end

int main(void) {
    @autoreleasepool {
        Game *game = [[Game alloc] init];

        [game run: 1280 andHeight: 720 andPixelsDepth: 32];

        NSLog(@"So, the resolution was %dx%d pixels!", [Game getWidth], [Game getHeight]);
    }
    return 0;
}
