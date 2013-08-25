//
//  UIComboBox.h
//  UIComboBox
//
//  Created by 斌 on 13-8-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIComboBox : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) NSArray *arData;
@property (nonatomic,assign) CGRect rectBtn;
@property (nonatomic,assign) int cellFontSize,cellHeight;

- (void)setBtnBackgroundImage:(UIImage *)image forState:(UIControlState)state;
- (NSString*)getData;
@end
