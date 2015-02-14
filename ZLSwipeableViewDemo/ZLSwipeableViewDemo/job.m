//
//  job.m
//  ExploreCorps
//      implementation of the job class
//
//
//  Created by Nathan Majumder on 2/14/15.
//  Copyright (c) 2015 Daniel Baigel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "job.h"

@implementation Job : NSObject

- (void)setTitle:(NSString *)title
{
    _jobTitle = title;
}

- (void)setLocations:(NSString *)country withRegion:(NSString *)region withSector:(NSString *)sector
{
    _jobCountry = country;
    _jobLocation = [NSString stringWithFormat: @"%@, %@, %@", sector, region, country];
}

- (void)setApplyDate:(NSString *)applyDate
{
    _jobApplyDate = applyDate;
}

- (void)setKnowByDate:(NSString *)knowByDate
{
    _jobKnowByDate = knowByDate;
}

- (void)setDepartDate:(NSString *)departDate
{
    _jobDepartDate = departDate;
}

- (void)setDescription:(NSString *)description
{
    _jobDescription = description;
}

- (void)setRequiredSkills:(NSString *)requiredSkills
{
    _jobRequiredSkills = requiredSkills;
}

- (void)setDesiredSkills:(NSString *)desiredSkills
{
    _jobDesiredSkills = desiredSkills;
}

- (void)setLanguageSkills:(NSString *)languageSkills
{
    _jobLanguageSkills = languageSkills;
}

- (void)setPositionsAvail:(NSString *)positionsAvail
{
    _jobPositionsAvail = positionsAvail;
}

- (void)setAcceptsCouples:(BOOL)acceptsCouples
{
    _jobAcceptsCouples = acceptsCouples;
}

- (void)setLivingConditions:(NSString *)livingConditions
{
    _jobLivingConditions = livingConditions;
}

- (void)setMedicalConsiderations:(NSString *)medicalConsiderations
{
    _jobMedicalConsiderations = medicalConsiderations;
}

- (void)setURL:(NSString *)URL
{
    _jobURL = URL;
}


@end