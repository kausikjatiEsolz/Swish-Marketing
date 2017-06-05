//
//  Crad_detailsController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 02/05/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Crad_detailsController.h"
#import "App_Header.h"

@interface Crad_detailsController ()

@end

@implementation Crad_detailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"SETTINGS" head_object:heade_view view:header_base controller:self Main_view:main_view ButtonImage:@"Back topbar"];
    
    lbl1_array=[[NSMutableArray alloc]initWithObjects:@"JOHN DOE",@"JOHN DOE",@"JOHN DOE",@"JOHN DOE", nil];
    lbl2_array=[[NSMutableArray alloc]initWithObjects:@"XXXX XXXX XXXX 8765",@"XXXX XXXX XXXX 9198",@"XXXX XXXX XXXX 9876",@"XXXX XXXX XXXX 7832", nil];
    img_array=[[NSMutableArray alloc]initWithObjects:@"mastercard",@"visa",@"visa",@"maestro", nil];
    main_array=[[NSMutableArray alloc]init];
    
    [settings_table reloadData];
    
    
    //settings_table.frame = CGRectMake(0, settings_table.frame.origin.y, main_view.frame.size.width, settings_table.)
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _headerview.frame.size.height;
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    return _headerview;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _footerview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return _footerview.frame.size.height;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return lbl1_array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CELL=[settings_table dequeueReusableCellWithIdentifier:@"card"forIndexPath:indexPath];
    CELL.name_lbl.text=[lbl1_array objectAtIndex:indexPath.row];
    CELL.cardno_lbl.text=[lbl2_array objectAtIndex:indexPath.row];
    CELL.cardtype_img.image = [UIImage imageNamed:[img_array objectAtIndex:indexPath.row]];
    
    
    CELL.backgroundColor = [UIColor clearColor];
    
    CELL.cell_view.backgroundColor=[UIColor whiteColor];
    UIColor *color = [UIColor blackColor];
    CELL.cell_view.layer.shadowColor = [color CGColor];
    CELL.cell_view.layer.shadowRadius = 1.0f;
    CELL.cell_view.layer.shadowOpacity = 0.5;
    CELL.cell_view.layer.shadowOffset = CGSizeZero;
    CELL.cell_view.layer.cornerRadius = 10;
    CELL.cell_view.layer.masksToBounds = NO;
    
    
    
    CELL.select_btn.tag=[indexPath row];
    [CELL.select_btn setImage:[UIImage imageNamed:@"Oval 3 Copy 2"] forState:UIControlStateNormal];
    [CELL.select_btn addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([main_array containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]) {
        
        [CELL.select_btn setImage:[UIImage imageNamed:@"Tick"] forState:UIControlStateNormal];
        CELL.cell_view.backgroundColor=[UIColor whiteColor];
        UIColor *color = [UIColor colorWithRed:(85/255.0) green:(166/255.0) blue:(199/255.0) alpha:1];
        CELL.cell_view.layer.shadowColor = [color CGColor];
        CELL.cell_view.layer.shadowRadius = 3.0f;
        CELL.cell_view.layer.shadowOpacity = 0.9;
        CELL.cell_view.layer.shadowOffset = CGSizeZero;
        CELL.cell_view.layer.cornerRadius = 10;
        CELL.cell_view.layer.masksToBounds = NO;
    }
    
    
    return CELL;
    
    
}

-(IBAction)select:(id)sender{
    
    
    
    UIButton *btn = (UIButton *)sender;
    
    
    
    int selectedIndex=[[main_array firstObject] intValue];
    [main_array removeAllObjects];
    [main_array addObject:[NSString stringWithFormat:@"%d",btn.tag]];
    
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath,indexPath1, nil];
    
    
    [settings_table reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
