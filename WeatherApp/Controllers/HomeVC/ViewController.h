//
//  ViewController.h
//  WeatherApp
//
//  Created by sstech on 29/01/19.
//  Copyright © 2019 sstech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *lblHumadity;
    IBOutlet UILabel *lblWeatStatus;
    IBOutlet UILabel *lblArea;
    IBOutlet UILabel *lblLatitude;
    IBOutlet UILabel *lblLongitude;

}

-(IBAction)btnWeatherReport:(id)sender;

@end

