//
//  AGTMainViewController.m
//  Xwing
//
//  Created by Fernando Rodríguez Romero on 06/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTMainViewController.h"

@interface AGTMainViewController ()
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;

@end

@implementation AGTMainViewController

- (IBAction)didPan:(id)sender {
    
    
    UIPinchGestureRecognizer *pinchGesture = (UIPinchGestureRecognizer *) sender;
    //Determinar si el gesto ya termino
    if (pinchGesture.state == UIGestureRecognizerStateEnded) {
            CGPoint randomPoint = CGPointMake(self.spaceView.frame.size.width * drand48(), self.spaceView.frame.size.height * drand48());
        
        //Creación de tipo weak de self para no mantener una referencia strong
        __weak typeof(self) me = self;
        
        
        //Animación para poner el alpha en 0
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [me.xwingView setAlpha:0.0];
        } completion:^(BOOL finished) {
            [me.xwingView setCenter:randomPoint];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                //Animación para poner el alpha en 1
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    [me.xwingView setAlpha:1.0];
                } completion:nil];
            });
        }];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    // Creamos un detector de Tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];

    
    
    // Lo añadimos
    [self.view addGestureRecognizer:tap];
    
}



-(void)didTap:(UITapGestureRecognizer *) tap{
    
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut;
    
    // Translación
    [UIView animateWithDuration:1.0
                          delay:0
                        options:options
                     animations:^{
                         // Estado final
                         self.xwingView.center = [tap locationInView:self.spaceView];
                     } completion:^(BOOL finished) {
                         // nada
                     }];
    
    
    
    // Rotación
    [UIView animateWithDuration:0.5
                          delay:0
                        options:options
                     animations:^{
                         self.xwingView.transform = CGAffineTransformMakeRotation(M_2_PI);
                         
                     } completion:^(BOOL finished) {
                         // Al terminar...
                         
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:options
                                          animations:^{
                                              self.xwingView.transform = CGAffineTransformIdentity;
                                          } completion:^(BOOL finished) {
                                              //
                                          }];
                     }];
    
    
    
}

@end






