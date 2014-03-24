//
//  DetailViewController.m
//  MyMeetUp
//
//  Created by Jaime Hernandez on 3/24/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;
@property (weak, nonatomic) IBOutlet UILabel *hostGroupLabel;
@property (weak, nonatomic) IBOutlet UILabel *hyperlinkLabel;

@property (weak, nonatomic) IBOutlet UIWebView *descriptionWebView;

@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.rsvpLabel.text = self.rsvp;
    self.hostGroupLabel.text = self.hostGroup;
    self.hyperlinkLabel.text = self.hyperlink;
    [self.descriptionWebView loadHTMLString:self.description baseURL:nil];
    
}
@end
