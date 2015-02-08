//
//  ViewController.m
//  Animation Tutorial 1
//
//  Created by PAVITRA RUPANI on 07/02/15.
//  Copyright (c) 2015 PAVITRA RUPANI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UIView *vwTranslate;
    IBOutlet UIView *vwRotate;
    IBOutlet UIView *vwScale;
    IBOutlet UIButton *btnTranslate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)translate:(UIButton*)sender{
    sender.selected=!(sender.isSelected);
    // Animation Block
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^(){
        // Translate View
        if (sender.isSelected) {
            vwTranslate.transform = CGAffineTransformTranslate(CGAffineTransformIdentity,100, 0);
        }
        else{
            vwTranslate.transform = CGAffineTransformTranslate(CGAffineTransformIdentity,-100, 0);
        }
    }
                     completion:^ (BOOL finished){
                         if (finished) {
                             // executed after animation
                         }
                     }];
}

-(IBAction)rotate:(UIButton*)sender{
    // Animation Block
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^(){
        // Rotate View
        vwRotate.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
    }
                     completion:^ (BOOL finished){
                         if (finished) {
                             // executed after animation
                             vwRotate.transform = CGAffineTransformIdentity;
                         }
                     }];
}

-(IBAction)scale:(UIButton*)sender{
    sender.selected=!sender.isSelected;
    // Animation Block
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^(){
        // Scale View
        if (sender.isSelected) {
            vwScale.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);
        }
        else{
            vwScale.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2, 1);
        }
    }
                     completion:^ (BOOL finished){
                         if (finished) {
                             // executed after animation
                         }
                     }];
}

-(IBAction)keepOnGoing:(UIButton*)sender{
    sender.selected=!sender.isSelected;
    // Animation Block
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^(){
        // Animate Views
        [self translate:btnTranslate];
        vwRotate.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
        vwScale.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);    }
                     completion:^ (BOOL finished){
                         if (finished) {
                             // executed after animation
                             vwRotate.transform = CGAffineTransformIdentity;
                             vwScale.transform = CGAffineTransformIdentity;
                             [self keepOnGoing:nil];
                         }
                     }];
}
@end
