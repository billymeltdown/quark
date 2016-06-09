//
//  QRKCoordinator.h
//  quark
//
//  Created by Billy Gray on 6/2/16.
//  Copyright © 2016 Zetetic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface QRKCoordinator : NSObject <CBPeripheralManagerDelegate>

- (void)run;
- (void)halt;

@end
