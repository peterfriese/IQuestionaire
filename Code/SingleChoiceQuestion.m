//
//  SingleChoiceQuestion.m
//  IQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "SingleChoiceQuestion.h"

#import "Page.h"
#import "Option.h"

@implementation SingleChoiceQuestion

- (BOOL)valid {
    NSArray *checkedOptions = [[self options] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"checked == YES"]];
    return [checkedOptions count] == 1;
}

- (BOOL)toggleOption:(Option *)option
{
    for (Option *o in self.options) {
        if( (o != option) && (option.checked == NO) ) {
            o.checked = option.checked;
        }
    }
    return [super toggleOption:option];
}

@end
