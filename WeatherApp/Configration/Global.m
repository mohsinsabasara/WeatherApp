//
//  Global.m
//  NeatBeans
//
//  Created by Apple on 18/06/16.
//

#import "Global.h"

@implementation Global

@synthesize isLogin = _isLogin;
@synthesize email,userid,image,name,username,roll_id,roll_name;



+ (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 color3Red:(float)colorR3 color3Green:(float)colorG3 color1Blue:(float)colorB3 alpha:(float)alpha
{
 
    [mainView setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = mainView.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:colorR1/255.0 green:colorG1/255.0 blue:colorB1/255.0 alpha:alpha] CGColor],(id)[[UIColor colorWithRed:colorR2/255.0 green:colorG2/255.0 blue:colorB2/255.0 alpha:alpha] CGColor] ,(id)[[UIColor colorWithRed:colorR3/255.0 green:colorG3/255.0 blue:colorB3/255.0 alpha:alpha] CGColor], nil];

    [grad setStartPoint:CGPointMake(0.0, 0.5)];
    [grad setEndPoint:CGPointMake(1.0, 0.5)];
 
    [mainView.layer insertSublayer:grad atIndex:0];
}




+(void)setShadowEffect:(UIView *)view BackgroundColor:(UIColor *)color radius:(CGFloat)rad{
    
    view.layer.cornerRadius = 10;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(5.0,5.0); //Here your control your spread
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowRadius = rad;//60.0; //Here your control your blur

}



+(void)onlyShadowEffect:(UIView *)view BackgroundColor:(UIColor *)color radius:(CGFloat)rad{
    
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(10.0,10.0); //Here your control your spread
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowRadius = rad;//60.0; //Here your control your blur
    
}


+(NSString *)getCurrentDateTime{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    
    NSString *str = [dateFormatter stringFromDate:[NSDate date]];
    
    return  str;
}

+(void)setShadowEffectwithOpacity:(UIView *)view BackgroundColor:(UIColor *)color radius:(CGFloat)rad opacity:(CGFloat)opacity{
    
    view.layer.cornerRadius = 10;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(10.0,10.0); //Here your control your spread
    view.layer.shadowOpacity = opacity;
    view.layer.shadowRadius = rad;//60.0; //Here your control your blur
    
}


+(void)setSmallShadowEffect:(UIView *)view shadowColor:(UIColor *)color{
    view.layer.cornerRadius = 20;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(2.0,2.0); //Here your control your spread
    view.layer.shadowOpacity = 2.0;
    view.layer.shadowRadius = 5.0; //Here your control your blur
}

+(void)setCornerRadiousForView:(UIView *)view
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:( UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path  = maskPath.CGPath;
    view.layer.mask = maskLayer;

}

+(void)roundView:(UIView *)view{
    view.layer.cornerRadius = view.frame.size.height/2;
    view.layer.masksToBounds = true;
}

+(void)setCornerRadiousForAllCorner:(UIView *)view
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:( UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(30.0,30.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path  = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
}


+ (Global *)sharedInstance {
    static dispatch_once_t onceToken;
    static Global *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[Global alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
      
//        _isLogin = nil;
    }
    return self;
}


+(void)setTextField:(UITextField *)txt{

   // txt.backgroundColor = BACKGROUND_COLOR;

    txt.layer.borderWidth = 1.0;
    txt.layer.borderColor = [UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f].CGColor;
    txt.textColor = [UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
    txt.layer.masksToBounds = YES;
    [txt setValue:[UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f]
                    forKeyPath:@"_placeholderLabel.textColor"];
    
    CGRect frameRect = txt.frame;
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
        frameRect.size.height = 35;
        txt.layer.cornerRadius = 17.5 - 5;
    }
    else{
        frameRect.size.height = 40;
        txt.layer.cornerRadius = 20.0 - 5;
    }
    
    txt.frame = frameRect;
}

+(NSDate *)convertDateToString :(NSString *)dateStr{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth                                           fromDate:date];
    components.day++;
    date = [gregorianCalendar dateFromComponents:components];
    return date;
}

