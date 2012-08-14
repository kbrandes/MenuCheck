//
//  MenuCheckViewController.m
//  MenuCheck
//
//  Created by Kevin Brandes on 19.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuCheckViewController.h"

@interface MenuCheckViewController ()<UIWebViewDelegate>

@end

@implementation MenuCheckViewController
@synthesize webView = _webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.compass-group.ch/units/sites/menu.asp?id=9146760195493698"]]];
    self.webView.delegate = self;
//    [self getMenuUrlFromWebsite:nil];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.compass-group.ch/units/pdf/
//      2773464104242130720121608510490.pdf"]]];
//    478969753113020200720121608510490.pdf
}

- (NSURL *)getMenuUrlFromWebsite:(NSURL *)website
{
    NSString *javaScriptResult = [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('p')"];
    NSLog(@"%@", javaScriptResult);
//    NSError *errorAccessingContent;
//    NSString *websiteHtml = [NSString stringWithContentsOfURL:website encoding:NSASCIIStringEncoding error:&errorAccessingContent];
//    if (!errorAccessingContent) {
        
//    }
    return nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *javaScriptResult = [self.webView stringByEvaluatingJavaScriptFromString:@"function() {links = document.getElementsByTagName('a'); i = links.length; while(i-->0){ if(links[i].innerHTML == 'ZHAW Winterthur') return 'found'; } return 'not found';}"];
    NSLog(@"%@", javaScriptResult);
}

@end
