//
//  ApiLink.m
//  ExploreCorps
//
//  Created by Brett Fouss on 2/14/15.
//  Copyright (c) 2015 Daniel Baigel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiLink.h"

@implementation ApiLink : NSObject

- (NSDictionary*)getJobOpenings {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://www.peacecorps.gov/api/v1/openings/"]];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSDictionary *openings;
    NSError* error = nil;
    openings = [NSJSONSerialization JSONObjectWithData:requestHandler options:NSJSONReadingMutableContainers error:&error];
    
    //NSArray *keys = openings.allKeys;
    //NSArray *values = openings.allValues;
    //NSInteger count = openings.count;
    
    //NSLog(@"%@",keys[0]);
    
    return openings;
}

- (NSDictionary*)getCountryInfo {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://www.peacecorps.gov/api/v1/geography/countries/"]];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSDictionary *countries;
    NSError* error = nil;
    countries = [NSJSONSerialization JSONObjectWithData:requestHandler options:NSJSONReadingMutableContainers error:&error];
    
    return countries;
}

- (NSDictionary*)getCountryInfo:(NSString *)country {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://www.peacecorps.gov/api/v1/geography/countries/?country=%@", country];
    [request setURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSDictionary *countryInfo;
    NSError* error = nil;
    countryInfo = [NSJSONSerialization JSONObjectWithData:requestHandler options:NSJSONReadingMutableContainers error:&error];
    
    return countryInfo;
}

- (NSDictionary*)getRegionInfo {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://www.peacecorps.gov/api/v1/geography/regions/"]];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSDictionary *region;
    NSError* error = nil;
    region = [NSJSONSerialization JSONObjectWithData:requestHandler options:NSJSONReadingMutableContainers error:&error];
    
    return region;
}

- (NSDictionary*)getRegionInfo:(NSString *)region {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://www.peacecorps.gov/api/v1/geography/regions/region=%@", region];
    [request setURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSDictionary *regionInfo;
    NSError* error = nil;
    regionInfo = [NSJSONSerialization JSONObjectWithData:requestHandler options:NSJSONReadingMutableContainers error:&error];
    
    return regionInfo;
}

@end