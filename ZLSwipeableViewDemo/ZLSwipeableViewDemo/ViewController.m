//
//  ViewController.m
//  ZLSwipeableViewDemo
//
//  Created by Zhixuan Lai on 11/1/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

#import "ViewController.h"
#import "ZLSwipeableView.h"
#import "UIColor+FlatColors.h"
#import "CardView.h"
#import "job.h"
#import "StoreMatches.h"
#import "ApiLink.h"

@interface ViewController () <ZLSwipeableViewDataSource,
                              ZLSwipeableViewDelegate, UIActionSheetDelegate>

@property (nonatomic, weak) IBOutlet ZLSwipeableView *swipeableView;

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger colorIndex;

@property (nonatomic) BOOL loadCardFromXib;
@end

@implementation ViewController {
    UIButton *right;
    UIButton *left;
    NSString *theJob;
    NSString *country;
    NSInteger winner;
    NSDictionary *openings;
    StoreMatches *methods;
    UILabel *countryLabel;
    UILabel *exploreCorps;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.colorIndex = 0;
    self.colors = @[
        @"Turquoise",
        @"Green Sea",
        @"Emerald",
        @"Nephritis",
        @"Peter River",
        @"Belize Hole",
        @"Amethyst",
        @"Wisteria",
        @"Wet Asphalt",
        @"Midnight Blue",
        @"Sun Flower",
        @"Orange",
        @"Carrot",
        @"Pumpkin",
        @"Alizarin",
        @"Pomegranate",
        @"Clouds",
        @"Silver",
        @"Concrete",
        @"Asbestos"
    ];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.016 green:0.309 blue: .427 alpha:1];
    
   
    
    [self setupButtons];

    // Optional Delegate
    self.swipeableView.delegate = self;
    self.swipeableView.backgroundColor = [UIColor clearColor];
}

- (void)viewDidLayoutSubviews {
    // Required Data Source
    self.swipeableView.dataSource = self;
}

-(void)setupButtons {
    right = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 145, self.view.frame.size.height - 145, 84, 84)];
    //cancelSettings.backgroundColor = [UIColor clearColor];
    [right setImage:[UIImage imageNamed:@"check_circle.png"] forState:UIControlStateNormal];
    [self.view addSubview:right];
    [right addTarget:self action:@selector(swipeRightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    left = [[UIButton alloc]initWithFrame:CGRectMake(61, self.view.frame.size.height - 145, 84, 84)];
    //cancelSettings.backgroundColor = [UIColor clearColor];
    [left setImage:[UIImage imageNamed:@"x_circle.png"] forState:UIControlStateNormal];
    [self.view addSubview:left];
    [left addTarget:self action:@selector(swipeLeftButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    countryLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 85, self.view.frame.size.width-1, self.view.frame.size.height-1)];
    countryLabel.text = @"initial country label";
    //[ZLSwipeableView addSubview:countryLabel];
    //[left addTarget:self action:@selector(swipeLeftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    exploreCorps = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 80, 25, 160, 40)];
    exploreCorps.text = @"Explore Corps";
    //exploreCorps.backgroundColor = [UIColor redColor];
    exploreCorps.textColor = [UIColor whiteColor];
    [exploreCorps setFont:[UIFont fontWithName:@"Helvetica" size:25]];
    [self.view addSubview:exploreCorps];
    //[left addTarget:self action:@selector(swipeLeftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - Action

/* USER SWIPED LEFT CODE */
- (IBAction)swipeLeftButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToLeft];
}

/* USER SWIPED RIGHT CODE */
- (IBAction)swipeRightButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToRight];
}
- (IBAction)swipeUpButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToUp];
}
- (IBAction)swipeDownButtonAction:(UIButton *)sender {
    [self.swipeableView swipeTopViewToDown];
}

