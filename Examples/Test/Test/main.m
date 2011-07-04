//
//  main.m
//  Test
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TestAppDelegate.h"

int main(int argc, char *argv[])
{
    int retVal = 0;
    @autoreleasepool {
        retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([TestAppDelegate class]));
    }
    return retVal;
}
