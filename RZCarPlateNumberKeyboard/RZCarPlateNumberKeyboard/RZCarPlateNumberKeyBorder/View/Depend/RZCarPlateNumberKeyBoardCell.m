//
//  RZCarPlateNumberKeyBoardCell.m
//  EntranceGuard
//
//  Created by 若醉 on 2018/5/18.
//  Copyright © 2018年 rztime. All rights reserved.
//

#import "RZCarPlateNumberKeyBoardCell.h"
#import <Masonry.h>

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define rgb(r, g, b) RGBA(r, g, b, 1)

#define RGBGRAY(gray) RGBA(gray, gray, gray, 1)

@interface RZCarPlateNumberKeyBoardCell ()

@property (nonatomic, strong) UIButton *textButton;

@property (nonatomic, strong) UIImageView *imageView;

@end
@implementation RZCarPlateNumberKeyBoardCell

- (UIButton *)textButton {
    ;
    if (!_textButton) {
        _textButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_textButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
        [self.contentView addSubview:_textButton];
        _textButton.backgroundColor = [UIColor whiteColor];
        _textButton.layer.masksToBounds = YES;
        _textButton.layer.cornerRadius = 3;
        [_textButton setTitleColor:RGBGRAY(51) forState:UIControlStateNormal];
        _textButton.userInteractionEnabled = NO;
        
        [_textButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(8, 2, 2, 2));
        }];
    }
    return _textButton;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.textButton);
        }];
    }
    return _imageView;
}

- (void)setValue:(RZCarPlateNumberKeyBoardValue *)value {
    _value = value;
    [self.textButton setTitle:value.text forState:UIControlStateNormal];
    self.imageView.image = value.image;
    [self.textButton setTitleColor:RGBGRAY(51) forState:UIControlStateNormal];
    
    if (value.changeKeyBoardType) {
        self.textButton.backgroundColor = rgb(21,126,251);
        [self.textButton setTitleColor:RGBGRAY(255) forState:UIControlStateNormal];
    } else if (value.deleteTextType) {
        self.textButton.backgroundColor = rgb(171, 178, 190);
    } else {
        self.textButton.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    }
}

@end
