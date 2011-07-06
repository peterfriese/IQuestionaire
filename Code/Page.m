//
//  Page.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "Page.h"

#import "Questionaire.h"
#import "Question.h"

@implementation Page

@synthesize title;
@synthesize questions = _questions;
@synthesize questionaire;

- (void)setQuestions:(NSArray *)questions
{
    [questions retain];
    [_questions release];
    _questions = questions;
    for (Question *q in _questions) {
        q.page = self;
    }
}

#pragma mark - Navigation

- (Question *)nextQuestion:(Question *)question
{
    NSUInteger index = [self.questions indexOfObject:question];
    if (index < ([self.questions count] - 1))
    {
        return [self.questions objectAtIndex:index + 1];
    }
    else {
        Page *page = [self nextPage];
        if ( (page != nil) && ([page.questions count] > 0) ){
            return [page.questions objectAtIndex:0];
        }
    }
    return nil;
}

- (Page *)nextPage
{
    return [questionaire nextPage:self];
}

#pragma mark - Validation

- (BOOL)valid
{
    NSArray *inValidQuestions = [self.questions filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"valid == NO"]];
    return ([inValidQuestions count] == 0);
}

@end
