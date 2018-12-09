//
//  StartViewController.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *picker;

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation StartViewController

#pragma mark - Life Cycle

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self configureButton];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden: YES animated: animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden: NO animated: animated];
}

#pragma mark - Configuring

- (void) configureButton {
    [self.button setTitle: @"button_filterize".flt_localized forState: UIControlStateNormal];
    [self.button flt_configure];
}

#pragma mark - Actions

- (IBAction) onClickPickPhoto:(UIButton *)sender {
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        [self presentImagePicker: UIImagePickerControllerSourceTypePhotoLibrary];
        return;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"title_alert_pick_photo".flt_localized
                                                                   message: nil
                                                            preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *gallery = [UIAlertAction actionWithTitle: @"button_gallery".flt_localized style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self presentImagePicker: UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    UIAlertAction *camera = [UIAlertAction actionWithTitle: @"button_camera".flt_localized style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self presentImagePicker: UIImagePickerControllerSourceTypeCamera];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"button_cancel".flt_localized style: UIAlertActionStyleCancel handler: nil];
    
    [alert addAction: gallery];
    [alert addAction: camera];
    [alert addAction: cancel];
    
    [self presentViewController: alert animated: YES completion: nil];
}

- (void) presentImagePicker: (UIImagePickerControllerSourceType) sourceType {
    self.picker = [UIImagePickerController new];
    self.picker.sourceType = sourceType;
    self.picker.delegate = self;
    self.picker.editing = NO;
    [self presentViewController: self.picker animated: YES completion: nil];
}

#pragma mark - UIImagePickerController

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated: YES completion:^{
        UIViewController *controller = [Controllers.factory filters: image];
        [self.navigationController pushViewController: controller animated: YES];
    }];
}
@end
