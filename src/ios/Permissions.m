#import "Permissions.h"
#import <AVFoundation/AVCaptureSession.h>
@implementation Permisions

- (void)checkPermission:(CDVInvokedUrlCommand*)command
{
    NSString* mehtod = [[command arguments] objectAtIndex:0];

    //if (pictureOptions.sourceType == UIImagePickerControllerSourceTypeCamera) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted)
             {
                 if(!granted)
                 {
                    [self sendNoPermissionResult:command.callbackId];
                 } else {
                    [self sendOkPermissionResult:command.callbackId];
                 }
             }];
        //} else {
                    //[self sendOkPermissionResult:command.callbackId];
        //}
    // NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    // CDVPluginResult* result = [CDVPluginResult
    //                            resultWithStatus:CDVCommandStatus_OK
    //                            messageAsString:msg];

    // [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void)sendNoPermissionResult:(NSString*)callbackId
{
    CDVPluginResult* result = [CDVPluginResult 
                                resultWithStatus:CDVCommandStatus_ERROR 
                                messageAsString:@"has no access to camera"];   // error callback expects string ATM

    // [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:callbackId];

}
- (void)sendOkPermissionResult:(NSString*)callbackId
{
    CDVPluginResult* result = [CDVPluginResult
                                resultWithStatus:CDVCommandStatus_OK 
                                messageAsString:@"true"];   // Success callback expects string ATM

    // [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}
@end
