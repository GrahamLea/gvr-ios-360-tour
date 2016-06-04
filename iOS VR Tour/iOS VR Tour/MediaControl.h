//
//  MediaControl.h
//  iOS VR Tour
//
//  Created by Graham Lea on 4/06/2016.
//  Copyright © 2016 Belmont Technology Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MediaControlDelegate
-(void) loadImage:(NSString *)imagePath;
@end

@interface MediaControl : NSObject
-(void) nextScene;
-(void) imageLoaded;
@property (weak, nonatomic) id <MediaControlDelegate> delegate;
@end
