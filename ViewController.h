#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(retain,nonatomic) UIButton *button;
@property(retain,nonatomic) UILabel *label;
@property(retain,nonatomic) NSMutableString *string;//NSString 创建赋值以后该字符串的内容与长度不能在动态的更改，除非重新给这个字符串赋值。而NSMutableString 创建赋值以后可以动态在该字符串上更改内容与长度。

@property(assign,nonatomic) double num1, num2;
@property(assign,nonatomic) NSString *str;


@end