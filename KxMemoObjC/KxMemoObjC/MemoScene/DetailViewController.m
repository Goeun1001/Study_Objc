//
//  DetailViewController.m
//  KxMemoObjC
//
//  Created by GoEun Jeong on 2021/05/17.
//

#import "DetailViewController.h"
#import "ComposeViewController.h"
#import "DataManager.h"

@interface DetailViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSDateFormatter* formatter;

@property (weak, nonatomic) IBOutlet UITableView *memoTableView;

- (IBAction)deleteMemo:(id)sender;

- (IBAction)share:(id)sender;

@end

@implementation DetailViewController

- (NSInteger)tableView: (UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"memoCell" forIndexPath:indexPath];
        
        cell.textLabel.text = self.memo.content;
        
        return cell;
    } else {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"dateCell" forIndexPath:indexPath];
        
        cell.textLabel.text = [self.formatter stringFromDate:self.memo.insertDate];
        
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ComposeViewController* vc = (ComposeViewController*)segue.destinationViewController;
    vc.editTarget = self.memo;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.memoTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateStyle = NSDateFormatterMediumStyle;
    self.formatter.timeStyle = NSDateFormatterMediumStyle;
    self.formatter.locale = [NSLocale localeWithLocaleIdentifier:@"Ko_kr"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)share:(id)sender {
    NSString* memo = self.memo.content;
    
    UIActivityViewController* vc = [[UIActivityViewController alloc] initWithActivityItems:@[memo] applicationActivities:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)deleteMemo:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"?????? ??????" message:@"????????? ????????????????" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[DataManager sharedInstance] deleteMemo:self.memo];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:okAction];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
