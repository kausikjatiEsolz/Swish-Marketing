//
//  Left_Menu.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 05/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import "Left_Menu.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation Left_Menu
@synthesize side_menutable,name_lbl,side_menuDelegate,business,promoter,table_array,userType_lbl;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    
    
    self=[super initWithFrame:frame];
    
    if (self)
    {
        self=[[[NSBundle mainBundle] loadNibNamed:@"Left_Menu" owner:self options:nil]objectAtIndex:0];
    }
    
    user_info = [NSUserDefaults standardUserDefaults];
    side_menutable.delegate = self;
    side_menutable.dataSource = self;
    
    [side_menutable setSeparatorColor:[UIColor clearColor]];
    
    
    business = [[NSArray alloc]initWithObjects:@{@"name":@"DASHBOARD" , @"image":@"ic_dashboard"},@{@"name":@"NEW CAMPAING" , @"image":@"New Campaign"},@{@"name":@"ACTIVE CAMPAIGNS" , @"image":@"suitcase"},@{@"name":@"PAST CAMPAIGNS",@"image":@"Past campaign"},@{@"name":@"BECOME A PROMOTER",@"image":@"Toggle On-56"},@{@"name":@"REFER A FRIEND",@"image":@"paper-plane"},@{@"name":@"VIEW REVIEWS",@"image":@"star"},@{@"name":@"SETTINGS",@"image":@"settings"},@{@"name":@"HELP",@"image":@"Help Filled-56"},@{@"name":@"LOGOUT",@"image":@"Log out"}, nil];
    
      promoter = [[NSArray alloc]initWithObjects:@{@"name":@"DASHBOARD" , @"image":@"ic_dashboard"},@{@"name":@"ACTIVE CAMPAIGNS" , @"image":@"suitcase"},@{@"name":@"PAST CAMPAIGNS",@"image":@"Past campaign"},@{@"name":@"SWITCH TO BUSINESS",@"image":@"Toggle On-56"},@{@"name":@"REFER A FRIEND",@"image":@"paper-plane"},@{@"name":@"VIEW REVIEWS",@"image":@"star"},
          @{@"name":@"SETTINGS",@"image":@"settings"},@{@"name":@"HELP",@"image":@"Help Filled-56"},@{@"name":@"",@"image":@""},@{@"name":@"LOGOUT",@"image":@"Log out"}, nil];
    
    
    
    
    
    self.user_Image.clipsToBounds = YES;
    self.user_Image.layer.cornerRadius = self.user_Image.frame.size.width/2;
    self.user_Image.frame = CGRectMake(name_lbl.frame.origin.x - self.user_Image.frame.size.width -15, self.user_Image.frame.origin.y, self.user_Image.frame.size.width, self.user_Image.frame.size.height);
    
    if ([[user_info valueForKey:@"userType"] isEqualToString:@"P"])
    {
        table_array = promoter;
        userType_lbl.text = @"PROMOTER";
        
        [self.user_Image sd_setImageWithURL:[NSURL URLWithString:[user_info valueForKey:@"user_promoter_image"]] placeholderImage:[UIImage imageNamed:@"Noimage 1"]];
        
        
    }
    else
    {
        table_array = business;
        userType_lbl.text = @"BUSINESS";
        
         [self.user_Image sd_setImageWithURL:[NSURL URLWithString:[user_info valueForKey:@"user_business_image"]] placeholderImage:[UIImage imageNamed:@"Noimage 1"]];
    }
    
    
    
    
   name_lbl.text = [user_info valueForKey:@"user_name"];
    
    
    
    
    return self;
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"CellID";
    
    UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(myCell==nil)
    {
        
        myCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    
    //NSLog(@"business-->%@",business);

    
    return myCell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)myCell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    for (id obj  in myCell.subviews)
    {
        [obj removeFromSuperview];
    }

    
    if ([[[table_array objectAtIndex:indexPath.row] valueForKey:@"name"] length]>0)
    {
        
    
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(tableView.frame.size.width/8, myCell.frame.size.height/2 - 20/2, 20, 20)];
    
    imageview.image = [UIImage imageNamed:[[table_array objectAtIndex:indexPath.row] valueForKey:@"image"]];
    
    [myCell addSubview:imageview];
    
    
    
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(imageview.frame.origin.x+imageview.frame.size.width + 15, 0, myCell.frame.size.width-(imageview.frame.origin.x+imageview.frame.size.width+15), myCell.frame.size.height)];
    
    name.backgroundColor = [UIColor clearColor];
    name.textColor = name_lbl.textColor;
        name.font = [UIFont fontWithName:@"Helvetica" size:14];
    name.text = [[table_array objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    [myCell addSubview:name];
    
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:(54/255.0) green:(123/255.0) blue:(153/255.0) alpha:1.0];
    [myCell setSelectedBackgroundView:bgColorView];
    
    
    
    myCell.backgroundColor = side_menutable.backgroundColor;
    
    
    }
    
    else
    {
        myCell.backgroundColor = side_menutable.backgroundColor;
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor clearColor];
        [myCell setSelectedBackgroundView:bgColorView];
      
        for (id obj  in myCell.subviews)
        {
            [obj removeFromSuperview];
        }
    }
    
    

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return table_array.count ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height/10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[table_array objectAtIndex:indexPath.row]valueForKey:@"name"] length]>0)
    {
        [side_menuDelegate left_menu:(int)indexPath.row];

    }
    
   
}


@end
