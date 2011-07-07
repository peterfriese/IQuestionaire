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
@synthesize delegate;

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
    NSLog(@"%@", [self questionaire]);
    Page *nextPage = [self.questionaire pageForQuestion:[question nextQuestion]];
    PageViewController *pageController = [[PageViewController alloc] initWithPage:nextPage];
    pageController.questionaireController = self;
    [self.navigationController pushViewController:pageController animated:YES];
    [pageController release];
}

#pragma mark - Table view customization delegation

- (NSString *)cellIdentifier;
{
    if ([delegate conformsToProtocol:@protocol(QuestionaireControllerDelegate)]) {
        return [delegate questionaire:self cellIdentifierForTableView:nil];
    }
    return nil;
}

- (UITableViewCell *)createCell
{
    if ([delegate conformsToProtocol:@protocol(QuestionaireControllerDelegate)]) {
        return [delegate questionaire:self createCellForTableView:nil];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView customizeCell:(UITableViewCell *)cell withOption:(IQOption *)option forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([delegate conformsToProtocol:@protocol(QuestionaireControllerDelegate)]) {
        [delegate questionaire:self tableView:tableView customizeCell:cell withOption:option forRowAtIndexPath:indexPath];
    }
}

@end
