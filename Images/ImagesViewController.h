//
//  ImagesViewController.h
//  Images
//
//  Created by Andra Mititelu on 1/4/13.
//  Copyright (c) 2013 Andra Mititelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end
