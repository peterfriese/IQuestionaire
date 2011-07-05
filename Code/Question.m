//
//  Question.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize key;
@synthesize title;
@synthesize subtitle;
@synthesize nextQuestion;
@synthesize options;

- (BOOL)valid 
{
    return YES;
}

- (NSArray *)checkedOptions
{
    return [self.options filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"checked == YES"]];
}

- (BOOL)toggleOption:(Option *)option
{
    option.checked = !option.checked;
    return option.checked;
}

@end
