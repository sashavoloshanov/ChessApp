//
//  ViewController.m
//  ChessApp
//
//  Created by Voloshanov Sasha on 11/18/15.
//  Copyright © 2015 Sasha Voloshanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float viewHeight = self.view.frame.size.height / 8;
    float viewWidth = self.view.frame.size.width / 8;
    
    for (int index1 = 0; index1 < 8; index1++) {
        for (int index2 = 0; index2 < 8; index2++) {
            UIView *chessView = [[UIView alloc] initWithFrame:CGRectMake(index1 * viewWidth, index2 * viewWidth, viewHeight, viewWidth)];
            if (index2 % 2 == 0) {
                if (index1 % 2 == 0) {
                chessView.backgroundColor = [UIColor blackColor];
                } else {
                chessView.backgroundColor = [UIColor greenColor];
                }
            } else {
                if (index1 % 2 != 0) {
                    chessView.backgroundColor = [UIColor blackColor];
                } else {
                    chessView.backgroundColor = [UIColor greenColor];
                }
            }
            
            chessView.autoresizingMask = UIViewContentModeTop;
            
            [self.view addSubview:chessView];
            
        
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
