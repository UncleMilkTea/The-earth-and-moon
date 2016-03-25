//
//  ViewController.m
//  The-earth-and-moon
//
//
//  Copyright © 2016年 suger. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController () {

    CALayer *_layer;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self playImage:24 andImageName:@"图层" andImgView:_imageView];
    
    CALayer *layer = [CALayer layer];

    layer.bounds = CGRectMake(0, 0, 50, 50);
    
    layer.position = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height/2);
    
    layer.contents = (id)[UIImage imageNamed:@"moon"].CGImage;
    
    [self.view.layer addSublayer:layer];
    
    _layer = layer;

    layer.cornerRadius = 25;

    layer.masksToBounds = YES;
    
//    _array = [NSMutableArray array];
    
     [self star];
    
//    for (UIImageView *imageView in _array) {
//        
//        [self.view addSubview:imageView];
//    }
//    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(deletStar) userInfo:nil repeats:YES];
//    
//    [timer fire];
    
    }

- (void)star {

    for (int i=0; i<40; i++) {
        
        NSInteger width = arc4random_uniform(32);
        
        UIImageView *star = [[UIImageView alloc]initWithFrame:CGRectMake(arc4random_uniform(373), arc4random_uniform(665), width, width)];
        
        star.image = [UIImage imageNamed:[NSString stringWithFormat:@"spark_%d",arc4random_uniform(6)]];
        
        [self.view addSubview:star];
    }

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    CAKeyframeAnimation *amin = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.view.bounds];
    
    amin.path = path.CGPath;
    
    amin.duration = 20;
    
    amin.removedOnCompletion = NO;
    
    amin.repeatCount = CGFLOAT_MAX;
    
    amin.fillMode = kCAFillModeForwards;
    
    [_layer addAnimation:amin forKey:nil];
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    basic.toValue = @(M_PI * 2);
    
    basic.duration = 3;
    
    basic.repeatCount = CGFLOAT_MAX;
    
    [_layer addAnimation:basic forKey:nil];
    
    
   
}

//- (void)deletStar {
////    for (int i=0; i<_array.count; i++) {
//    [self.view subviews];
//    
//        [UIView animateWithDuration:.1 animations:^{
//            firstview.alpha = 0;
//            lastview.alpha = 0.0;
//            
//        } completion:^(BOOL finished) {
//            
//            [lastview removeFromSuperview];
//            [firstview removeFromSuperview];
//        }];
//        
//        if (_array.count == 0) {
//            _array = [self star:_array];
//            
////            continue;
//        }else {
//            
////            continue;
//            
//        }
//        
////    }


- (void)playImage:(NSUInteger)imageNum andImageName:(NSString *)picName andImgView:(UIImageView *)imageView{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=1; i<imageNum; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@ %d",picName,i];
        UIImage *img = [UIImage imageNamed:imageName];
        [array addObject:img];
    }
    imageView.animationImages = array;
    imageView.animationDuration = array.count*.1;
    imageView.animationRepeatCount =0;
    [imageView startAnimating];
    
    //    释放内存以后如果设置了重复播放无效
//    [imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:array.count*0.1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden {

    return YES;
}
@end