+(void)setWhiteBtn:(UIButton *)btn{
    [btn setBackgroundColor:[UIColor whiteColor]];
    CGRect      buttonFrame = btn.frame;
    
    btn.layer.cornerRadius = buttonFrame.size.height/2 - 5;
    btn.clipsToBounds = YES;
    [[btn layer] setBorderWidth:1.0f];
    [[btn layer] setBorderColor:[UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f].CGColor];
}

+(UIStoryboard *)getStoryBoard{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return mainStoryboard;
}

+(void)setSignInButton:(UIButton *)btn
{
    [btn setBackgroundColor:[UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 
    CGRect      buttonFrame = btn.frame;
   
    btn.layer.cornerRadius = buttonFrame.size.height/2 - 5;
    btn.clipsToBounds = YES;
}

+(void)setClearBtn:(UIButton *)btn{
    btn.backgroundColor = [UIColor clearColor];
    btn.layer.borderWidth = 0;
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];

}

+(void)rotateImageview : (UIImageView *)imgView isRight:(BOOL)isright{
    if (isright) {
        imgView.transform = CGAffineTransformMakeRotation(0);
    }else{
        imgView.transform = CGAffineTransformMakeRotation(110);
    }
}

+(void)setupCustomSwitch:(UIButton *)btnDriver :(UIButton *)btnCustomer :(UIView *)viewSwitch :(UIImageView *)driverImgView :(UIImageView *)customerImgView :(BOOL)isCustomer isSettings:(BOOL)isSettings{

  //  [Global roundView:viewSwitch];
    [Global roundView:btnCustomer];
    [Global roundView:btnDriver];

    viewSwitch.layer.cornerRadius = 20;
    
    if (isCustomer) {
//        [btnDriver setBackgroundColor:[UIColor colorWithRed:166.0f/255.0f green:62.0f/255.0 blue:62.0/255.0f alpha:1.0f]];
        [btnDriver setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        

        if (isSettings) {
//            [btnCustomer setBackgroundColor:[UIColor blackColor]];
        }else{
//            [btnCustomer setBackgroundColor:[UIColor whiteColor]];
        }
//        [btnCustomer setTitleColor:[UIColor colorWithRed:166.0f/255.0f green:62.0f/255.0 blue:62.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
        driverImgView.hidden = false;
        customerImgView.hidden = true;
        
        [viewSwitch bringSubviewToFront:btnDriver];
        [viewSwitch bringSubviewToFront:driverImgView];
        
    }
    else{
//        [btnCustomer setBackgroundColor:[UIColor colorWithRed:166.0f/255.0f green:62.0f/255.0 blue:62.0/255.0f alpha:1.0f]];
        [btnCustomer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (isSettings) {
//            [btnDriver setBackgroundColor:[UIColor blackColor]];
        }else{
//            [btnDriver setBackgroundColor:[UIColor whiteColor]];
        }
//        [btnDriver setTitleColor:[UIColor colorWithRed:166.0f/255.0f green:62.0f/255.0 blue:62.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
        driverImgView.hidden = true;
        customerImgView.hidden = false;
        
        [viewSwitch bringSubviewToFront:btnCustomer];
        [viewSwitch bringSubviewToFront:customerImgView];
    }
    
    

}

+(NSString *)getCurrentDate{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd MMM yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];
    
    dateFormat.dateFormat = @"hh:mm a";
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSString *currentDate = [NSString stringWithFormat:@"%@",dateString];
    return currentDate;

}

+(NSString *)getCurrentTime {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd MMM yyyy"];
    
    dateFormat.dateFormat = @"hh:mm a";
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSString *currentTime = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:today]];
    return currentTime;
    
}

