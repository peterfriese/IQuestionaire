//
//  SampleQuestionaireAppDelegate.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import "SampleQuestionaireAppDelegate.h"
#import "PageOneViewController.h"
#import "Page.h"
#import "Question.h"
#import "Option.h"

@implementation SampleQuestionaireAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    Page *page1 = [[Page alloc] init];
	
    Question *question1 = [[Question alloc] init];
    [question1 setKey:@"color"];
    [question1 setTitle:@"Color"];
    [question1 setSubtitle:@"Which color do you like?"];
    Option *optionRed = [[Option alloc] init];
    [optionRed setKey:@"red"];
    [optionRed setData:@"Red"];
	[optionRed setTitle:@"Red"];
    Option *optionBlue = [[Option alloc] init];
    [optionBlue setKey:@"blue"];
    [optionBlue setData:@"Blue"];
	[optionBlue setTitle:@"Blue"];
    [question1 setOptions:[NSArray arrayWithObjects:optionBlue, optionRed, nil]];
    [page1 setQuestions:[NSArray arrayWithObjects:question1, nil]];    
	
    PageOneViewController *pageOne = [[PageOneViewController alloc] initWithPage:page1];
    [self.window addSubview:pageOne.view];
    [page1 release];
	
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
