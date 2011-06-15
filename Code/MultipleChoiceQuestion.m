//
//  MultipleChoiceQuestion.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import "MultipleChoiceQuestion.h"
#import "Option.h"

@implementation MultipleChoiceQuestion

@synthesize minimumSelectionCount;
@synthesize maximumSelectionCount;

- (id)init
{
    self = [super init];
    if (self) {
        self.minimumSelectionCount = 0;
        self.maximumSelectionCount = UINT32_MAX;
    }
    
    return self;
}

- (BOOL) valid {
    NSUInteger numSelected = ([[self.options filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"checked == YES"]] count]);
    return (self.minimumSelectionCount <= numSelected) && (numSelected <= self.maximumSelectionCount);
}

@end
