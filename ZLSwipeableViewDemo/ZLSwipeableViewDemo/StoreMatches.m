//
//  StoreMatches.m
//  ExploreCorps
//
//  Created by Nathan Majumder on 2/14/15.
//  Copyright (c) 2015 Daniel Baigel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreMatches.h"
#import "job.h"

@implementation StoreMatches : NSObject

- (Job *)storeOpening:(NSDictionary *)opening
{
    Job *jobListing = [[Job alloc] init];
    [jobListing setTitle:[opening valueForKey:@"country"]];
    [jobListing setLocations:[opening valueForKey:@"country"]
                  withRegion:[opening valueForKey:@"region"]
                  withSector:[opening valueForKey:@"sector"]];
    [jobListing setApplyDate:[opening valueForKey:@"apply_date"]];
    [jobListing setKnowByDate:[opening valueForKey:@"know_date"]];
    [jobListing setDepartDate:[opening valueForKey:@"depart_date"]];
    [jobListing setDescription:[opening valueForKey:@"description"]];
    [jobListing setRequiredSkills:[opening valueForKey:@"required_skills"]];
    [jobListing setDesiredSkills:[opening valueForKey:@"desired_skills"]];
    [jobListing setLanguageSkills:[opening valueForKey:@"language_skills"]];
    [jobListing setPositionsAvail:[opening valueForKey:@"volunteers_requested"]];
    [jobListing setLivingConditions:[opening valueForKey:@"living_conditions_comments"]];
    [jobListing setMedicalConsiderations:[opening valueForKey:@"country_medical_considerations"]];
    [jobListing setURL:[opening valueForKey:@"opening_url"]];
    
    return jobListing;
}

@end