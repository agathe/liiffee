//
// Created by Agathe Battestini on 3/22/14.
// Copyright (c) 2014 Liiffee. All rights reserved.
//

#import "LiiFImageCellView.h"
#import "UIImageView+AFNetworking.h"

@interface LiiFImageCellView()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LiiFImageCellView {

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    // Configure self
    self.backgroundColor = [UIColor darkGrayColor];

    [self setupViews];
    [self setupLayout];

    return self;
}

- (void)setupViews
{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
}

- (void)setupLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];

}

#pragma mark - views

- (UILabel *)titleLabel
{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];

    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if(!_imageView){
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;

    }
    return _imageView;
}

#pragma mark - Setting data object

- (void)setDataObject:(id)object
{
    if(!object || object == [NSNull null]){
        return ;
    }
    if([object isKindOfClass:[InstagramMedia class]]){
        InstagramMedia *media = (InstagramMedia *) object;
        [self.imageView setImageWithURL:media.thumbnailURL];
        self.titleLabel.attributedText = nil;
    }
    else {
        self.imageView.image = nil;
        self.imageView.backgroundColor = [UIColor liifSubtleGray];
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"No salad image"
                     attributes:[UIFont liifStringAttributesWithSize:12.0f withColor:[UIColor liifDarkText]]];
        self.titleLabel.attributedText = string;
    }
//    NSDictionary *foursquarePlace = (NSDictionary *)object;
//    self.titleLabel.text = foursquarePlace[@"name"];
}

@end