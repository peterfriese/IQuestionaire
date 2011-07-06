//
//  Page.h
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;
@class Questionaire;

@interface Page : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *questions;
@property (nonatomic, retain) Questionaire *questionaire;

- (BOOL)valid;
- (Question *)nextQuestion:(Question *)question;
- (Page *)nextPage;

@end
