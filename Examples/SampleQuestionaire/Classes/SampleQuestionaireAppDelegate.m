//
//  SampleQuestionaireAppDelegate.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "SampleQuestionaireAppDelegate.h"
#import "PageViewController.h"
#import "QuestionaireController.h"

#import "Questionaire.h"
#import "Page.h"
#import "Question.h"
#import "SingleChoiceQuestion.h"
#import "MultipleChoiceQuestion.h"
#import "DrillDownQuestion.h"
#import "Option.h"

@implementation SampleQuestionaireAppDelegate

@synthesize window;
@synthesize pageOne;
@synthesize questionaireController = _questionaireController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    DrillDownQuestion *carType = [[DrillDownQuestion alloc] init];
    carType.key = @"carType";
    carType.title = @"Car type";
    carType.subtitle = @"Please choose the type of car you like.";
    
    Option *optionConvertible = [[Option alloc] init];
    optionConvertible.title = @"Convertible";
    optionConvertible.key = @"convertible";
    Option *optionSedan = [[Option alloc] init];
    optionSedan.title = @"Sedan";
    optionSedan.key = @"sedan";
    Option *optionMinivan = [[Option alloc] init];
    optionMinivan.title = @"Minivan";
    optionMinivan.key = @"minivan";
    carType.options = [NSArray arrayWithObjects:optionSedan, optionMinivan, optionConvertible, nil];
    [optionSedan release];
    [optionMinivan release];
    [optionConvertible release];

    Page *page1 = [[Page alloc] init];
    page1.title = @"Choose the type of car";
    page1.questions = [NSArray arrayWithObjects:carType, nil];
    
    Page *page2 = [[Page alloc] init];
    page2.title = @"Configure a car";
	
    SingleChoiceQuestion *question1 = [[SingleChoiceQuestion alloc] init];
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
    Option *optionGreen = [[Option alloc] init];
    [optionGreen setKey:@"green"];
    [optionGreen setData:@"Green"];
	[optionGreen setTitle:@"Green"];
    Option *optionMagenta = [[Option alloc] init];
    [optionMagenta setKey:@"magenta"];
    [optionMagenta setData:@"Magenta"];
	[optionMagenta setTitle:@"Magenta"];
    Option *optionFuchsia = [[Option alloc] init];
    [optionFuchsia setKey:@"fuchsia"];
    [optionFuchsia setData:@"Fuchsia"];
	[optionFuchsia setTitle:@"Fuchsia"];
    Option *optionGray = [[Option alloc] init];
    [optionGray setKey:@"gray"];
    [optionGray setData:@"Gray"];
	[optionGray setTitle:@"Gray"];
    Option *optionBlack = [[Option alloc] init];
    [optionBlack setKey:@"black"];
    [optionBlack setData:@"Black"];
	[optionBlack setTitle:@"Black"];
    
    [question1 setOptions:[NSArray arrayWithObjects:optionBlue, optionRed, optionGreen, optionMagenta, optionFuchsia, optionGray, optionBlack, nil]];
    
    SingleChoiceQuestion *question2 = [[SingleChoiceQuestion alloc] init];
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
    
    [page2 setQuestions:[NSArray arrayWithObjects:question1, question2, question3, nil]];
    
    Questionaire *questionaire = [[Questionaire alloc] init];
    [questionaire setPages:[NSArray arrayWithObjects:page1, page2, nil]];

	/*
    PageOneViewController *page = [[PageOneViewController alloc] initWithPage:page1];
    [self.window addSubview:page.view];
    [self setPageOne:page];
    [page release];
     */
    
    QuestionaireController *questionaireController = [[QuestionaireController alloc] initWithQuestionaire:questionaire];
    questionaireController.delegate = self;
    [self.window addSubview:questionaireController.view];
    [self setQuestionaireController:questionaireController];
    [questionaireController release];

    [optionCupholder release];
    [optionBoardComputer release];
    [optionAutomaticAirCondition release];
    [optionNoAirCondition release];
    [question3 release];
    [question2 release];
    [question1 release];
    [optionRed release];
    [optionBlue release];
    [page2 release];
    [page1 release];
	
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [_questionaireController release];
    [window release];
    [super dealloc];
}

- (NSString *)cellIdentifier
{
    return @"SampleQuestionaireCell";
}

- (UITableViewCell *)createCell
{
    return [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentifier]] autorelease];
}

- (void)tableView:(UITableView *)tableView customizeCell:(UITableViewCell *)cell withOption:(Option *)option forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
