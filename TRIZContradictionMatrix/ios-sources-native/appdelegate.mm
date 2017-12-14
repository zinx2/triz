#include "src/native_app.h"
#include "UIKit/UIKit.h"
//#import "appdelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "AudioToolBox/AudioToolBox.h"
#include <QtCore>

#define isOSVersionOver10 ([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] integerValue] >= 10)

@interface QIOSApplicationDelegate
@end

@interface QIOSApplicationDelegate(AppDelegate)
@end

@implementation QIOSApplicationDelegate (AppDelegate)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initializeRemoteNotification];
    
    return YES;
}

- (void)initializeRemoteNotification {
    if(isOSVersionOver10) {
        NSLog(@"iOS >= 10");
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        //center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if(!error) {
                //푸시 서비스 등록 성공
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            } else {
                //푸시 서비스 등록 실패
            }
        }];
    } else {
        NSLog(@"iOS < 10");
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert |UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken
{
    NSMutableString *tokenHex = [NSMutableString stringWithString:[deviceToken description]];
    [tokenHex replaceOccurrencesOfString:@"<" withString:@"" options:0 range:NSMakeRange(0, [tokenHex length])];
    [tokenHex replaceOccurrencesOfString:@">" withString:@"" options:0 range:NSMakeRange(0, [tokenHex length])];
    [tokenHex replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0, [tokenHex length])];
    NSLog(@"Token origin : %@", deviceToken);
    NSLog(@"Token : %@", tokenHex);
    //    NSString* token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    //token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    //    NSLog(@"DeviceToken : %@", token);
}

// iOS9 이하 푸시 Delegate
#pragma mark - Remote Notification Delegate <= iOS 9.x
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(nonnull UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
    //    if ((notificationSettings.types & 1) == UIUserNotificationTypeNone) {
    //        NSLog(@"user selected NO");
    //    } else {
    //        NSLog(@"user selected YES");
    //        [application registerForRemoteNotifications];
    //    }
}

//푸시 데이터 들어오는 함수
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"userInfo : %@", userInfo);
    //    NSDictionary* payload = [userInfo objectForKey:@"aps"];
    //    NSString *message = [payload objectForKey:@"alert"];
    //    NSString *soundName = [payload objectForKey:@"sound"];
    //
    int type = [[userInfo objectForKey:@"type"] intValue];
    NSLog(@"type : %d", type);
    
    if([UIApplication sharedApplication].applicationState == UIApplicationStateInactive)
    {
        NSLog(@"INACTIVE");
        completionHandler(UIBackgroundFetchResultNewData);
    }
    else if([UIApplication sharedApplication].applicationState == UIApplicationStateBackground)
    {
        NSLog(@"BACKGROUND");
        completionHandler(UIBackgroundFetchResultNewData);
    }
    else
    {
        NSLog(@"FOREGROUND");
        completionHandler(UIBackgroundFetchResultNewData);
    }
    //    BOOL isShow = [[userInfo objectForKey:@"show"] boolValue];
    //

    //    NSLog(@"show : %d", isShow );
    //
    //    if(application.applicationState == UIApplicationStateActive)
    //    {
    //        NSLog(@"App is Active");
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //        [alert show];
    //
    //
    //
    //    } else {
    //        NSLog(@"App is Inactive");
    //        UILocalNotification *notification = [[UILocalNotification alloc]init];
    //        notification.timeZone = [NSTimeZone systemTimeZone];
    //        notification.alertBody = message;
    //        [notification setSoundName:soundName];
    //                //notification.soundName = UILocalNotificationDefaultSoundName;
    //        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    //    }
    //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    NSLog(@"Error : %@", error);
}

//iOS10 이상 푸시 Delegate
#pragma mark - UNUserNotificationCenter Delegate for >= iOS 10
//앱이 실행되고 있을 때 푸시 데이터 처리
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(nonnull UNNotification *)notification withCompletionHandler:(nonnull void (^)(UNNotificationPresentationOptions))completionHandler {
    NSLog(@"Remote notification : %@", notification.request.content.userInfo);
    int type = [[notification.request.content.userInfo objectForKey:@"type"] intValue];
    NSLog(@"type : %d", type);

    //푸시 배너 띄워줌
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge);
}

//앱이 백그라운드나 종료된 상태에서 푸시 데이터 처리
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(nonnull UNNotificationResponse *)response withCompletionHandler:(nonnull void (^)(void))completionHandler {
    NSLog(@"Remote notification : %@", response.notification.request.content.userInfo);
    int type = [[response.notification.request.content.userInfo objectForKey:@"type"] intValue];
    NSLog(@"type : %d", type);
    completionHandler();
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
