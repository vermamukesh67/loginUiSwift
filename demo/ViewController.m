//
//  ViewController.m
//  demo
//
//  Created by Verma Mukesh on 25/04/18.
//  Copyright © 2018 Verma Mukesh. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"home"];
    diccData=[[NSMutableDictionary alloc] init];
    [diccData setObject:@"30" forKey:@"age"];
    [diccData setObject:@"verma" forKey:@"name"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"dicc in first = %@",diccData);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnTapped:(id)sender {
    
//    SecondViewController *objScr=[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    [objScr setDiccRef:diccData];
//    [self.navigationController pushViewController:objScr animated:YES];
}
@end
