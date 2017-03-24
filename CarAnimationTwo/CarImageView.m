//
//  CarImageView.m
//  CarAnimationTwo
//
//  Created by lwj on 17/3/1.
//  Copyright © 2017年 WenJin Li. All rights reserved.
//

#import "CarImageView.h"

@interface CarImageView()

@property (nonatomic, strong) NSMutableArray *images;

@end


@implementation CarImageView

- (instancetype)initWithFrame:(CGRect)frame withConfigFilePath:(NSString*)configFilePath;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViewWithConfigFilePath:configFilePath];
    }
    return self;
}
- (void)initViewWithConfigFilePath:(NSString*)configFilePath{
    _images = [[NSMutableArray alloc]initWithCapacity:0];
    NSData *JSONData = [NSData dataWithContentsOfFile:configFilePath];
     id json = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    if (json && [json isKindOfClass:[NSDictionary class]]) {
        NSArray* array = [json objectForKey:@"carImageArray"];
        if (array && array.count > 0) {
            for (int i = 0; i < array.count ; i++) {
                NSString *imagename = array[i];
                UIImage *image = [UIImage imageNamed:imagename];
                [_images addObject:image];
            }
            self.animationImages = _images;
            self.animationRepeatCount = 1;
            self.image = _images[0];
            
            CGFloat duration = _images.count*0.08;
            
            self.animationDuration = duration;
            [self startAnimating];
            [self performSelector:@selector(removeSelf) withObject:nil afterDelay:duration];
        }
    }
    
    
    
    
}
-(void)removeSelf{
    [self stopAnimating];
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
