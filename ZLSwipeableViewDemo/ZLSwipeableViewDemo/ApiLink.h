//
//  ApiLink.h
//  ExploreCorps
//
//  Created by Brett Fouss on 2/14/15.
//  Copyright (c) 2015 Daniel Baigel. All rights reserved.
//

#ifndef ApiLink_h
#define ApiLink_h

@interface ApiLink : NSObject

- (NSDictionary*)getJobOpenings;
- (NSDictionary*)getCountryInfo;
- (NSDictionary*)getCountryInfo:(NSString *)country;
- (NSDictionary*)getRegionInfo;
- (NSDictionary*)getRegionInfo:(NSString *)region;

@end

#endif
