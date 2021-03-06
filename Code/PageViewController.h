//
//  PageOneViewController.h
//  SampleQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuestionaireController;
@class Page;
@class Question;
@class IQOption;

@interface PageViewController : UITableViewController

@property (nonatomic, retain) QuestionaireController *questionaireController;
@property (nonatomic, retain) Page *page;

- (id)initWithPage:(Page *)page;
- (Question *)questionForSection:(NSUInteger)section;
- (Question *)questionForRowAtIndexPath:(NSIndexPath *)indexPath;
- (IQOption *)optionForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
