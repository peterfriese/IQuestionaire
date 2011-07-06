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

@synthesize title = _title;
@synthesize pages = _pages;

#pragma mark - Memory management

- (id)init 
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [_pages release];
    [_title release];
    [super dealloc];
    
}

#pragma mark - Page handling

- (void)setPages:(NSArray *)pages
{
    [pages retain];
    [_pages release];
    _pages = pages;
    for (Page *p in _pages) {
        p.questionaire = self;
    }
}

- (Page *)nextPage:(Page *)currentPage
{
    for (int i = 0; i < [self.pages count]; i++) {
        Page *page = [self.pages objectAtIndex:i];
        if ([page isEqual:currentPage]) {
            if (i < [self.pages count] - 1) {
                return [self.pages objectAtIndex:i+1];
            }
        }
    }
    return nil;
}

- (Page *)pageForQuestion:(Question *)currentQuestion
{
    for (Page *page in self.pages) {
        for (Question *question in page.questions) {
            if ([question isEqual:currentQuestion]) {
                return page;
            }
        }
    }
    return nil;
}

#pragma mark - Validation

- (BOOL)valid 
{
    for (Page *page in self.pages) {
        if (![page valid]) {
            return NO;
        }
    }
    return YES;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\nQuestionaire:\n\tTitle: %@\n\t", self.title, self.pages];
}

@end
