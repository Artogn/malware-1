//
//  USBDetection.h
//  USBConnectionCaptureManager
//
//  Created by ophat on 2/4/15.
//  Copyright (c) 2015 ophat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOKit/IOKitLib.h>
#import <IOKit/IOMessage.h>
#import <IOKit/IOCFPlugIn.h>
#import <IOKit/usb/IOUSBLib.h>
#import <IOKit/IOBSD.h>
#import <IOKit/IOTypes.h>
#import <IOKit/storage/IOStorage.h>

@interface USBDetection : NSObject{
    io_iterator_t			mAddedIter;
    CFRunLoopRef			mRunLoop;
    CFRunLoopSourceRef		mRunLoopSource;
    
    NSMutableArray * mDeviceName;
    NSMutableArray * mDeviceType;
    
    id  mDelegate;
    SEL mSelector;
    NSThread *mThreadA;
}

@property(nonatomic,assign)io_iterator_t			mAddedIter;
@property(nonatomic,assign)CFRunLoopRef             mRunLoop;
@property(nonatomic,assign)CFRunLoopSourceRef		mRunLoopSource;
@property (nonatomic, retain) NSMutableArray * mDeviceName;
@property (nonatomic, retain) NSMutableArray * mDeviceType;

@property (nonatomic, assign) id mDelegate;
@property (nonatomic, assign) SEL mSelector;
@property (nonatomic, readonly) NSThread *mThreadA;

-(void)startCapture;
-(void)stopCapture;



@end
