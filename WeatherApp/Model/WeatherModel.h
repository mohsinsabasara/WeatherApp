//
//  WeatherModel.h
//  WeatherApp
//
//  Created by sstech on 29/01/19.
//  Copyright © 2019 sstech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property(nonatomic,strong) NSString *humidity;
@property(nonatomic,strong) NSString *text;
@property(nonatomic,strong) NSString *strMin;
@property(nonatomic,strong) NSString *strMax;
@property(nonatomic,strong) NSString *strclouds;
@property(nonatomic,strong) NSString *strPressure;
@property(nonatomic,strong) NSString *strSpeed;

@end
