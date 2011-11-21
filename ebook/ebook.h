//
//  ebook.h
//  ebook
//
//  Created by liangfei zhou on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ebook : UIView <UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    
    unsigned int numPages;
    unsigned int currentPage;
}
-(void)initView;
@end
