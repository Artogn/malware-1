//
//  FxIMEvent.h
//  FxEvents
//
//  Created by Makara Khloth on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FxEvent.h"

@class FxIMGeoTag;

@interface FxIMEvent : FxEvent <NSCoding, NSCopying> {
@private
	FxEventDirection	mDirection;
	NSString	*mUserID;			// Sender uid
	NSArray		*mParticipants;		// FxRecipient (first object is target if direction is in)
	NSString	*mIMServiceID;
	NSString	*mMessage;			//
	NSString	*mUserDisplayName;	// Sender display name
	NSArray		*mAttachments;		// FxAttachment
	
	// New fields...
	FxIMServiceID				mServiceID;
	FxIMMessageRepresentation	mRepresentationOfMessage;
	NSString					*mConversationID;
	NSString					*mConversationName;
	NSString					*mConversationStatusMessage;
	NSString					*mUserStatusMessage;	// Sender status message
	NSData						*mUserPicture;			// Sender picture
	NSData						*mConversationPicture;
	FxIMGeoTag					*mUserLocation;			// Sender location
	FxIMGeoTag					*mShareLocation;
	
	// Utils fields... not exist in protocol but use to ease programing level
	NSString					*mMessageIdOfIM;		// Message ID 1 got from IM application, used in Facebook to filter duplicate events
	NSString					*mOfflineThreadId;		// Message ID 2 got from IM application, used in Facebook to filter duplicate events
}

@property (nonatomic, assign) FxEventDirection mDirection;
@property (nonatomic, copy) NSString *mUserID;
@property (nonatomic, retain) NSArray *mParticipants;
@property (nonatomic, copy) NSString *mIMServiceID;
@property (nonatomic, copy) NSString *mMessage;
@property (nonatomic, copy) NSString *mUserDisplayName;
@property (nonatomic, retain) NSArray *mAttachments;

// New fields...
@property (nonatomic, assign) FxIMServiceID mServiceID;
@property (nonatomic, assign) FxIMMessageRepresentation mRepresentationOfMessage;
@property (nonatomic, copy) NSString *mConversationID;
@property (nonatomic, copy) NSString *mConversationName;
@property (nonatomic, copy) NSString *mConversationStatusMessage;
@property (nonatomic, copy) NSString *mUserStatusMessage;
@property (nonatomic, retain) NSData *mUserPicture;
@property (nonatomic, retain) NSData *mConversationPicture;
@property (nonatomic, retain) FxIMGeoTag *mUserLocation;
@property (nonatomic, retain) FxIMGeoTag *mShareLocation;

// Utils fields...
@property (nonatomic, copy) NSString *mMessageIdOfIM;
@property (nonatomic, copy) NSString *mOfflineThreadId;	

@end
