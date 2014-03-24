//
//  ViewController.m
//  MyMeetUp
//
//  Created by Jaime Hernandez on 3/24/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *meetupDictionary;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    // Building the URL string
    NSURL *meetupURL = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=7f75787372387770c7bb651752577"];
    NSURLRequest *meetupURLRequest = [NSURLRequest requestWithURL:meetupURL];
    
    [NSURLConnection sendAsynchronousRequest:meetupURLRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        meetupDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", meetupDictionary);
        
         }];
    
                        
                        
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return meetupDictionary.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtoTypeCellIdentifier"];
    NSDictionary *currentEvent = meetupDictionary[indexPath.row];
    
    cell.textLabel.text = currentEvent[@"name"];
    cell.detailTextLabel.text = currentEvent[@"adress"];
    
    return cell;

}

@end
