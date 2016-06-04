//
//  MediaControl.m
//  iOS VR Tour
//
//  Created by Graham Lea on 4/06/2016.
//  Copyright © 2016 Belmont Technology Pty Ltd. All rights reserved.
//

#import "MediaControl.h"

@implementation MediaControl{
    NSArray *scenes;
    int nextSceneIndex;
    NSString* currentScene;
}

-(instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    scenes = @[
              @"Kings_Cross_Railway_Station_Concourse_360x180,_London,_UK_-_Diliff",
              @"marina-trpanj-peljesac-croatia-equirectangular-Rudolf-Getel",
              @"Testovskaya-CPPK-platform-360-Artem-Svetlov",
              @"Wroclaw-Equirectangular-HDR-Grzegorz-Rogala"
              ];
    
    nextSceneIndex = 0;
    currentScene = nil;
    
    return self;
}

-(void)nextScene {
    NSLog(@"MediaControl nextScene");
    currentScene = [scenes objectAtIndex:nextSceneIndex];
    NSLog(@"currentScene: %@", currentScene);

    NSString *imagePath = [NSString stringWithFormat:@"media/images/%@.jpg", currentScene];
    [self.delegate loadImage:imagePath];

    nextSceneIndex++;
    if (nextSceneIndex >= scenes.count) {
        nextSceneIndex = 0;
    }
}

-(void)imageLoaded {
    NSLog(@"MediaControl imageLoaded");
}

@end
