//
//  SingleChoiceQuestion.m
//  IQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "SingleChoiceQuestion.h"

#import "Page.h"
#import "IQOption.h"

@implementation SingleChoiceQuestion

- (BOOL)valid {
    NSArray *checkedOptions = [[self options] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"checked == YES"]];
    return [checkedOptions count] == 1;
}

- (BOOL)toggleOption:(IQOption *)option
{
    for (IQOption *o in self.options) {
        if( (o != option) && (option.checked == NO) ) {
            o.checked = option.checked;
        }
    }
    return [super toggleOption:option];
}

@end
