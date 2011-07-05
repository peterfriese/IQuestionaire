//
//  SampleQuestionaireAppDelegate.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "SampleQuestionaireAppDelegate.h"
#import "PageOneViewController.h"
#import "Page.h"
#import "Question.h"
#import "SingleChoiceQuestion.h"
#import "MultipleChoiceQuestion.h"
#import "Option.h"

@implementation SampleQuestionaireAppDelegate

@synthesize window;
@synthesize pageOne;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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
    
    MultipleChoiceQuestion *question2 = [[MultipleChoiceQuestion alloc] init];
    [question2 setKey:@"aircondition"];
    [question2 setTitle:@"Air condition"];
    [question2 setSubtitle:@"Choose the kind of air condition"];
    Option *optionNoAirCondition = [[Option alloc] init];
    [optionNoAirCondition setKey:@"noairco"];
    [optionNoAirCondition setData:@"None"];
    [optionNoAirCondition setTitle:@"None"];
    Option *optionAutomaticAirCondition = [[Option alloc] init];
    [optionAutomaticAirCondition setKey:@"automaticairco"];
    [optionAutomaticAirCondition setTitle:@"Automatic"];
    [question2 setOptions:[NSArray arrayWithObjects:optionNoAirCondition, optionAutomaticAirCondition, nil]];
    
    MultipleChoiceQuestion *question3 = [[MultipleChoiceQuestion alloc] init];
    [question3 setKey:@"interior"];
    [question3 setTitle:@"Interior"];
    Option *optionCupholder = [[Option alloc] init];
    [optionCupholder setKey:@"cupholder"];
    [optionCupholder setData:@"Cupholder"];
    [optionCupholder setTitle:@"Cup holder"];
    Option *optionBoardComputer = [[Option alloc] init];
    [optionBoardComputer setKey:@"boardcomputer"];
    [optionBoardComputer setData:@"Board computer"];
    [optionBoardComputer setTitle:@"Board computer"];
    [question3 setOptions:[NSArray arrayWithObjects:optionCupholder, optionBoardComputer, nil]];
    
    [page1 setQuestions:[NSArray arrayWithObjects:question1, question2, question3, nil]];    
	
    PageOneViewController *page = [[PageOneViewController alloc] initWithPage:page1];
    [self.window addSubview:page.view];
    [self setPageOne:page];
    [page release];

    [optionCupholder release];
    [optionBoardComputer release];
    [optionAutomaticAirCondition release];
    [optionNoAirCondition release];
    [question3 release];
    [question2 release];
    [question1 release];
    [optionRed release];
    [optionBlue release];
    [page1 release];
	
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
