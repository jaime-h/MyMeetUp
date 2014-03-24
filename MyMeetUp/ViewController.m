//
//  ViewController.m
//  MyMeetUp
//
//  Created by Jaime Hernandez on 3/24/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *meetupDictionary;
    NSArray *meetupResults;
    __weak IBOutlet UITableView *myTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    // Building the URL string
    NSURL *meetupURL = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=7f75787372387770c7bb651752577"];
    NSURLRequest *meetupURLRequest = [NSURLRequest requestWithURL:meetupURL];
                        
    [super viewDidLoad];
    
    [NSURLConnection sendAsynchronousRequest:meetupURLRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        meetupDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

        meetupResults = meetupDictionary[@"results"];
        
        [myTableView reloadData];
        
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return meetupResults.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtoTypeCellIdentifier"];
    
    NSDictionary *result = meetupResults[indexPath.row];
    
    cell.textLabel.text = result[@"name"];
    cell.detailTextLabel.text = [result[@"venue"] objectForKey:@"address_1"];
    
    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [myTableView indexPathForSelectedRow];
    
    DetailViewController *destination = segue.destinationViewController;
    destination.navigationItem.title = [meetupResults[indexPath.row]objectForKey:@"name"];
    destination.rsvp = [NSString stringWithFormat:@"%@",[meetupResults[indexPath.row]objectForKey:@"yes_rsvp_count"]];
    destination.hostGroup = [[meetupResults[indexPath.row]objectForKey:@"group"]objectForKey:@"name"];
    destination.description = [meetupResults[indexPath.row]objectForKey:@"description"];
    destination.hyperlink = [meetupResults[indexPath.row]objectForKey:@"event_url"];
}

@end
