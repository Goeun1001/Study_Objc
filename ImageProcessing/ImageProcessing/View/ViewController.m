//
//  ViewController.m
//  ImageProcessing
//
//  Created by GoEun Jeong on 2021/05/18.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)runGeneralPicker:(id)sender;
- (IBAction)WhiteBlackImage:(id)sender;
- (IBAction)InverseImage:(id)sender;
- (IBAction)TrackingImage:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    PImageProcessing = [[ImageProcessing alloc] init];
    originImage = [UIImage imageNamed:@"default.png"];
    [_imageView setImage:originImage];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)TrackingImage:(id)sender {
    _imageView.image = [[[PImageProcessing setImage:originImage] getTrackingImage] getImage];
}

- (IBAction)InverseImage:(id)sender {
    _imageView.image = [[[PImageProcessing setImage:originImage] getInverseImage] getImage];
}

- (IBAction)WhiteBlackImage:(id)sender {
    _imageView.image = [[[PImageProcessing setImage:originImage] getGrayImage] getImage];
}

- (IBAction)runGeneralPicker:(id)sender {
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)finishPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    originImage = nil;
    originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self finishPicker];
    
    [_imageView setImage:originImage];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self finishPicker];
}

@end
