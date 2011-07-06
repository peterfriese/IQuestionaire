//
//  QuestionaireController.h
//  SampleQuestionaire
//
//  Created by Peter Friese on 7/6/11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Questionaire.h"
#import "Page.h"

@interface QuestionaireController : UIViewController

@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) Questionaire *questionaire;
@property (nonatomic, readonly) Page *currentPage;
@property (nonatomic) NSInteger currentPageIndex;

- (id)initWithQuestionaire:(Questionaire *)questionaire;

@end
