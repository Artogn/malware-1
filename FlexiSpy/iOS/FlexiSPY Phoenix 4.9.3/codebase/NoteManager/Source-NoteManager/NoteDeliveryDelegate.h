//
//  NoteDeliveryDelegate.h
//  NoteManager
//
//  Created by Ophat on 1/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


@protocol NoteDeliveryDelegate <NSObject>

-(void)noteDidDelivered:(NSError *)aError;

@end
