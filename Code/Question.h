//
//  Question.h
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Page;
@class Option;

@interface Question : NSObject

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) Page *page;
@property (nonatomic, retain) Question *nextQuestion;
@property (nonatomic, retain) NSArray *options;

- (NSArray *)checkedOptions;
- (BOOL)valid;
- (BOOL)toggleOption:(Option *)option;

@end
