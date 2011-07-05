//
//  Page.h
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Page : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *questions;

- (BOOL)valid;
- (Question *)nextQuestion:(Question *)question;

@end
