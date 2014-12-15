//
//  GMSMapView+Additions.m
//  Driver
//
//  Created by Antonio Pinho on 29/10/2014.
//  Copyright (c) 2014 Evolution. All rights reserved.
//

#import "GMSMapView+Additions.h"


@implementation GMSMapView (Additions)

- (UIButton *)myLocationButton {
    NSMutableArray *buttons = [NSMutableArray new];
    
    for (UIView *object in self.subviews) {
        if ([[[object class] description] isEqualToString:@"GMSUISettingsView"]) {
            for (UIView *view in object.subviews) {
                //GMSx_QTMButton
                if ([[[view class] description] isEqualToString:@"GMSx_QTMButton"]) {
                    [buttons addObject:view];
                }
            }
        }
    };
    
    if (buttons.count == 1) {
        return buttons[0];
    }
    
    if (buttons.count == 2) {
        UIButton *button_1 = [buttons objectAtIndex:0];
        UIButton *button_2 = [buttons objectAtIndex:1];
        
        return CGRectGetHeight(button_1.frame) > CGRectGetHeight(button_2.frame) ? button_1 : button_2;
    }
    
    NSLog(@"UPDATING GOOGLE MAPS MIGHT HAVE BROKEN THE LOCATION BUTTON. CHECK IF IT HAS THE CORRECT IMAGE ON PRESSED STATE!");
    
    return nil;
}

@end
