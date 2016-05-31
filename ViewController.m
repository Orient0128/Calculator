//
//  ViewController.m
//  iPhone
//
//  Created by Orient on 16/5/18.
//  Copyright © 2016年 Orient. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"


@interface ViewController ()



@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建一个导航栏
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, 375, 44)];
    //设置导航栏透明
    UIImage *image = [[UIImage alloc]init];
    [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    navigationBar.barStyle = UIBarStyleDefault;
    
    
    
    //创建一个导航栏集合
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    //创建一个左边按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左转"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(clickLeftButton)];

    
    //创建一个右边按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右转"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(clickRightButton)];

    //设置导航栏内容
    [navigationItem setTitle:@"我要离开这套路的城市"];
    //把导航栏集合添加入导航栏中，设置动画关闭
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    //把左右两个按钮添加入导航栏集合中
    [navigationItem setLeftBarButtonItem:leftButton];
    [navigationItem setRightBarButtonItem:rightButton];
    
    [self.view addSubview:navigationBar];
    
    
    //背景图
//    UIView *backgroundImage = [[UIView alloc]initWithFrame:CGRectMake(0, 245, 370, 600)];
//    
//    backgroundImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go"]];
//    [self.view addSubview:backgroundImage];
//    
    

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(90, 100, 200, 150)];
    [self.view addSubview:_label];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.textColor = [UIColor blackColor];
    self.label.text = @"我要离开这\r\n套路的城市";
    self.label.lineBreakMode = NSLineBreakByWordWrapping;
    self.label.numberOfLines = 0;//上两行设置自动换行
    //    self.label.textAlignment = UITextAlignmentRight;//字体居右
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:30];
    
    
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    int n = 0;
    for (int i = 0; i < 3; i++){
        for (int j = 0; j <3; j++){
            self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            self.button.frame = CGRectMake(50+65*j, 250+65*i, 60, 60);
            [self.button setTitle:[array objectAtIndex:n++] forState:UIControlStateNormal];
            [self.view addSubview:_button];
            [self.button addTarget:self  action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];//addTarget:self 的意思是说，这个方法在本类中也可以传入其他类的指针
        }
    }
    
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];//圆角矩形按钮
    /*
     CALayer *layer = button0.layer;
     [layer setMasksToBounds:YES];
     [layer setCornerRadius:5.0];
     button0.layer.borderColor = [UIColor lightGrayColor].CGColor;
     button0.layer.borderWidth = 1.0f;
     */
    [button0 setFrame:CGRectMake(115, 445, 60, 60)];//button0.frame:CGRectMake(30, 345, 60, 60);
    [button0 setTitle: @"0" forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    
    NSArray *array1 = [NSArray arrayWithObjects:@"+",@"-",@"*",@"/", nil];
    for (int i = 0; i < 4; i++){
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button1 setFrame:CGRectMake(245, 250+65*i, 60, 60)];
        [button1 setTitle:[array1 objectAtIndex:i] forState:UIControlStateNormal];//为获取按钮的属性值
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button1];
        [button1 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
         
    }
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setFrame:CGRectMake(180, 445, 60, 60)];
    [button2 setTitle:@"=" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//  [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setFrame:CGRectMake(140, 510, 90, 60)];
    [button3 setTitle:@"AC" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self.view addSubview:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setFrame:CGRectMake(50, 445, 60, 60)];
    [button4 setTitle:@"." forState:UIControlStateNormal];
//    [button4 setBackgroundColor:[UIColor blackColor]];
    [button4 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self.view addSubview:button4];
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button5 setFrame:CGRectMake(50, 510, 90, 60)];
    [button5 setTitle:@"Del" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self.view addSubview:button5];
    
    
    self.string = [[NSMutableString alloc]init];//初始化可变字符串，分配内存
    self.str = [[NSString alloc]init];
    // Do any additional setup after loading the view, typically from a nib.

}

//0-9
-(void)shuzi:(id)sender{
    
    [self.string appendString:[sender currentTitle]];//数字连续输入
    self.label.text = [NSString stringWithString:_string];//显示数字
    self.num1 = [self.label.text doubleValue];//保存输入的数值
    NSLog(@"self.numq is %f",self.num1);
}

//calculate
-(void)go:(id)sender{
    if ([self.str isEqualToString:@""]){//当str为空
        self.num2 = self.num1;
        NSLog(@"self.num2 is &f",self.num2);
        self.label.text = [NSString stringWithString:_string];//只要是符号就显示数值
        [self.string setString:@""];//字符串清零
        self.str = [sender currentTitle];//保存运算符判断何种运算
        NSLog(@"%@",_str);
        [self.string appendString:self.string];
        self.label.text = [NSString stringWithString:_string];//显示数值
        [self.string setString:@""];//字符串清零
        
    }
    else{
        //输出上次计算结果
        if ([self.str isEqualToString:@"+"]){
            [self.string setString:@""];//清零
            self.num2 += self.num1;
            
            //输出上次结果后判断这次输入的符号
            if ([[sender currentTitle]isEqualToString:@"="]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] ||[[sender currentTitle]isEqualToString:@"/"]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];//字符串清零
                self.str = [sender currentTitle];//保存运算符来判断做何种运算
                NSLog(@"%@",_str);
                [self.string appendString:self.str];
                [self.string setString:@""];
            }
        }
        else if ([self.str isEqualToString:@"-"]){
            [self.string setString:@""];
            self.num2 -= self.num1;
            //输出上次结果后判断这次输入的是什么符号
            if ([[sender currentTitle]isEqualToString:@"="]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                NSLog(@"%@",_str);
                [self.string appendString:self.string];
                [self.string setString:@""];
            }
        }
        else if ([self.str hasPrefix:@"*"]){//之前的符号是* hasPrefix:方法的功能是判断创建的字符串内容是否以某个字符开始
            [self.string setString:@""];
            self.num2 *= self.num1;
            //输出上次结果后判断这次输入的是什么符号
            if ([[sender currentTitle]isEqualToString:@"="]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"] || [[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                NSLog(@"%@",_str);
                [self.string appendString:self.str];//在字符串后增加新的东西，[a appendString:]
                [self.string setString:@""];
            }
        }
        else if([self.str isEqualToString:@"/"]){
            [self.string setString:@""];
            self.num2 /= self.num1;
            //判断输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                self.str = @"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"] ||[[sender currentTitle]isEqualToString:@"-"] || [[sender currentTitle]isEqualToString:@"*"] || [[sender currentTitle]isEqualToString:@"/"]){
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text = [NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];
                self.str = [sender currentTitle];
                NSLog(@"%@",_str);
                [self.string appendString:self.str];
                [self.string setString:@""];
            }
        }
    }
}

-(void)clean:(id)sender{
    [self.string setString:@""];
    self.num1 = 0;
    self.num2 = 0;
    self.label.text = @"我要离开这\r\n套路的城市";
}

-(void)back:(id)sender{
    if (![self.label.text isEqualToString:@""]){//判断不为空
        [self.string deleteCharactersInRange:NSMakeRange([self.string length]-1, 1)];//删除最后一个字符
        self.label.text = [NSString stringWithFormat:_string];//显示结果
    }
}

-(void)clickLeftButton
{
    
    [self showDialog:@"点击了导航栏左边按钮"];
    
}

-(void)clickRightButton
{
    
    [self showDialog:@"点击了导航栏右边按钮"];
    
}

-(void)showDialog:(NSString *) str
{
    
    UIAlertView * alert= [[UIAlertView alloc] initWithTitle:@"这是一个对话框" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [alert show];
}

-(void)viewDidUnload{
    [super viewDidUnload];
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
