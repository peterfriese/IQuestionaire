//
//  Page.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "Page.h"

@implementation Page

@synthesize title;
@synthesize questions;

- (BOOL)valid 
{
    NSArray *inValidQuestions = [questions filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"valid == NO"]];
    return ([inValidQuestions count] == 0);
}

- (Question *)nextQuestion:(Question *)question
{
    NSUInteger index = [questions indexOfObject:question];
    if (index < ([questions count] - 1))
    {
        return [questions objectAtIndex:index + 1];
    }
    return nil;
}

@end
