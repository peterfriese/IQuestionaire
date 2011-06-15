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

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL)valid {
    return YES;
}

@end
