//
//  UIComboBox.m
//  UIComboBox
//
//  Created by 斌 on 13-8-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "UIComboBox.h"

@implementation UIComboBox
@synthesize rectBtn;
@synthesize arData;
@synthesize cellFontSize,cellHeight;

static UIButton *btn;
static UITableView *tbl;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        arData = [[NSArray alloc]initWithObjects:@"1.test",@"2.test",@"3.test", nil];
        rectBtn = CGRectMake(0, 0, self.frame.size.width, 35);
        self.backgroundColor =[UIColor clearColor];
        cellFontSize = 15;
        cellHeight = 30;
        btn = [[UIButton alloc]init];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    btn.frame=rectBtn;
    [btn setTitle:[arData objectAtIndex:0] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    btn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    CGRect rectTbl=CGRectMake(0, rectBtn.size.height, rectBtn.size.width, self.frame.size.height - rectBtn.size.height);
    tbl =[[UITableView alloc]initWithFrame:rectTbl style:UITableViewStylePlain];
    tbl.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbl.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    tbl.dataSource = self;
    tbl.delegate = self;
    [self addSubview:tbl];
    
    tbl.hidden = YES;
    
}

- (void)setBtnBackgroundImage:(UIImage *)image forState:(UIControlState)state{
    
        [btn setBackgroundImage:image forState:state];
}

- (void)btnAction:(UIButton*)sender{
    sender.selected =! sender.selected;
    
    tbl.hidden =! sender.selected;
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [arData objectAtIndex:[indexPath row]];
    cell.textLabel.font=[UIFont systemFontOfSize:cellFontSize];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [btn setTitle:[arData objectAtIndex:[indexPath row]] forState:UIControlStateNormal];
    btn.selected =! btn.selected;
    tbl.hidden =! btn.selected;
}

@end
