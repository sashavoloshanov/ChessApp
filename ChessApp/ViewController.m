//
//  ViewController.m
//  ChessApp
//
//  Created by Voloshanov Sasha on 11/18/15.
//  Copyright © 2015 Sasha Voloshanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *cellsArray;
@property (assign, nonatomic) NSInteger viewWidth;
@property (strong, nonatomic) UIView *staticChess;
@property (strong, nonatomic) UIView *currentChess;

@end

@implementation ViewController

int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat viewWidth = self.view.frame.size.width / 8;
    _viewWidth = viewWidth;
    
    self.cellsArray = [NSMutableArray array];
    
    for (int indexX = 0; indexX < 8; indexX++) {
        for (int indexY = 1; indexY <= 8; indexY++) {
            
            if (indexY % 2 == 0) {
                if (indexX % 2 == 0) {
                    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(indexX * viewWidth,
                                                                                indexY * viewWidth,
                                                                                viewWidth, viewWidth)];
                    cellView.backgroundColor = [UIColor blackColor];
                    [self.view addSubview:cellView];
                    [self.cellsArray addObject:cellView];
                    
                }
            } else {
                if (indexX % 2 != 0) {
                    UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(indexX * viewWidth,
                                                                                indexY * viewWidth,
                                                                                viewWidth, viewWidth)];
                    cellView.backgroundColor = [UIColor blackColor];
                    [self.view addSubview:cellView];
                    [self.cellsArray addObject:cellView];
                    
                }
            }
            
            }
        }
    
    self.staticChess = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - _viewWidth / 2,
                                                             CGRectGetHeight(self.view.frame) - _viewWidth,
                                                             _viewWidth - 20,
                                                             _viewWidth - 20)];
    self.staticChess.layer.cornerRadius = CGRectGetWidth(self.staticChess.frame) / 2;
    self.staticChess.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.staticChess];
}

- (void)setChessToCell {
    self.currentChess = [[UIView alloc] initWithFrame:self.staticChess.frame];
    self.currentChess.layer.cornerRadius = CGRectGetWidth(self.currentChess.frame) / 2;
    count++;
    [self.view addSubview:self.currentChess];
}


#pragma mark - Touch Handling

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self.view];
        
        [self setChessToCell];
        
        for (UIView *tappedCell in self.cellsArray) {
            
            if (CGRectContainsPoint(tappedCell.frame, location)) {
                
                [UIView animateWithDuration:1.0 animations:^{
                    self.currentChess.center = tappedCell.center;
                }];
                
                }
            }
        }
//                if (count % 2 != 0) {
//                    self.currentChess.backgroundColor = self.staticChess.backgroundColor = [UIColor blueColor];
//                    
//                } else {
//                    self.currentChess.backgroundColor = self.staticChess.backgroundColor = [UIColor greenColor];
//                }
}


@end
