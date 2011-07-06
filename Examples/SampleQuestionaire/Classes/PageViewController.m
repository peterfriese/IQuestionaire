//
//  PageOneViewController.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "PageViewController.h"
#import "Page.h"
#import "Question.h"
#import "SingleChoiceQuestion.h"
#import "MultipleChoiceQuestion.h"
#import "DrillDownQuestion.h"
#import "Option.h"
#import "QuestionaireController.h"

@interface PageViewController () 
- (QuestionaireController *)questionaireController;
@end

@implementation PageViewController

@synthesize questionaireController;
@synthesize page = _page;

-(id)initWithPage:(Page *)page {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        [self setPage:page];
        [self setTitle:page.title];
    }
    return self;
}

-(void)dealloc {
    [questionaireController release];
    [_page release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSUInteger result = [self.page.questions count];
    return result;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
	Question *question = [self.page.questions objectAtIndex:section];
	return question.title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Question *question = [self questionForSection:section];
	NSUInteger result = [question.options count];
    return result;
}

- (NSString *)cellIdentifier
{
    NSString *result = [self.questionaireController cellIdentifier];
    return (result != nil) ? result : @"Cell";
}

- (UITableViewCell *)createCell
{
    return [self.questionaireController createCell];
}

- (void)tableView:(UITableView *)tableView customizeCell:(UITableViewCell *)cell withOption:(Option *)option forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.questionaireController tableView:tableView customizeCell:cell withOption:option forRowAtIndexPath:indexPath];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]];
    
    if (cell == nil)
    {
        cell = [self createCell];
        if (cell == nil) {
            
        }
    }
    
    Option *option = [self optionForRowAtIndexPath:indexPath];
    cell.textLabel.text = option.title;
    cell.accessoryType = [option checked] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    [self tableView:self.tableView customizeCell:cell withOption:option forRowAtIndexPath:indexPath];
    return cell;    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    Option *option = [self optionForRowAtIndexPath:indexPath];
    
    cell.textLabel.text = option.title;
    cell.accessoryType = [option checked] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // depending on the type of question, we need to do one of the following:
    // SingleChoiceQuestion: 
    //  Check the currently selected cell and deselect any other cell that has been selected before. 
    //  Also, change the model. Actually, it's probably best to just change the model and then derive the UI state from it :-)
    // MultipleChoiceQuestion:
    //  Check the currently selected cell and update the model accordingly.
    // DrillDownQuestion:
    //  Check the model element and navigate to the next page
    Question *question = [self questionForRowAtIndexPath:indexPath];
    Option *option = [self optionForRowAtIndexPath:indexPath];    
    if ([question isKindOfClass:[SingleChoiceQuestion class]]) {
        // ask question to change checked state of option
        [question toggleOption:option];
    }
    else if ([question isKindOfClass:[MultipleChoiceQuestion class]]) {
        // ask question of option can be checked
        // no: issue message dialog ("you may only select N options")
        // yes: ask question to check option
        [question toggleOption:option];
    }
    else if ([question isKindOfClass:[DrillDownQuestion class]]) {
        // ask question to check option
        // ask question for next question
        // ask next question for next page
        // navigate to next page
        [[self questionaireController] navigateToNextPage:question];
    }

    // check / uncheck all visible cells
    for (UITableViewCell *cell in [tableView visibleCells]) {
        NSIndexPath *path = [tableView indexPathForCell:cell];
        Option *option = [self optionForRowAtIndexPath:path];
        cell.accessoryType = [option checked] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;        
    }
}

#pragma mark - View Model Handling

- (Question *)questionForSection:(NSUInteger)section
{
    return [self.page.questions objectAtIndex:section];
}

- (Question *)questionForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.page.questions objectAtIndex:[indexPath section]];
}

- (Option *)optionForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[[self questionForRowAtIndexPath:indexPath] options] objectAtIndex:[indexPath row]];
}

@end
