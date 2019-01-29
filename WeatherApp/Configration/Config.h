//
//  Config.h
//
//
//  Created by Apple on 18/06/16.
//  Copyright © 2016 . All rights reserved.

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Global.h"
#import "WeekWeatherVC.h"
#import "TableViewCell.h"
#import "WeatherModel.h"
#import "SwipeView.h"
#import "ProgressHUD.h"

#define GOOGLE_API_CLIENT @"AIzaSyAOi43iiXwBZdFsdyTNWtOGZiKBOdFuyjI"


#define API_KEY @"Apikey"
#define api_key @"apiKey"

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.5]

#define GREEN_START @"#00a662"
#define GREEN_END @"#02c281"


#define BACKGROUND_COLOR [UIColor colorWithRed:255.0f/255.0f green:250.0f/255.0f blue:210.0f/255.0f alpha:1.0f];

#define BLUE_COLOR [UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f];

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)

#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)

#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define PleaseWait @"Loading..."

#define kStartTag   @"--%@\r\n"
#define kEndTag     @"\r\n"
#define kContent    @"Content-Disposition: form-data; name=\"%@\"\r\n\r\n"
#define kBoundary   @"---------------------------14737809831466499882746641449"



