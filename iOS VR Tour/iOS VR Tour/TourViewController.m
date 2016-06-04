//
//  ViewController.m
//  iOS VR Tour
//
//  Created by Graham Lea on 3/06/2016.
//  Copyright © 2016 Belmont Technology Pty Ltd. All rights reserved.
//

#import "TourViewController.h"
#import "MediaControl.h"

@interface TourViewController ()<GVRWidgetViewDelegate>
@end

@implementation TourViewController {
    MediaControl *mediaControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.panoramaView.delegate = self;
    self.panoramaView.enableFullscreenButton = YES;
    self.panoramaView.enableCardboardButton = YES;
    
    mediaControl = [[MediaControl alloc] init];
    mediaControl.delegate = self;
    
    [mediaControl nextScene];
}

-(void)loadImage:(NSString *)imagePath {
    NSLog(@"Loading %@", imagePath);
    [self.panoramaView loadImage:[UIImage imageNamed:imagePath] ofType:kGVRPanoramaImageTypeMono];
}

-(void)viewWillAppear:(BOOL)animated {
    self.parentView.alpha = 0;
    self.panoramaView.alpha = 0;
}

- (void)widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content {
// Unfortunately the fade-in fade-out behaviour doesn't work particularly well at the moment.
// In normal mode, GVRPanoramaView seems to play with its superview's alpha so the fade in doesn't work.
// In Fullscreen and Cardboard modes, the ViewController has no control over the alpha at all.
    
    NSLog(@"Image loaded. Fading in. self.parentView.alpha = %f", self.parentView.alpha);
    [UIView animateWithDuration:10.0 animations:^{
        self.parentView.alpha = 1;
        self.panoramaView.alpha = 1;
    } completion:^(BOOL finished) {
        NSLog(@"Completed fade in.");
        [mediaControl imageLoaded];
    }];
}

- (void)widgetView:(GVRWidgetView *)widgetView didFailToLoadContent:(id)content withErrorMessage:(NSString *)errorMessage {
    NSLog(@"FAILED to load image: %@", errorMessage);
}

-(void)widgetViewDidTap:(GVRWidgetView *)widgetView {
    NSLog(@"Tap. Fading out.");
    [UIView animateWithDuration:1 animations:^{
        self.parentView.alpha = 0;
        self.panoramaView.alpha = 0;
    } completion:^(BOOL finished) {
        [mediaControl nextScene];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)back:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
