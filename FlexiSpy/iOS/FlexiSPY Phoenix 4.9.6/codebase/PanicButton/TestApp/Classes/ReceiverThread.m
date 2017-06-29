//
//  ReceiverThread.m
//  TestApp
//
//  Created by Makara Khloth on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ReceiverThread.h"

#import "SocketIPCReader.h"
#import "DefStd.h"

@implementation ReceiverThread

- (id) init {
	if ((self = [super init])) {
		mSocketReader = [[SocketIPCReader alloc] initWithPortNumber:kMSPanicButtonSocketPort andAddress:kLocalHostIP withSocketDelegate:self];
	}
	return (self);
}

- (void) start {
	[mSocketReader start];
}

- (void) stop {
	[mSocketReader stop];
}

- (void) dataDidReceivedFromSocket: (NSData*) aRawData {
	//NSInteger stringLength = 0;
	/*[aRawData getBytes:&stringLength length:sizeof(NSInteger)];
	NSRange range = {sizeof(NSInteger), stringLength};*/
	NSString* string = [[NSString alloc] initWithData:aRawData encoding:NSUTF8StringEncoding];
	NSLog(@"%@", string);
	
	NSString* message = [NSString stringWithFormat:@"Message receive on panic port: %@", string];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message 
													message:string 
												   delegate:nil 
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	[string release];
}

- (void) dealloc {
	[mSocketReader release];
	[super dealloc];
}

@end
