//
//  PageTests.m
//  IQuestionaire
//
//  Created by Peter Friese on 04.07.11.
//  Copyright 2011 Peter Friese. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "Page.h"
#import "Question.h"
#import "SingleChoiceQuestion.h"
#import "MultipleChoiceQuestion.h"
#import "Option.h"

@interface PageTests : SenTestCase
@end

@implementation PageTests

- (void)testInverseRelationshipsForQuestions {
    Page *page1 = [[Page alloc] init];    
    Question *question1 = [[Question alloc] init];
    Question *question2 = [[Question alloc] init];
    Question *question3 = [[Question alloc] init];
    
    STAssertNil([question1 page], nil);
    STAssertNil([question2 page], nil);
    STAssertNil([question3 page], nil);
    
    [page1 setQuestions:[NSArray arrayWithObjects:question1, question2, nil]];
    STAssertEqualObjects(page1, [question1 page], nil);
    STAssertEqualObjects(page1, [question2 page], nil);
    STAssertNil([question3 page], nil);    
}

- (void)testPageWithOneQuestion {
    Page *page1 = [[Page alloc] init];
    
    Question *question1 = [[Question alloc] init];
    [question1 setKey:@"color"];
    [question1 setTitle:@"Color"];
    [question1 setSubtitle:@"Which color do you like?"];
    Option *optionRed = [[Option alloc] init];
    [optionRed setKey:@"red"];
    [optionRed setData:@"Red"];
    Option *optionBlue = [[Option alloc] init];
    [optionBlue setKey:@"blue"];
    [optionBlue setData:@"Blue"];
    [question1 setOptions:[NSArray arrayWithObjects:optionBlue, optionRed, nil]];
    [page1 setQuestions:[NSArray arrayWithObjects:question1, nil]];
    
    STAssertTrue([question1 valid], nil);
    STAssertTrue([page1 valid], nil);
}

- (void)testPageWithSeveralQuestions {
    Page *page = [[Page alloc] init];
    
    SingleChoiceQuestion *q = [[SingleChoiceQuestion alloc] init];
    [q setKey:@"singlechoice"];
    [q setTitle:@"Choose either one"];
    Option *o1 = [[Option alloc] init];
    [o1 setKey:@"one"];
    [o1 setTitle:@"One"];
    Option *o2 = [[Option alloc] init];
    [o2 setKey:@"two"];
    [o2 setTitle:@"Two"];
    [q setOptions:[NSArray arrayWithObjects:o1, o2, nil]];
    
    MultipleChoiceQuestion *q2 = [[MultipleChoiceQuestion alloc] init];
    Option *o21 = [[Option alloc] init];
    [o21 setChecked:NO];
    Option *o22 = [[Option alloc] init];
    [o22 setChecked:NO];
    [q2 setOptions:[NSArray arrayWithObjects:o21, o22, nil]];
    
    //TODO: add q2!
    [page setQuestions:[NSArray arrayWithObjects:q, nil]];
    STAssertFalse([q valid], nil);
    STAssertFalse([page valid], nil);
    [o1 setChecked:YES];
    STAssertTrue([page valid], nil);
}

- (void)testGetNextQuestionOnPageWithSeveralQuestions {
    Page *page = [[Page alloc] init];
    
    SingleChoiceQuestion *q = [[SingleChoiceQuestion alloc] init];
    [q setKey:@"singlechoice"];
    [q setTitle:@"Choose either one"];
    Option *o1 = [[Option alloc] init];
    [o1 setKey:@"one"];
    [o1 setTitle:@"One"];
    Option *o2 = [[Option alloc] init];
    [o2 setKey:@"two"];
    [o2 setTitle:@"Two"];
    [q setOptions:[NSArray arrayWithObjects:o1, o2, nil]];
    
    MultipleChoiceQuestion *q2 = [[MultipleChoiceQuestion alloc] init];
    Option *o21 = [[Option alloc] init];
    [o21 setChecked:NO];
    Option *o22 = [[Option alloc] init];
    [o22 setChecked:NO];
    [q2 setOptions:[NSArray arrayWithObjects:o21, o22, nil]];
    
    [page setQuestions:[NSArray arrayWithObjects:q, q2, nil]];
    
    Question *nextQ = [page nextQuestion:q];
    STAssertEquals(q2, nextQ, nil);    
}

@end
