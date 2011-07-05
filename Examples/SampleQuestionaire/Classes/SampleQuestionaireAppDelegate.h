//
//  SampleQuestionaireAppDelegate.h
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageOneViewController.h"

@interface SampleQuestionaireAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) PageOneViewController *pageOne;

@end

