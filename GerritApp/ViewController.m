//
//  ViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *SLLGerritURLString;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    [self loadData];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) loadData {
    [self setSLLGerritURLString:@"https://gerrit-review.googlesource.com/changes/?q=is:open"];
    [self setSLLGerritURLString:@"https://gerrit-review.googlesource.com/accounts/1011323"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:self.SLLGerritURLString] completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        if (!error && ![NSJSONSerialization isValidJSONObject:data]) {
        
            NSString* JSONStringRAW = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSString *prefixMagic = @")]}'\n";
            NSRange rangeSubstrig = NSMakeRange(prefixMagic.length, JSONStringRAW.length - prefixMagic.length);
            JSONStringRAW = [JSONStringRAW substringWithRange:rangeSubstrig];
            NSData *clearJSONData = [JSONStringRAW dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *errorSerialization;
            NSDictionary *jsonList = [NSJSONSerialization JSONObjectWithData:clearJSONData  options: NSJSONReadingAllowFragments error: &errorSerialization];
            NSLog(@"json list = %@", jsonList);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view setBackgroundColor:[UIColor whiteColor]];
            });
        }
        else
            NSLog(@"error %@", error);
    }];
    
    [dataTask resume];

}

@end
