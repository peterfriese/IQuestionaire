//
//  OptionTest.m
//  IQuestionaire
//
//  Created by Peter Friese on 15.06.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "Option.h"

@interface OptionTests : SenTestCase
{
}
@end

@implementation OptionTests

- (void)testSimpleOption {
    Option *option = [[Option alloc] init];
    [option setKey:@"fortytwo"];
    [option setData:@"just a string this time"];
    [option setChecked:NO];
    
    STAssertEquals(@"fortytwo", [option key], nil);
    STAssertFalse([option checked], nil);
    STAssertEquals(@"just a string this time", [option data], nil);
}


@end
