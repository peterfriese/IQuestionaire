//
//  PageOneViewController.m
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "PageOneViewController.h"
#import "Page.h"
#import "Question.h"
#import "Option.h"

@implementation PageOneViewController

@synthesize page = _page;

-(id)initWithPage:(Page *)page {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        [self setPage:page];
    }
    return self;
}

-(void)dealloc {
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
    Question *question = [self.page.questions objectAtIndex:section];
	NSLog(@"Question: %@", [question title]);
	NSUInteger result = [question.options count];
    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    Question *question = [self.page.questions objectAtIndex:[indexPath section]];
    Option *option = [question.options objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = option.title;
    cell.accessoryType = [option checked] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Question *question = [self.page.questions objectAtIndex:[indexPath section]];
    Option *option = [question.options objectAtIndex:[indexPath row]];
    option.checked = !option.checked;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];    
    cell.accessoryType = [option checked] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

#pragma mark - View Model Handling

@end
