//
//  Questionaire.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "Questionaire.h"
#import "Page.h"

@implementation Questionaire

@synthesize title;
@synthesize pages;

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL)valid {
    for (Page *page in pages) {
        if (![page valid]) {
            return NO;
        }
    }
    return true;
}

@end
