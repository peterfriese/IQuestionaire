//
//  QuestionaireController.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 7/6/11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "QuestionaireController.h"
#import "Page.h"
#import "PageViewController.h"

@implementation QuestionaireController

@synthesize navigationController = _navigationController;
@synthesize questionaire = _questionaire;
@synthesize currentPage;
@synthesize currentPageIndex;

- (id)initWithQuestionaire:(Questionaire *)questionaire
{
    self = [super init];
    if (self) {
        self.questionaire = questionaire;
        self.currentPageIndex = -1;
    }
    return self;
}

-(void)dealloc {
    [_navigationController release];
    [_questionaire release];
    [super dealloc];
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    if ([self.questionaire.pages count] > 0) {
        self.currentPageIndex = 0;
        Page *page = [self currentPage];
        PageViewController *pageController = [[PageViewController alloc] initWithPage:page];        
        pageController.questionaireController = self;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:pageController];
        [pageController release];
        self.navigationController = navigationController;
        self.view = navigationController.view;
        [navigationController release];        
    }
}

- (Page *)currentPage
{
    if ( (currentPageIndex >= 0) && (currentPageIndex < [self.questionaire.pages count]) ) {
        return [self.questionaire.pages objectAtIndex:currentPageIndex];
    }
    return nil;
}

- (void)navigateToNextPage:(Question *)question
{
    Page *nextPage = [self.questionaire pageForQuestion:[question nextQuestion]];
    PageViewController *pageController = [[PageViewController alloc] initWithPage:nextPage];
    [self.navigationController pushViewController:pageController animated:YES];
    [pageController release];
}

@end
