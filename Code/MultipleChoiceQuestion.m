//
//  MultipleChoiceQuestion.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "MultipleChoiceQuestion.h"
#import "Option.h"

@implementation MultipleChoiceQuestion

@synthesize minimumSelectionCount;
@synthesize maximumSelectionCount;

- (id)init {
    self = [super init];
    if (self) {
        self.minimumSelectionCount = 0;
        self.maximumSelectionCount = UINT32_MAX;
    }
    
    return self;
}

- (BOOL) valid {
    NSUInteger numSelected = [[self checkedOptions] count];
    return (self.minimumSelectionCount <= numSelected) && (numSelected <= self.maximumSelectionCount);
}

- (BOOL)toggleOption:(Option *)option
{
    NSUInteger count = [[self checkedOptions] count];
    count += option.checked ? 1 : -1;
    if (count <= self.maximumSelectionCount) {
        return [super toggleOption:option];
    }
    // TODO: maybe better throw an exception
    return NO;
}

@end
