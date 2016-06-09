//
//  main.m
//  quark
//
//  Created by Billy Gray on 6/2/16.
//  Copyright © 2016 Zetetic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>
#import <stdio.h>
#import "QRKCoordinator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        QRKCoordinator *coordinator = [[QRKCoordinator alloc] init];
        [coordinator run];
        while (1) {
            // halt with ^D
        }
        [coordinator halt];
    }
    return 0;
}
