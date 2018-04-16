//
//  ViewController.m
//  NSDictionary
//
//  Created by Slava on 4/16/18.
//  Copyright © 2018 Slava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Create NSDictionary using literal declaration.
    
    NSDictionary *dict = @{@"name": @"Ivan", @"age": @"30",@"lastName": @"Ivanov",@"sity": @"Minsk"};
    
   // Make it mutable and add several new entries.
    
    NSMutableDictionary *mutableDict = [[dict mutableCopy] autorelease];
    
    [mutableDict setObject:@"1234" forKey:@"id"];
    
    NSArray *arrayValues = [NSArray arrayWithObjects:@"country",@"car", nil];
    NSArray *arrayKeys = [NSArray arrayWithObjects:@"belarus",@"bMW", nil];
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjects:arrayValues forKeys:arrayKeys];
    
    [arrayValues retain];
    [arrayValues release];
    
    [arrayKeys retain];
    [arrayKeys release];
    
    [mutableDict addEntriesFromDictionary:dict1];
    [dict1 retain];
    [dict1 release];
   
    
    NSArray *allKeys = [mutableDict allKeys];
   
   // sort dictionary in descending
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(compare:)];
    NSMutableArray *sorted = [NSMutableArray arrayWithObject:sortDescriptor];
    [sortDescriptor retain];
    [sortDescriptor release];
    
    NSArray *sortKeys = [allKeys sortedArrayUsingDescriptors:sorted];
    
    
    for (NSString* key in sortKeys) {
        NSLog(@"%@ - %@",key, mutableDict[key]);
    }
   
    // sort dictionary in ascending
    
    NSSortDescriptor *sortDescriptor2 = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(compare:)];
    
    NSMutableArray *sorted2 = [NSMutableArray arrayWithObject:sortDescriptor2];
    [sortDescriptor2 retain];
    [sortDescriptor2 release];
    
    NSArray *sortKeys2 = [allKeys sortedArrayUsingDescriptors:sorted2];
    
    for (NSString* key in sortKeys2) {
        NSLog(@"%@ - %@",key, mutableDict[key]);
    }
   
    // Check whether required value is contained in the dictionary.

    NSString  *checkingVavue = @"Ivan";
    
    for (NSString *key in [mutableDict allKeys]){
        if (mutableDict[key] == checkingVavue) {
            NSLog(@"Yes");
        }
    }
    
    for (NSString *value in [mutableDict allValues]){
        if (value == checkingVavue) {
            NSLog(@"Yes");
        }
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