- (IBAction)reloadButtonAction:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                 initWithTitle:@"Load Cards"
                      delegate:self
             cancelButtonTitle:@"Cancel"
        destructiveButtonTitle:nil
             otherButtonTitles:@"Programmatically", @"From Xib", nil];
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet
    clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.loadCardFromXib = buttonIndex == 1;

    self.colorIndex = 0;

    [self.swipeableView discardAllSwipeableViews];
    [self.swipeableView loadNextSwipeableViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
       didCancelSwipe:(UIView *)view {
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didStartSwipingView:(UIView *)view
             atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f",
          location.x, location.y, translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.colorIndex < self.colors.count) {
        CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
        view.backgroundColor = [UIColor colorWithRed:.886 green: .871 blue: .776 alpha:1];
        self.colorIndex++;

        if (self.loadCardFromXib) {
            UIView *contentView =
                [[[NSBundle mainBundle] loadNibNamed:@"CardContentView"
                                               owner:self
                                             options:nil] objectAtIndex:0];
            contentView.translatesAutoresizingMaskIntoConstraints = NO;
            [view addSubview:contentView];

            // This is important:
            // https://github.com/zhxnlai/ZLSwipeableView/issues/9
            NSDictionary *metrics = @{
                @"height" : @(view.bounds.size.height),
                @"width" : @(view.bounds.size.width)
            };
            NSDictionary *views = NSDictionaryOfVariableBindings(contentView);
            [view addConstraints:
                      [NSLayoutConstraint
                          constraintsWithVisualFormat:@"H:|[contentView(width)]"
                                              options:0
                                              metrics:metrics
                                                views:views]];
            [view addConstraints:[NSLayoutConstraint
                                     constraintsWithVisualFormat:
                                         @"V:|[contentView(height)]"
                                                         options:0
                                                         metrics:metrics
                                                           views:views]];
        } else {
            /* job title */
            UITextView *textView =
                [[UITextView alloc] initWithFrame:CGRectMake(0, 5, self.view.frame.size.width-75, self.view.frame.size.height/7)];
            /* country name */
            UITextView *textView2 =
            [[UITextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/4, self.view.frame.size.width-75, self.view.frame.size.height/8)];
            
            
            ApiLink *test = [[ApiLink alloc] init];
            NSDictionary *dict = [[NSDictionary alloc] init];
            NSArray *results = [[NSArray alloc] init];
            openings = [[NSDictionary alloc] init];
            methods = [[StoreMatches alloc] init];
            dict = test.getJobOpenings;
            results = [dict valueForKey:@"results"];
            
            //get these results
            int openingCount = (int)[results count];
            NSLog(@"%i", openingCount);
                
            openings = results[winner];
                
            Job *newJob = [methods storeOpening:openings];
                
            theJob = newJob.jobTitle;
            country = [newJob.jobCountry capitalizedString];
            
            //ApiLink *getPic = [[ApiLink alloc] init];
         //   NSDictionary *countryInfo = [getPic getCountryInfo:newJob.jobCountry];
          //  NSString *url = [countryInfo valueForKey:@"banner_image"];
            
            // hello baigil... cell.image = [UIImage imageWithData: data];
            // consider the above statemnt ... xD thankyou! cheers bro! !    !
            
            //mapImage = [[UIImage alloc]initWithData:banner];
            //add image to thing
            
         /*   UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:banner]];
            imgView.frame = CGRectOffset(imgView.frame, 100, 100);
            [self.view addSubview:imgView];
            //}*/
            
            textView.text = theJob;
            textView.backgroundColor = [UIColor clearColor];
            textView.font = [UIFont systemFontOfSize:24];
            textView.editable = NO;
            textView.selectable = NO;
            textView.textAlignment = NSTextAlignmentCenter;
            [view addSubview:textView];
            
            textView2.text = country;
            textView2.backgroundColor = [UIColor clearColor];
            textView2.font = [UIFont systemFontOfSize:24];
            textView2.editable = NO;
            textView2.selectable = NO;
            textView2.textAlignment = NSTextAlignmentCenter;
            [view addSubview:textView2];
            
        }
        winner++;
        return view;
    }
    return nil;
}

#pragma mark - ()
/*
- (UIColor *)colorForName:(NSString *)name {
    NSString *sanitizedName =
        [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString =
        [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}*/

@end
