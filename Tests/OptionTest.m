//
//  OptionTest.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 itemis. All rights reserved.
//

#import "OptionTest.h"
#import "Option.h"

@implementation OptionTest

- (void)testSimpleOption {
    Option *option = [[Option alloc] init];
    [option setKey:@"fortytwo"];
    [option setData:@"just a string this time"];
    [option setChecked:NO];
    
    STAssertEquals(@"fortytwo", [option key], @"Key should be fortytwo");
}


@end
