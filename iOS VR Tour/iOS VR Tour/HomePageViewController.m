//
//  HomePageViewController.m
//  iOS VR Tour
//
//  Created by Graham Lea on 4/06/2016.
//  Copyright © 2016 Belmont Technology Pty Ltd. All rights reserved.
//

#import "HomePageViewController.h"
#import "TourViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TourViewController *tourViewController = (TourViewController*) segue.destinationViewController;
    NSLog(@"segue.identifier = %@", segue.identifier);
    tourViewController.showVrMode = [segue.identifier isEqualToString:@"startTourVR"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
