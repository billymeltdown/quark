//
//  AppDelegate.m
//  Quark
//
//  Created by Billy Gray on 6/2/16.
//  Copyright © 2016 Zetetic. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong) QRKCoordinator *coordinator;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.coordinator = [[QRKCoordinator alloc] init];
    [self.coordinator run];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [self.coordinator halt];
}

@end
