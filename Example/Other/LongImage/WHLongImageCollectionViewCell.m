//
//  WHLongImageCollectionViewCell.m
//  Example
//
//  Created by Jon on 2018/6/19.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHLongImageCollectionViewCell.h"

@interface WHLongImageCollectionViewCell () <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) WHButton *imageButton;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIImagePickerController *pickerController;
@property (nonatomic, strong) WHLongImage *model;

@end


@implementation WHLongImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageButton = [[WHButton alloc] init];
        [self.imageButton setTitle:@"添加图片" forState:UIControlStateNormal];
        [self.imageButton addTarget:self action:@selector(pickImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.imageButton];
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        self.textView = [[UITextView alloc] init];
        self.textView.layer.borderColor = [UIColor grayColor].CGColor;
        self.textView.layer.borderWidth = .5f;
        self.textView.delegate = self;
        [self.contentView addSubview:self.textView];
        self.pickerController = [[UIImagePickerController alloc] init];
        self.pickerController.delegate = self;
        self.pickerController.allowsEditing = YES;
    }
    return self;
}

- (void)updateModel:(WHLongImage *)model {
    self.model = model;
    [self.imageButton setTitle:[NSString stringWithFormat:@"添加第%@张图片", model.index] forState:UIControlStateNormal];
}

- (void)layoutSubviews {
    [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.top.equalTo(@(15));
        make.width.equalTo(@(120));
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(5));
        make.top.equalTo(self.imageButton.mas_bottom).offset(10);
        make.width.equalTo(@(kScreen_Width/2-10));
        make.height.equalTo(@(80));
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kScreen_Width/2+5));
        make.top.equalTo(@(15));
        make.width.equalTo(@(kScreen_Width/2-10));
        make.height.equalTo((@(130)));
    }];
}

- (void)pickImage:(WHButton *)btn {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self pickerImageWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
    UIAlertAction *photoAlbumAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self pickerImageWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:takePhotoAction];
    [alert addAction:photoAlbumAction];
    [alert addAction:cancelAction];
    [[WHUtils currentVisibleViewController] presentViewController:alert animated:YES completion:nil];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length != 0) {
        self.imageButton.enabled = NO;
        [self.imageButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else {
        self.imageButton.enabled = YES;
        [self.imageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (void)pickerImageWithSourceType:(UIImagePickerControllerSourceType)type {
    self.pickerController.sourceType = type;
    [[WHUtils currentVisibleViewController] presentViewController:self.pickerController animated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [[WHUtils currentVisibleViewController] dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    self.model.image = image;
    [self.imageView setImage:image];
    [[WHUtils currentVisibleViewController] dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    navigationController.navigationBar.tintColor = [UIColor grayColor];
}

@end
