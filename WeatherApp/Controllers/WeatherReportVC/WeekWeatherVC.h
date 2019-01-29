//
//  WeekWeatherVC.h
//  WeatherApp
//
//  Created by sstech on 29/01/19.
//  Copyright © 2019 sstech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"
#import "SwipeView.h"

@interface WeekWeatherVC : UIViewController<SwipeViewDataSource,SwipeViewDelegate>
{
    IBOutlet UITableView *tblweekDetails;
}

@property (weak, nonatomic) IBOutlet SwipeView *swipeview;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property (weak, nonatomic) IBOutlet UILabel *viewcityname;
@property (weak, nonatomic) IBOutlet UILabel *viewcountry;
@property (weak, nonatomic) IBOutlet UILabel *viewgeo;
@property (weak, nonatomic) IBOutlet UITextView *aboutapp;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UILabel *citynamelabel;
@property (weak, nonatomic) IBOutlet UIView *cityview;

- (IBAction)removecity:(id)sender;
- (IBAction)currentlocation:(id)sender;


@end
