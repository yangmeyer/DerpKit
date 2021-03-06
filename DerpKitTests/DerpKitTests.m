//
//  DerpKitTests.m
//  DerpKitTests
//
//  Created by Steve Streza on 7/15/12.
//  Copyright (c) 2012 Mustacheware. All rights reserved.
//

#import "DerpKitTests.h"
#import "NSString+Derp.h"
#import "NSData+Derp.h"

@implementation DerpKitTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testBase64WithStart:(NSString *)start end:(NSString *)end{
	STAssertEqualObjects(end,   [start derp_stringByBase64EncodingString], @"base64 encoder is producing invalid results");
	STAssertEqualObjects(start, [end   derp_stringByBase64DecodingString], @"base64 decoder is producing invalid results");
}

- (void)testBase64
{
	[self testBase64WithStart:@"Twilight Sparkle is best pony" end:@"VHdpbGlnaHQgU3BhcmtsZSBpcyBiZXN0IHBvbnk="];
}

-(void)testUTF8{
	NSString *source = @"Twilight Sparkle is best pony";
	NSData *utf8Data = [source derp_UTF8Data];
	NSString *utf8Source = [utf8Data derp_UTF8String];

	STAssertEqualObjects(source, utf8Source, @"UTF8 generates differing data");
}

-(void)testPercentEscaping{
	NSString *original = @"https://developer.apple.com/devcenter/ios/index.action";
	NSString *encoded  = @"https%3A%2F%2Fdeveloper.apple.com%2Fdevcenter%2Fios%2Findex.action";
	
	STAssertEqualObjects([original derp_stringByEscapingPercents], encoded,  @"Percent escaping not working");
	STAssertEqualObjects(original, [encoded derp_stringByUnscapingPercents], @"Percent unescaping not working");
}

@end