+(void)setBtnWithoutBG:(UIButton *)btn{
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitleColor:[UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [[btn layer] setBorderWidth:1.0f];
    [[btn layer] setBorderColor:[UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f].CGColor];
    CGRect      buttonFrame = btn.frame;
    btn.layer.cornerRadius = buttonFrame.size.height/2 - 5;
    btn.clipsToBounds = YES;
}

+(void)setBluebackground:(UIView *)view{
   
    view.backgroundColor =[UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
    
}

+(void)changeImgviewColor:(UIImageView *)imgView{
    imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imgView setTintColor:[UIColor whiteColor]];
}

+(BOOL) checkforNumeric:(NSString*) str
{
    NSString *strMatchstring=@"\\b([0-9%_.+\\-]+)\\b";
    NSPredicate *textpredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", strMatchstring];
    
    if(![textpredicate evaluateWithObject:str])
    {
        return FALSE;
    }
    return TRUE;
}


+ (void)removeImage:(NSString *)filename
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:filename];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    if (success) {
        NSLog(@"delete img");
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }
}


+(BOOL) validateEmail:(NSString*) emailString
{
    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    NSLog(@"%i", regExMatches);
    if (regExMatches == 0) {
        return NO;
    }
    else
        return YES;
}

+ (UIButton*) buttonWithGradient:(UIButton *)btn beginColor:(UIColor*)beginColor endColor:(UIColor*)endColor
{
    
    CAGradientLayer* gradient = [CAGradientLayer layer];
    gradient.frame = btn.frame;
    gradient.colors = @[(id)beginColor.CGColor, (id)endColor.CGColor];
    [btn.layer insertSublayer:gradient atIndex:0];
    
    return btn;
}


+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}



+(void)setCornerRadious:(UIButton*)btn{
    CGRect      buttonFrame = btn.frame;
    btn.layer.cornerRadius = buttonFrame.size.height/2-5;
    btn.clipsToBounds = YES;
}

+(void)setMapBox:(UIView *)view{
    view.layer.borderColor = [UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f].CGColor;
    view.layer.borderWidth = 1.0f;
    view.layer.cornerRadius = 15;
    view.layer.masksToBounds = YES;
    
}

+(void)setTextView:(UITextView *)txtView{
    [[txtView layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[txtView layer] setBorderWidth:1];
    [[txtView layer] setCornerRadius:15];
     txtView.layer.borderColor = [UIColor colorWithRed:70.0f/255.0f green:190.0f/255.0f blue:213.0f/255.0f alpha:1.0f].CGColor;
    txtView.backgroundColor = [UIColor whiteColor];
}

+ (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius
{
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0;
        if (tl) corner = corner | UIRectCornerTopLeft;
        if (tr) corner = corner | UIRectCornerTopRight;
        if (bl) corner = corner | UIRectCornerBottomLeft;
        if (br) corner = corner | UIRectCornerBottomRight;
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    }
    return view;
}

+(void)changeArrow :(UIImageView *)imgView{
    imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imgView setTintColor:[UIColor blackColor]];
}

+(void)clearValues{
/*    APP_DELEGATE.SelectedPickupTimeMove = nil;
    APP_DELEGATE.SelectedPickupDateMove = nil;
    APP_DELEGATE.SelectedDeliveryTimeMove = nil;
    APP_DELEGATE.SelectedDeliveryDateMove = nil;
    APP_DELEGATE.SelectedMaterial = nil;
    
    
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"changeAddress"];
    [[NSUserDefaults standardUserDefaults] synchronize];
 */
}

+(void)setShadow:(UIButton *)btn cornerRadius:(CGFloat)radius{
    btn.layer.cornerRadius = radius;
    btn.layer.shadowOffset = CGSizeMake(0, 2.0f);
    btn.layer.shadowOpacity = 0.2f;
    btn.layer.shadowRadius = 0.0f;
    btn.layer.masksToBounds = NO;
}

+(void)switchColor:(UISwitch *)switchObj{
    [switchObj setTintColor:[UIColor colorWithRed:0.74f green:0.76f blue:0.78f alpha:1.00f]];
    [switchObj setOnTintColor:[UIColor colorWithRed:56.0f/255.0f green:128.0f/255.0f blue:185.0f/255.0f alpha:1.0f]];
    switchObj.backgroundColor = [UIColor blackColor];
    switchObj.layer.cornerRadius = 18.0;
}

