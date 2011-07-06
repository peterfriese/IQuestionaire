//
//  SampleQuestionaireAppDelegate.h
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewController.h"
#import "QuestionaireController.h"

@interface SampleQuestionaireAppDelegate : NSObject <UIApplicationDelegate, QuestionaireControllerDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) PageViewController *pageOne;
@property (nonatomic, retain) QuestionaireController *questionaireController;

@end

