//
//  DetailViewController.h
//  MyMeetUp
//
//  Created by Jaime Hernandez on 3/24/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *eventName;
@property (strong, nonatomic) NSString *rsvp;
@property (strong, nonatomic) NSString *hostGroup;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *hyperlink;

@end
