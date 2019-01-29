//
//  ViewController.m
//  WeatherApp
//
//  Created by sstech on 29/01/19.
//  Copyright © 2019 sstech. All rights reserved.
//

#import "ViewController.h"
#import "Config.h"
#import "Global.h"

@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *loc;
    CLLocationCoordinate2D *userloc;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeLocationManager];
    [ProgressHUD show:PleaseWait];

}

-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

-(void)initializeLocationManager{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    [locationManager startUpdatingLocation];

}

-(void)viewDidAppear:(BOOL)animated{
    [self getWeatherInfo];
}

-(IBAction)btnWeatherReport:(id)sender{
 
    WeekWeatherVC *vc = [[Global getStoryBoard] instantiateViewControllerWithIdentifier:@"WeekWeatherVC"];
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
        // The user accepted authorization
    [self getWeatherInfo];
}

- (void)getWeatherInfo{
    
    NSString *usrlat= [NSString stringWithFormat:@"%f",locationManager.location.coordinate.latitude];
    NSString *usrlon= [NSString stringWithFormat:@"%f",locationManager.location.coordinate.longitude];
    
    NSString *url=[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?lat=%@&lon=%@&cnt=1&APPID=3eb55c18170d82cdfc638191dba4ed70",usrlat,usrlon];
    //&cnt=14
    [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                               cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                           timeoutInterval:10];
        
     [request setHTTPMethod: @"GET"];
        
     NSError *requestError;
     NSURLResponse *urlResponse = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    
        if(response)
        {
            
            NSDictionary *resdic=[NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:nil];
            NSString *str=[resdic objectForKey:@"cod"] ;
            if([str isEqualToString:@"404"])
            {
                [Global showMessage:@"Location not found" withTitle:@"Error"];
            }
            else
            {
                NSDictionary *citydic=[resdic objectForKey:@"city"];
                NSDictionary *coord=[citydic objectForKey:@"coord"];
                NSDictionary *list=[resdic objectForKey:@"list"];
                NSDictionary *weatherDic=[[resdic objectForKey:@"list"] valueForKey:@"weather"];

                NSString *lat=[coord objectForKey:@"lat"];
                NSString *lon=[coord objectForKey:@"lon"];
                NSString *con=[citydic objectForKey:@"country"];
                NSString *cityname=[citydic objectForKey:@"name"];

                NSString *humidity = [[list valueForKey:@"humidity"] lastObject];
                NSString *text = [[[weatherDic valueForKey:@"description"] lastObject] lastObject];
                NSLog(@"%@",text);
                
                WeatherModel *model = [[WeatherModel alloc] init];
                model.humidity = humidity;
                model.text = text;
                model.strMin = lat;
                model.strMax = lon;
                
                lblHumadity.text = [NSString stringWithFormat:@"%@ C",humidity];
                lblWeatStatus.text = text;
                lblArea.text = [NSString stringWithFormat:@"%@ , %@ ",cityname,con];
                lblLatitude.text = [NSString stringWithFormat:@"Latitude: %@",lat];
                lblLongitude.text = [NSString stringWithFormat:@"Latitude: %@",lon];

                [ProgressHUD dismiss];

            }
        }
        else
        {
            NSLog(@"no network connectivity");
            [Global showMessage:@"No Network Connectivity" withTitle:@"Error"];
        }
    
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
    if(![CLLocationManager locationServicesEnabled])
    {
        
        [Global showMessage:@"GPS Not available" withTitle:@"Please check if loaction service is enabled otherwise please try again later"];
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
