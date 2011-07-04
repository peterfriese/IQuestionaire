//
//  Option.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import "Option.h"

@implementation Option

@synthesize key;
@synthesize title;
@synthesize data;
@synthesize checked;

- (id)init {
    self = [super init];
    if (self) {
    }
    
    return self;
}

@end