+(NSMutableAttributedString*)changeTextFont:(NSString *)str{
   
    if ([str length] > 0) {
        
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSString *name = [NSString stringWithFormat:@"%@  ", [arr objectAtIndex:0]];;
    NSString *hour = [arr objectAtIndex:1];
    
    
    UIFont *arialFont = [UIFont fontWithName:@"Futura" size:16.0];
    NSDictionary *arialDict = [NSDictionary dictionaryWithObject: arialFont forKey:NSFontAttributeName];
    NSMutableAttributedString *aAttrString = [[NSMutableAttributedString alloc] initWithString:name attributes: arialDict];
    
    UIFont *VerdanaFont = [UIFont fontWithName:@"arial" size:14.0];
    NSDictionary *verdanaDict = [NSDictionary dictionaryWithObject:VerdanaFont forKey:NSFontAttributeName];
    NSMutableAttributedString *vAttrString = [[NSMutableAttributedString alloc]initWithString: hour attributes:verdanaDict];
    
    [aAttrString appendAttributedString:vAttrString];
    
        return aAttrString;
    //lblStaffName.attributedText = aAttrString;

    }
    
    return  nil;
}


+(NSMutableAttributedString*)changeTextFontColor:(NSString *)str{
    
    if ([str length] > 0) {
        
        NSArray *arr = [str componentsSeparatedByString:@"-"];
        NSString *name = [NSString stringWithFormat:@"%@  ", [arr objectAtIndex:0]];;
        NSString *hour = [arr objectAtIndex:1];
        
        //185 , 200 ,213
        UIFont *arialFont = [UIFont fontWithName:@"Futura" size:16.0];

        NSDictionary *attributes = @{NSFontAttributeName:arialFont,
                                     NSForegroundColorAttributeName:[UIColor whiteColor],
                                     NSBackgroundColorAttributeName:[UIColor clearColor],
                                     };
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:name attributes:attributes];
        
        
        NSDictionary *verdanaDict = @{NSFontAttributeName:arialFont,
                                      NSForegroundColorAttributeName:[UIColor colorWithRed:185.0f/250.0f green:200.0f/250.0f blue:213.0f/250.0f alpha:1.0],
                                      NSBackgroundColorAttributeName:[UIColor clearColor],
                                      };

        NSMutableAttributedString *vAttrString = [[NSMutableAttributedString alloc]initWithString: hour attributes:verdanaDict];
        
        [attributedText appendAttributedString:vAttrString];
        
        return attributedText;
        
    }
    
    return  nil;
}

