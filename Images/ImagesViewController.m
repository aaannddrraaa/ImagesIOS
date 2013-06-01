//
//  ImagesViewController.m
//  Images
//
//  Created by Andra Mititelu on 1/4/13.
//  Copyright (c) 2013 Andra Mititelu. All rights reserved.
//

#import "ImagesViewController.h"
#import "ImagesSource.h"

@interface ImagesViewController ()

@property (readonly) NSString *html;
@property (nonatomic, strong) ImagesSource *imagesSource;

- (void)swipeRight;
- (void)swipeLeft;
@end

@implementation ImagesViewController

@synthesize webView = _webView;
@synthesize html = _html;
@synthesize imagesSource = _imagesSource;

- (ImagesSource *)imagesSource
{
    if(!_imagesSource)
    {
        _imagesSource = [[ImagesSource alloc] init];
    }
    return _imagesSource;
}

- (NSString *)html
{
    if(!_html)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"webView" ofType:@"html"];
        _html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    }
    return _html;
}


- (void)swipeLeft
{   
    if (self.imagesSource.hasLeft) {
        NSString *imgSrc = [self.imagesSource nextLeft];
        NSString *fullHtml = [self.html stringByReplacingOccurrencesOfString:@"[[IMGSRC]]" withString:imgSrc];
        
        [self.webView loadHTMLString:fullHtml baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    }
   
}

- (void)swipeRight
{
    if (self.imagesSource.hasRight) {
        NSString *imgSrc = [self.imagesSource nextRight];
        NSString *fullHtml = [self.html stringByReplacingOccurrencesOfString:@"[[IMGSRC]]" withString:imgSrc];
        
        [self.webView loadHTMLString:fullHtml baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading t
    
    NSString *imgSrc = [self.imagesSource firstSrc];
    NSString *fullHtml = [self.html stringByReplacingOccurrencesOfString:@"[[IMGSRC]]" withString:imgSrc];
    
    [self.webView loadHTMLString:fullHtml baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
    UISwipeGestureRecognizer *swipeLeftr =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    [self.webView addGestureRecognizer:swipeLeftr];
    
    UISwipeGestureRecognizer *swipeRightr =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    [swipeRightr setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.webView addGestureRecognizer:swipeRightr];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)effectButtonPressed:(UIButton *)sender
{
    NSString *effectName = [sender currentTitle];
    NSString *style = @"<style>img{-webkit-filter:";
    if([effectName isEqualToString:@"Blur"]){
        style = [style stringByAppendingString:@"blur(3)"];
    }
    else if([effectName isEqualToString:@"Brightness"]){
        style = [style stringByAppendingString:@"brightness(50%)"];
    }
    else if([effectName isEqualToString:@"Sepia"]){
        style = [style stringByAppendingString:@"sepia(70%)"];
    }
    else if([effectName isEqualToString:@"Grayscale"]){
        style = [style stringByAppendingString:@"grayscale(100%)"];        
    }
    style = [style stringByAppendingString:@"}</style>"];
    
    NSString *imgSrc = [self.imagesSource currentSrc];
    NSString *fullHtml = [self.html stringByReplacingOccurrencesOfString:@"[[IMGSRC]]" withString:imgSrc];
    fullHtml = [fullHtml stringByAppendingString:style];
    [self.webView loadHTMLString:fullHtml baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}




@end
