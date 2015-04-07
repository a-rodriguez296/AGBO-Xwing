//
//  AGTMainViewController.m
//  Xwing
//
//  Created by Fernando Rodríguez Romero on 06/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTMainViewController.h"

@interface AGTMainViewController ()

@end

@implementation AGTMainViewController


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    // Creamos un detector de Tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    
    
    // Lo añadimos
    [self.view addGestureRecognizer:tap];
    
}



-(void)didTap:(UITapGestureRecognizer *) tap{
    
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:0
                     animations:^{
                         // Estado final
                         self.xwingView.center = [tap locationInView:self.spaceView];
                     } completion:^(BOOL finished) {
                         // nada
                     }];
    
    
    
    
    
    
}

@end






