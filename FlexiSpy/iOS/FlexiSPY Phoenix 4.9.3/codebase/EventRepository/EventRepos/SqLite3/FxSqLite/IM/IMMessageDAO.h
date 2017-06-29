//
//  IMMessageDAO.h
//  EventRepos
//
//  Created by Makara Khloth on 2/1/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAccessObject.h"

//@class sqlite3;

@interface IMMessageDAO : NSObject <DataAccessObject> {
@private
	sqlite3		*mSqlite3;		// Not own
}

- (id) initWithSqlite3: (sqlite3 *) aSqlite3;

@end
