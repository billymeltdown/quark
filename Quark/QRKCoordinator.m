//
//  QRKCoordinator.m
//  quark
//
//  Created by Billy Gray on 6/2/16.
//  Copyright © 2016 Zetetic. All rights reserved.
//

#import "QRKCoordinator.h"

@interface QRKCoordinator ()
@property (strong) CBPeripheralManager *peripheral;
@property (strong) CBMutableCharacteristic *characteristic;
@property (strong) CBMutableService *service;
@end

@implementation QRKCoordinator

@synthesize peripheral;
@synthesize characteristic;
@synthesize service;

- (void)run {
    self.peripheral = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    NSString *ruleOfAcquisition1 = @"Once you have their money, you never give it back.";
    NSData *valueData = [ruleOfAcquisition1 dataUsingEncoding:NSUTF8StringEncoding];
    // We will provide, upon request, the Rules of Acquisition!
    CBUUID *rulesCharacteristicUUID = [CBUUID UUIDWithString: @"468A510F-3AA5-4297-A87D-5CDE483622F8"];
    self.characteristic = [[CBMutableCharacteristic alloc] initWithType:rulesCharacteristicUUID
                                                                           properties:CBCharacteristicPropertyRead
                                                                                value:valueData
                                                                          permissions:CBAttributePermissionsReadEncryptionRequired];
    // Our Rules of Acquisition service ID
    CBUUID *ferengiServiceUUID = [CBUUID UUIDWithString: @"6E1023B5-492B-4E92-A0A6-12A0D0475AAB"];
    self.service = [[CBMutableService alloc] initWithType:ferengiServiceUUID primary:YES];
    self.service.characteristics = @[self.characteristic];
    // Add our service to the peripheral manager and start advertising
    [self.peripheral addService:self.service];
    [self.peripheral startAdvertising:@{ CBAdvertisementDataServiceUUIDsKey : @[self.service.UUID] }];
}

- (void)halt {
    NSLog(@"Cleaning up...");
    [self.peripheral stopAdvertising];
    [self.peripheral removeAllServices];
}

#pragma mark - CBPeripheralManagerDelegate

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)manager {
    NSLog(@"Peripheral state changed to %d", (int)manager.state);
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral
            didAddService:(CBService *)service
                    error:(NSError *)error {
    NSLog(@"Add service callback");
    if (error) {
        NSLog(@"Error publishing service: %@", [error localizedDescription]);
    }
}

- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral
                                       error:(NSError *)error {
    NSLog(@"Started advertising callback");
    if (error) {
        NSLog(@"Error advertising: %@", [error localizedDescription]);
    }
}



@end
