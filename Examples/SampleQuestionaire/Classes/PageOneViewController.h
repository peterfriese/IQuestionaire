//
//  PageOneViewController.h
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Page.h"

@interface PageOneViewController : UITableViewController

@property (nonatomic, retain) Page *page;

-(id)initWithPage:(Page *)page;

@end
