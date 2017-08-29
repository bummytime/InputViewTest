#import "ViewController.h"
#import "InputViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (nonatomic, strong) UIView *testInputView;
@property (nonatomic, strong) InputViewController *testInputViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTextField1];
    [self setupTextField2];
}

- (IBAction)tappedResign:(id)sender {
    [self.textField resignFirstResponder];
    [self.textField2 resignFirstResponder];
}

- (void)setupTextField1 {
    self.testInputView = [UIView new];
    self.testInputView.backgroundColor = [UIColor greenColor];
    self.testInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.textField.inputView = self.testInputView;
}

- (void)setupTextField2 {
    if (self.inputViewController) {
        [self.inputViewController removeFromParentViewController];
    } else {
        self.testInputViewController = [[InputViewController alloc] init];
    }

    [self addChildViewController:self.testInputViewController];
    self.textField2.inputView = self.testInputViewController.view;
    [self.testInputViewController didMoveToParentViewController:self];
}

@end
