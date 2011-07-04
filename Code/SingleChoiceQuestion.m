//
//  SingleChoiceQuestion.m
//  IQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "SingleChoiceQuestion.h"

@implementation SingleChoiceQuestion

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL)valid {
    NSArray *checkedOptions = [[self options] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"checked == YES"]];
    return [checkedOptions count] == 1;
}

@end
