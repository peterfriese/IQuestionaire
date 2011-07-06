//
//  Questionaire.h
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Page.h"
#import "Question.h"

@interface Questionaire : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *pages;

- (BOOL)valid;
- (Page *)nextPage:(Page *)currentPage;
- (Page *)pageForQuestion:(Question *)currentQuestion;

@end
