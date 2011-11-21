//
//  ebook.m
//  ebook
//
//  Created by liangfei zhou on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ebook.h"

@implementation ebook

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initView];
        // Initialization code
    }
    return self;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scroll
{
    CGFloat pageWidth = scroll.frame.size.width;
    currentPage = floor((scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    [pageControl setCurrentPage:currentPage-1];
}

-(void)initView
{
    scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    scrollView.clipsToBounds = YES;
	scrollView.scrollEnabled = YES;
	scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    numPages = 29;
    currentPage = 0;
    
    for (unsigned int i=0; i<numPages; i++) 
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"img_book_page_%d.png", i+1]];
        
        UIImageView *view = [[UIImageView alloc] initWithImage:image];
        view.frame = CGRectMake(i*1024, 0, 1024, 768);
        
        [scrollView addSubview:view];
    }
    
    [scrollView setContentSize:CGSizeMake((numPages * 1024), 768)];
    
    [self addSubview:scrollView];
    
    
    //
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(110, 706-13, 1024-220, 44)];
        
    pageControl.numberOfPages = numPages;
    
    [pageControl setCurrentPage:currentPage];
    
    pageControl.userInteractionEnabled = FALSE;
    
    [self addSubview:pageControl];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
