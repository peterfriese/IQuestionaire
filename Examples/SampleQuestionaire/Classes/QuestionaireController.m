//
//  QuestionaireController.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 7/6/11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "QuestionaireController.h"
#import "Page.h"
#import "PageOneViewController.h"

@implementation QuestionaireController

@synthesize navigationController = _navigationController;
@synthesize questionaire = _questionaire;

- (id)initWithQuestionaire:(Questionaire *)questionaire
{
    self = [super init];
    if (self) {
        self.questionaire = questionaire;
    }
    return self;
}

-(void)dealloc {
    [_navigationController release];
    [_questionaire release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    if ([self.questionaire.pages count] > 0) {
        Page *page = [self.questionaire.pages objectAtIndex:0];
        PageOneViewController *pageController = [[PageOneViewController alloc] initWithPage:page];        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:pageController];
        self.navigationController = navigationController;
        self.view = navigationController.view;
        [navigationController release];        
    }
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
