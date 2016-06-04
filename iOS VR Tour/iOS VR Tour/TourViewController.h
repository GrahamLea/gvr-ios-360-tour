//
//  ViewController.h
//  iOS VR Tour
//
//  Created by Graham Lea on 3/06/2016.
//  Copyright © 2016 Belmont Technology Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVRPanoramaView.h"
#import "MediaControl.h"

@interface TourViewController : UIViewController <MediaControlDelegate>

@property (nonatomic) BOOL showVrMode;

@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet GVRPanoramaView *panoramaView;

- (IBAction)back:(id)sender;

@end

