//
//  Global.h
//  NeatBeans
//
//  Created by Apple on 18/06/16.
//  Copyright © 2016 Techgeeks. All rights reserved.
//
// gradient color code #1864ab  #1c2e8d  #680279

/* R: 24 G: 100 B: 171
 
 R: 28 G: 46 B: 141
 
 R: 104 G: 2 B: 121 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Config.h"
#import <SystemConfiguration/SystemConfiguration.h>


@interface Global : NSObject
{

}

@property(nonatomic, readwrite) BOOL isLogin;

@property(nonatomic, assign) NSString *email;
@property(nonatomic, assign) NSString *userid;
@property(nonatomic, assign) NSString *image;
@property(nonatomic, assign) NSString *name;
@property(nonatomic, assign) NSString *username;
@property(nonatomic, assign) NSString *roll_id;
@property(nonatomic, assign) NSString *roll_name;

+(void)setBlurEffectView:(UIView *)view;
+(void)logoutFB;
+(BOOL) validateEmail:(NSString*) emailString;
+ (Global *)sharedInstance;
+ (NSString *)addingTimeToCurrentDate;
+(void)CheckPayment_API ;
+(void)compareDate;
+ (NSNumber *)convertTimeInSeconds:(NSString *)string;
+ (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 color3Red:(float)colorR3 color3Green:(float)colorG3 color1Blue:(float)colorB3 alpha:(float)alpha;
+(void)setSmallShadowEffect:(UIView *)view shadowColor:(UIColor *)color;
+(void)setCornerRadiousForView:(UIView *)view;
+(void)setCornerRadiousForAllCorner:(UIView *)view;
+(void)setShadowEffect:(UIView *)view BackgroundColor:(UIColor *)color radius:(CGFloat)rad;
+(void)setShadowEffectwithOpacity:(UIView *)view BackgroundColor:(UIColor *)color radius:(CGFloat)rad opacity:(CGFloat)opacity;
+(void)onlyShadowEffect:(UIView *)view BackgroundColor:(UIColor *)color radius:(CGFloat)rad;
+(void)setTextField:(UITextField *)txt;
+(void)setSignInButton:(UIButton *)btn;
+(void)setCornerRadious:(UIButton*)btn;
+(void)setBtnWithoutBG:(UIButton *)btn;
+(void)setBluebackground:(UIView *)view;
+(void)changeImgviewColor:(UIImageView *)imgView;
+(void)setMapBox:(UIView *)view;
+(void)setTextView:(UITextView *)txtView;
+(UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius;
+(void)setClearBtn:(UIButton *)btn;
+(void)setWhiteBtn:(UIButton *)btn;
+(NSString *)checkNull :(NSString *)str ;
+(void)clearValues;
+(NSDate *)convertDateToString :(NSString *)dateStr;
+(UIStoryboard *)getStoryBoard;
+(void)switchColor:(UISwitch *)switchObj;
+(NSMutableAttributedString*)changeTextFont:(NSString *)str;
+(NSMutableAttributedString*)changeTextFontColor:(NSString *)str;
+(void)showMessage:(NSString*)message withTitle:(NSString *)title;
+(BOOL)validatePhone:(NSString *)phoneNumber;
+(BOOL)connected;
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
+(NSMutableAttributedString*)changeCombineTextFontColor:(NSString *)str;
+(NSMutableAttributedString*)changeCombineTextFontColorBlackGray:(NSString *)str;
+ (void)removeImage:(NSString *)filename;
+(void)saveImage :(UIImage *)img;
+(NSString *)getCurrentDate;
+(NSString *)getCurrentTime;
+(void)backtoHome;
+(void)roundView:(UIView *)view;
+ (UIButton*) buttonWithGradient:(UIButton *)btn beginColor:(UIColor*)beginColor endColor:(UIColor*)endColor;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
+(void)setShadow:(UIButton *)btn cornerRadius:(CGFloat)radius;
+(void)changeArrow :(UIImageView *)imgView;
+(BOOL) checkforNumeric:(NSString*) str;
+(void)setupCustomSwitch:(UIButton *)btnDriver :(UIButton *)btnCustomer :(UIView *)viewSwitch :(UIImageView *)driverImgView :(UIImageView *)customerImgView :(BOOL)isCustomer isSettings:(BOOL)isSettings;
+(BOOL)isDriverLogin;
+(void)setLoginType:(NSString *)strType;
+(BOOL)isCustomerToken;
+(BOOL)isDriverToken;
+(void)removeToken;
+(CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr;
+(void)rotateImageview : (UIImageView *)imgView isRight:(BOOL)isright;
+(NSString *)getCurrentDateTime;
+(void)changeTabbar:(BOOL)isDriver homeLbl:(UILabel *)lblhome acceptedLbl:(UILabel *)lblAccepted coverLbl:(UILabel *)lblCover lblSettings:(UILabel *)lblSettings;

@end
