//
//  EventCenter.m
//  EventCenter
//
//  Created by Makara Khloth on 10/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventCenter.h"
#import "FxEvent.h"

#import "EventRepository.h"

@implementation EventCenter

- (id) initWithEventRepository: (id <EventRepository>) aEventRepository {
	if ((self = [super init])) {
		mEventRepository = aEventRepository;
		[mEventRepository retain];
	}
	return (self);
}

- (void) eventFinished: (FxEvent*) aEvent {
	[mEventRepository insert:aEvent];
}

- (void) dealloc {
	[mEventRepository release];
	[super dealloc];
}

@end
