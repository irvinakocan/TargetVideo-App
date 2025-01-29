//
//  VideoTracker.h
//  TargetVideo Task
//
//  Created by Macbook Air 2017 on 29. 1. 2025..
//

#import <Foundation/Foundation.h>

@interface VideoTracker : NSObject

- (void)startTrackingWithInterval:(NSTimeInterval)interval;
- (void)pauseTracking;
- (void)stopTracking;

@end
