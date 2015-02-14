//
//  job.h
//  ExploreCorps
//      interface for the job class
//
//
//  Created by Nathan Majumder on 2/14/15.
//  Copyright (c) 2015 Daniel Baigel. All rights reserved.
//

#ifndef ExploreCorps_job_h
#define ExploreCorps_job_h

@interface Job: NSObject;

- (void)setTitle:(NSString *)title;
- (void)setLocations:(NSString *)country withRegion:(NSString *)region withSector:(NSString *)sector;
- (void)setApplyDate:(NSString *)applyDate;
- (void)setKnowByDate:(NSString *)knowByDate;
- (void)setDepartDate:(NSString *)departDate;
- (void)setDescription:(NSString *)description;
- (void)setRequiredSkills:(NSString *)requiredSkills;
- (void)setDesiredSkills:(NSString *)desiredSkills;
- (void)setLanguageSkills:(NSString *)languageSkills;
- (void)setPositionsAvail:(NSString *)positionsAvail;
- (void)setAcceptsCouples:(BOOL)acceptsCouples;
- (void)setLivingConditions:(NSString *)livingConditions;
- (void)setMedicalConsiderations:(NSString *)medicalConsiderations;
- (void)setURL:(NSString *)URL;

@property (nonatomic, strong)NSString* jobTitle;
@property (nonatomic, strong)NSString* jobCountry;
@property (nonatomic, strong)NSString* jobLocation;
@property (nonatomic, strong)NSString* jobApplyDate;
@property (nonatomic, strong)NSString* jobKnowByDate;
@property (nonatomic, strong)NSString* jobDepartDate;
@property (nonatomic, strong)NSString* jobDescription;
@property (nonatomic, strong)NSString* jobRequiredSkills;
@property (nonatomic, strong)NSString* jobDesiredSkills;
@property (nonatomic, strong)NSString* jobLanguageSkills;
@property (nonatomic, strong)NSString* jobPositionsAvail;
@property (nonatomic)BOOL jobAcceptsCouples;
@property (nonatomic, strong)NSString* jobLivingConditions;
@property (nonatomic, strong)NSString* jobMedicalConsiderations;
@property (nonatomic, strong)NSString* jobURL;


@end


#endif
