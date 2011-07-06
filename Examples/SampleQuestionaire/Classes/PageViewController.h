//
//  PageOneViewController.h
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Page.h"
#import "Question.h"
#import "Option.h"

@interface PageViewController : UITableViewController

@property (nonatomic, retain) Page *page;

- (id)initWithPage:(Page *)page;
- (Question *)questionForSection:(NSUInteger)section;
- (Question *)questionForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Option *)optionForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