+(void)saveImage :(UIImage *)img{
    
    float actualHeight = img.size.height;
    float actualWidth = img.size.width;
    float maxHeight = 600.0;
    float maxWidth = 800.0;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 0.5;//50 percent compression
    if (actualHeight > maxHeight || actualWidth > maxWidth){
        if(imgRatio < maxRatio){
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio){
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        }
        else{
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    NSLog(@"%@",savedImagePath);
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [img drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(image, compressionQuality);
    UIGraphicsEndImageContext();
    [imageData writeToFile:savedImagePath atomically:NO];

    
    
    
    //  UIImage *image = [Global imageWithImage:img scaledToSize:CGSizeMake(370,450)]; // imageView is my image from camera
//    NSLog(@"%@",savedImagePath);
}

+(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (NSString *)addingTimeToCurrentDate{
    NSTimeInterval secondsInEightHours = 21600;
    NSDate *incrementedDate = [NSDate dateWithTimeInterval:secondsInEightHours sinceDate:[NSDate date]];
 
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd MMMM, YYYY hh:mm:ss"];
    NSString *newdateString = [dateFormat stringFromDate:incrementedDate];

    [[NSUserDefaults standardUserDefaults] setObject:newdateString forKey:@"StrExpireDate"];
    [[NSUserDefaults standardUserDefaults] setObject:incrementedDate forKey:@"expireDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"New date - %@",newdateString);
    
    return newdateString;
}


+(void)compareDate{

 //   NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *newdateString = [formatter stringFromDate:[NSDate date]];

    
    
    NSDate *currentdate = [NSDate date];
/*    NSDate *endDate;
    [formatter setDateFormat:@"dd MMMM, YYYY hh:mm:ss"];
    NSString *currentDate = [formatter stringFromDate:currentdate];
    endDate = [formatter dateFromString:strNewDate];
*/
    NSDate *expireDate  = [[NSUserDefaults standardUserDefaults] valueForKey:@"expireDate"];

    
    NSLog(@"CurentDate=%@",currentdate);
    NSLog(@"ExpireDate=%@",expireDate);
    
    if([expireDate compare:currentdate]){
        NSLog(@"currentdate bigger than expireDate");
    
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isTimeExpired"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else{
        NSLog(@"expireDate bigger than currentdate");
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isTimeExpired"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
    
}

+(NSMutableAttributedString*)changeCombineTextFontColor:(NSString *)str{
    
    if ([str length] > 0) {
        
        NSArray *arr = [str componentsSeparatedByString:@"-"];
        NSString *name = [NSString stringWithFormat:@"%@  ", [arr objectAtIndex:0]];;
        NSString *hour = [arr objectAtIndex:1];
        
        //185 , 200 ,213
        UIFont *arialFont = [UIFont fontWithName:@"Futura" size:16.0];
        
        NSDictionary *attributes = @{NSFontAttributeName:arialFont,
                                     NSForegroundColorAttributeName:[UIColor grayColor],
                                     NSBackgroundColorAttributeName:[UIColor clearColor],
                                     };
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:name attributes:attributes];
        
        
        NSDictionary *verdanaDict = @{NSFontAttributeName:arialFont,
                                      NSForegroundColorAttributeName:[UIColor blackColor],
                                      NSBackgroundColorAttributeName:[UIColor clearColor],
                                      };
        
        NSMutableAttributedString *vAttrString = [[NSMutableAttributedString alloc]initWithString: hour attributes:verdanaDict];
        
        [attributedText appendAttributedString:vAttrString];
        
        return attributedText;
        
    }
    
    return  nil;
}
+(NSMutableAttributedString*)changeCombineTextFontColorBlackGray:(NSString *)str{
    
    if ([str length] > 0) {
        
        NSArray *arr = [str componentsSeparatedByString:@"-"];
        NSString *name = [NSString stringWithFormat:@"%@  ", [arr objectAtIndex:0]];;
        NSString *hour = [arr objectAtIndex:1];
        
        //185 , 200 ,213
        UIFont *arialFont = [UIFont fontWithName:@"Futura" size:16.0];
        
        NSDictionary *attributes = @{NSFontAttributeName:arialFont,
                                     NSForegroundColorAttributeName:[UIColor blackColor],
                                     NSBackgroundColorAttributeName:[UIColor clearColor],
                                     };
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:name attributes:attributes];
        
        
        NSDictionary *verdanaDict = @{NSFontAttributeName:arialFont,
                                      NSForegroundColorAttributeName:[UIColor grayColor],
                                      NSBackgroundColorAttributeName:[UIColor clearColor],
                                      };
        
        NSMutableAttributedString *vAttrString = [[NSMutableAttributedString alloc]initWithString: hour attributes:verdanaDict];
        
        [attributedText appendAttributedString:vAttrString];
        
        return attributedText;
        
    }
    
    return  nil;
}

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
  /*  UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    */
    
//    CGFloat scale = [[UIScreen mainScreen]scale];
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
  //  UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, image.scale);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*+(BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}
*/

+(BOOL)validatePhone:(NSString *)phoneNumber
{
    NSString *forNumeric = @"\\+?[0-9]{6,13}";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", forNumeric];
    if ([numberTest evaluateWithObject:phoneNumber] == YES)
        return TRUE;
    else
        return FALSE;
}

+(NSString *)checkNull :(NSString *)str {
    if(str==(id) [NSNull null] || [str length]==0 || [str isEqualToString:@""] || [str isEqualToString:@"Null"] || [str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"])
    {
        str = @"";
    }
  
    
    return str;
}

+(BOOL)isDriverLogin{
    BOOL isDriver;
    
    NSString *loginType = [[NSUserDefaults standardUserDefaults] valueForKey:@"LoginType"];
    if ([loginType isEqualToString:@"Driver"]) {
        isDriver = YES;
    }
    else{
        isDriver = NO;
    }
    return isDriver;
}

+(void)changeTabbar:(BOOL)isDriver homeLbl:(UILabel *)lblhome acceptedLbl:(UILabel *)lblAccepted coverLbl:(UILabel *)lblCover lblSettings:(UILabel *)lblSettings;
{
    if (isDriver) {
        lblhome.text = @"Home";
        lblAccepted.text = @"Accepted";
        lblCover.text = @"Cover";
        lblSettings.text = @"Settings";
    }else{
        lblhome.text = @"Home";
        lblAccepted.text = @"Completed";
        lblCover.text = @"Upcoming";
        lblSettings.text = @"Settings";

    }
}


+(CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr {
    
  /*  double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSLog(@"%@",req);
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
        
    }

    
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    return center;
    */
    
    CLLocationCoordinate2D center;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"https://maps.google.com/maps/api/geocode/json?sensor=false&address=%@&key=%@", esc_addr,GOOGLE_API_CLIENT];
    
    NSData *responseData = [[NSData alloc] initWithContentsOfURL:
                            [NSURL URLWithString:req]];    NSError *error;
    NSMutableDictionary *responseDictionary = [NSJSONSerialization
                                               JSONObjectWithData:responseData
                                               options:nil
                                               error:&error];
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
        center.latitude = 0;
        center.longitude = 0;
        return center;
    }
    else {
        NSArray *results = (NSArray *) responseDictionary[@"results"];
        
        if (results.count > 0) {
            
        NSDictionary *firstItem = (NSDictionary *) [results objectAtIndex:0];
        NSDictionary *geometry = (NSDictionary *) [firstItem objectForKey:@"geometry"];
        NSDictionary *location = (NSDictionary *) [geometry objectForKey:@"location"];
        NSNumber *lat = (NSNumber *) [location objectForKey:@"lat"];
        NSNumber *lng = (NSNumber *) [location objectForKey:@"lng"];
        
        center.latitude = [lat doubleValue];
        center.longitude = [lng doubleValue];
        return center;

        }
        else{
            
            NSLog(@"%@",responseDictionary);
            
            NSString *err = [responseDictionary valueForKey:@"error_message"];
            
            [Global showMessage:err withTitle:@"Google Map Error!"];
            
        //    [self getLocationFromAddressString:addressStr];

            center.latitude = 0;
            center.longitude = 0;

            return center;
            

        }
    }
    
    center.latitude = 0;
    center.longitude = 0;
    return center;
   
    
}

+(void)getLocationFromAddress:(NSString *)str{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:str completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        CLLocation *location = placemark.location;
        CLLocationCoordinate2D coordinate = location.coordinate;
        NSLog(@"Latitude %f", coordinate.latitude);
        NSLog(@"Longitude %f", coordinate.longitude);
    }];
    
}


+(void)setLoginType:(NSString *)strType{
    [[NSUserDefaults standardUserDefaults] setObject:strType forKey:@"LoginType"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)isCustomerToken{
    
    NSString *token =  [[NSUserDefaults standardUserDefaults] valueForKey:@"CustomerToken"];

    if (token.length == 0) {
        return NO;
    }
    else{
        return YES;
    }
}

+(BOOL)isDriverToken{

    NSString *token =  [[NSUserDefaults standardUserDefaults] valueForKey:@"DriverToken"];
    
    if (token.length == 0) {
        return NO;
    }
    else{
        return YES;
    }
    
}

+(void)removeToken{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CustomerToken"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"DriverToken"];

}


+(void)setBlurEffectView:(UIView *)view{
    
    view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = view.bounds;
    
    [view addSubview:blurEffectView];
}

+ (NSNumber *)convertTimeInSeconds:(NSString *)string {
    
    NSArray *components = [string componentsSeparatedByString:@":"];
    
    NSInteger hour   = [[components objectAtIndex:0] integerValue];
    NSInteger minute = [[components objectAtIndex:1] integerValue];
    NSInteger second = [[components objectAtIndex:2] integerValue];
    
    return [NSNumber numberWithInteger:(hour * 60 * 60) + (minute * 60) + second];
}


@end
