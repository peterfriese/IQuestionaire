//
//  Questionaire.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "Questionaire.h"
#import "Question.h"
#import "Page.h"

@implementation Questionaire

@synthesize title;
@synthesize pages;

- (id)init 
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL)valid 
{
    for (Page *page in pages) {
        if (![page valid]) {
            return NO;
        }
    }
    return true;
}

- (Page *)nextPage:(Page *)currentPage
{
    for (int i = 0; i < [pages count]; i++) {
        Page *page = [pages objectAtIndex:i];
        if ([page isEqual:currentPage]) {
            if (i < [pages count] - 1) {
                return [pages objectAtIndex:i+1];
            }
        }
    }
    return nil;
}

- (Page *)pageForQuestion:(Question *)currentQuestion
{
    for (Page *page in pages) {
        for (Question *question in page.questions) {
            if ([question isEqual:currentQuestion]) {
                return page;
            }
        }
    }
    return nil;
}

@end
