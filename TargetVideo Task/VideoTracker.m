//
//  VideoTracker.m
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 29. 1. 2025..
//

#import "VideoTracker.h"

@interface VideoTracker ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval elapsedTime;
@property (nonatomic, assign) BOOL isPlaying;

@end

@implementation VideoTracker

- (instancetype)init {
    self = [super init];
    if (self) {
        _elapsedTime = 0;
        _isPlaying = NO;
    }
    return self;
}

- (void)startTrackingWithInterval:(NSTimeInterval)interval {
    if (self.isPlaying) return;
    
    self.isPlaying = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                  target:self
                                                selector:@selector(updateTime)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)pauseTracking {
    if (!self.isPlaying) return;
    
    self.isPlaying = NO;
    [self.timer invalidate];
    self.timer = nil;
    
    NSLog(@"Video paused at %.0f seconds", self.elapsedTime);
}

- (void)stopTracking {
    self.isPlaying = NO;
    [self.timer invalidate];
    self.timer = nil;
    self.elapsedTime = 0;
}

- (void)updateTime {
    self.elapsedTime += 1;
    NSLog(@"Video playing: %.0f seconds", self.elapsedTime);
}

@end
