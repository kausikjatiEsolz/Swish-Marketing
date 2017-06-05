//
//  ChatController.m
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 10/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//




#import "ChatController.h"
#import "App_Header.h"
#import <QuartzCore/QuartzCore.h>

@interface ChatController ()<UITextViewDelegate,UIGestureRecognizerDelegate>
{
    NSMutableArray *chat_data;
    UIFont *font_name;
    
    float keybord_height;
    
    int noof_enter;
    
    NSMutableArray *new_Array;
    
    CGRect previousRect;
    
    
    NSMutableArray *Selecected_Index;
    
    
    CGRect down_viewFrame,textviewFrame;
    
}

@end

@implementation ChatController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    Selecected_Index = [NSMutableArray new];
    
     previousRect = CGRectZero;
    App_Header *heade_view = [[App_Header alloc]init];
    
    down_viewFrame = down_chat_view.frame;
    textviewFrame = text_view.frame;
    
    
    
    [heade_view header_Class:@"PROMOTER NAME" head_object:heade_view view:header_base controller:self Main_view:main_view ButtonImage:@"Back topbar"];
    
    font_name = [UIFont fontWithName:@"Helvetica" size:15];
    
       
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
    
    text_view.clipsToBounds = YES ;
    text_view.layer.cornerRadius = 5 ;
    text_view.delegate = self;
    
    
    chatTable.allowsSelection = NO;
    
   
    
    
    chat_data = [[NSMutableArray alloc]initWithObjects:
  @{@"img":[UIImage imageNamed:@"2-ios-traning"],@"user":@"S" , @"chat":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."},
  @{@"user":@"R", @"chat":@"hi",@"img":[UIImage imageNamed:@"Gender Neutral User-104"]},
  @{@"user":@"S" , @"chat":@"Lorem Ipsum is simply dummy text of the printing and typesetting industry.",@"img":[UIImage imageNamed:@"twitter-logo-silhouette"]},
  @{@"user":@"R" , @"chat":@"It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."},nil];
    
    
    chatTable.delegate = self;
    chatTable.dataSource = self;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return chat_data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize height = [self findHeightForText:[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] havingWidth:tableView.frame.size.width/1.5 andFont:font_name];
    
    UIImage *image = [[chat_data objectAtIndex:indexPath.row] valueForKey:@"img"];
    
  
    
    
     if (image != nil && [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] length]>0)
    {
        
            return height.height+50 +100;
            
        
    }
    
     else if (image != nil && [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] length]==0)
     {
         return 100;
     }
    
    else
    {
    
    if (height.height<30)
    {
        return height.height+50 ;
    }
    else
    {
    return height.height+50;
        
    }
        
    }
    
    return 0;
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if(UIGestureRecognizerStateBegan == gestureRecognizer.state)
    {
    
    if (![Selecected_Index containsObject:[NSString stringWithFormat:@"%lu",gestureRecognizer.view.tag]])
    {
        [Selecected_Index addObject:[NSString stringWithFormat:@"%lu",gestureRecognizer.view.tag]];
    }
    else
    {
        [Selecected_Index removeObject:[NSString stringWithFormat:@"%lu",gestureRecognizer.view.tag]];
    }
    
    
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0,0, 30, 30)];
        
        btn.backgroundColor = [UIColor redColor];
        
        [gestureRecognizer.view addSubview: btn];
    
//    [chatTable beginUpdates];
//    
//    [chatTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSString stringWithFormat:@"%lu",gestureRecognizer.view.tag], nil] withRowAnimation:UITableViewRowAnimationNone];
//    [chatTable endUpdates];
    
    
    
    [chatTable reloadData];
        
        
        
        for (UILabel *lbl  in gestureRecognizer.view.subviews)
        {
            if ([lbl isKindOfClass:[UILabel class]])
            {
                text_view.text = lbl.text;
                
                break;
            }
        }
        
    }
    
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    
    if (action == @selector(paste:))
    {
        return true;
    }
    
    return false;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"CellID";
    
    UITableViewCell *myCell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(myCell==nil)
    {
        
        myCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    
    
    return myCell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
   

    
    
    for (UIView *view in cell.subviews)
    {
        [view removeFromSuperview];
    }
    
    
    UIView *view_chat = [[UIView alloc]init];
    
    UILabel *chrt_show_lbl = [[UILabel alloc]init];
    chrt_show_lbl.font = font_name;
    chrt_show_lbl.numberOfLines = 999;
    
    
    
    
    UILongPressGestureRecognizer *lpgr  = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.delegate = self;
    lpgr.delaysTouchesBegan = YES;
    [view_chat addGestureRecognizer:lpgr];
    
    
    view_chat.tag = indexPath.row;
    
    
     if ([Selecected_Index containsObject:[NSString stringWithFormat:@"%lu",indexPath.row]])
     {
         cell.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:.3f];
         UIView *bgColorView = [[[UIView alloc] init]initWithFrame:CGRectMake(0, 5, cell.frame.size.width, cell.frame.size.height-10)];
         bgColorView.backgroundColor = [UIColor clearColor];
         [cell setSelectedBackgroundView:bgColorView];
        
     }
    else
    {
        cell.backgroundColor = [UIColor clearColor];
    }
    
    
    
    // view_chat.frame = CGRectMake(tableView.frame.size.width, 10, tableView.frame.size.width/1.3, cell.frame.size.height-20);
    
    chrt_show_lbl.text = [[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"];
    
    
    UIImageView *img = [[UIImageView alloc]init];
   // UIImageView *
    
    
    if ([[[chat_data objectAtIndex:indexPath.row]valueForKey:@"user"]isEqualToString:@"S"])
    {
        
        
        UIImage *image = [[chat_data objectAtIndex:indexPath.row] valueForKey:@"img"];
        
         view_chat.frame = CGRectMake(tableView.frame.size.width-tableView.frame.size.width/1.3 - 25, 10, tableView.frame.size.width/1.3, cell.frame.size.height-20);
        
        
        if (image != nil && [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] length]>0)
        {
            float widthIs =  [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] boundingRectWithSize:chrt_show_lbl.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:chrt_show_lbl.font } context:nil] .size.width;
            
            if (widthIs >= view_chat.frame.size.width-30)
            {
                chrt_show_lbl.frame = CGRectMake(15 , 15, view_chat.frame.size.width-30, [self findHeightForText:chrt_show_lbl.text havingWidth:view_chat.frame.size.width-30 andFont:chrt_show_lbl.font].height+10);
                
                img.hidden = NO;
                view_chat.layer.cornerRadius = 15;
                
            }
            else
            {
                view_chat.frame = CGRectMake(tableView.frame.size.width-widthIs-30 - 25, 10, widthIs+30, cell.frame.size.height-20);
                
                chrt_show_lbl.frame = CGRectMake(15 , 15, view_chat.frame.size.width-30, view_chat.frame.size.height-30);
                
                img.hidden =YES;
                view_chat.layer.cornerRadius = 20;
            }
        }
        
        else if (image != nil && [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] length]==0)
        {
           
            
        }
        else
        {
            float widthIs =  [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] boundingRectWithSize:chrt_show_lbl.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:chrt_show_lbl.font } context:nil] .size.width;
            
            if (widthIs >= view_chat.frame.size.width-30)
            {
                chrt_show_lbl.frame = CGRectMake(15 , 15, view_chat.frame.size.width-30, view_chat.frame.size.height-30);
                
                img.hidden = NO;
                view_chat.layer.cornerRadius = 15;
                
            }
            else
            {
                view_chat.frame = CGRectMake(tableView.frame.size.width-widthIs-30 - 25, 10, widthIs+30, cell.frame.size.height-20);
                
                chrt_show_lbl.frame = CGRectMake(15 , 15, view_chat.frame.size.width-30, view_chat.frame.size.height-30);
                
                img.hidden =YES;
                view_chat.layer.cornerRadius = 20;
            }
            
            
        }
        
       
        
        
        
        
        
        
        
        view_chat.backgroundColor = [UIColor colorWithRed:85.0/255.0f green:166.0/255.0f blue:199.0/255.0f alpha:1.0];
      chrt_show_lbl.textColor = [UIColor whiteColor];
        
        img.frame = CGRectMake(tableView.frame.size.width - 25-22, view_chat.frame.size.height-23, 30, 30);
        
        img.image = [UIImage imageNamed:@"sender_img"];
        
        
    }
    else
    {
         view_chat.frame = CGRectMake(25, 10, tableView.frame.size.width/1.3, cell.frame.size.height-20);
        
        
        
          float widthIs =  [[[chat_data objectAtIndex:indexPath.row] valueForKey:@"chat"] boundingRectWithSize:chrt_show_lbl.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:chrt_show_lbl.font } context:nil] .size.width;
        
        if (widthIs >= view_chat.frame.size.width-30)
        {
             chrt_show_lbl.frame = CGRectMake(15, 15, view_chat.frame.size.width-30, view_chat.frame.size.height-30);
            img.hidden = NO;
            
             view_chat.layer.cornerRadius = 15;
        }
        else
        {
             view_chat.frame = CGRectMake(25, 10, widthIs+30, cell.frame.size.height-20);
            
             chrt_show_lbl.frame = CGRectMake(15, 15, view_chat.frame.size.width-30, view_chat.frame.size.height-30);
            
            img.hidden =YES;
             view_chat.layer.cornerRadius = 20;
        }
        
        

        
       view_chat.backgroundColor = [UIColor colorWithRed:250.0/255.0f green:250.00/255.0f blue:250.0/255.0f alpha:1.0];
        chrt_show_lbl.textColor = [UIColor darkGrayColor];
        
        
        img.frame = CGRectMake(18, view_chat.frame.size.height-23, 30, 30);
        
        img.image = [UIImage imageNamed:@"reciver"];
        
        //chrt_show_lbl.backgroundColor = [UIColor redColor];
        
    }
    
    view_chat.clipsToBounds = YES;
   
    
    [cell addSubview:img];
    [cell addSubview:view_chat];
    
    
    [view_chat addSubview:chrt_show_lbl];
    
    
    //NSIndexPath *indexPath_ = [NSIndexPath indexPathForItem:indexPath.row inSection:0];
    
    

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


- (CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font {
    CGSize size = CGSizeZero;
    if (text) {
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    if (keybord_height==0)
    {
        //  NSDictionary* userInfo = [n userInfo];
        
        // get the size of the keyboard
        CGSize keyboardSize = [[[n userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        
        //Given size may not account for screen rotation
        keybord_height= MIN(keyboardSize.height,keyboardSize.width);
        
        
        [UIView animateWithDuration:.3f animations:^{
            
            
            down_chat_view.frame = CGRectMake(0, main_view.frame.size.height-down_chat_view.frame.size.height-keybord_height, self.view.frame.size.width, down_chat_view.frame.size.height);
            
            
          chatTable.frame = CGRectMake(chatTable.frame.origin.x, chatTable.frame.origin.y, chatTable.frame.size.width, main_view.frame.size.height-down_chat_view.frame.size.height-keybord_height-20 - header_base.frame.size.height);
            
        }];
        //scroll.contentSize =CGSizeMake(scroll.contentSize.width, keybord_height*2.5);
        
        
        
    }
    
    
    // scroll.contentSize = CGSizeMake(0, scroll.contentSize.height);
    
    
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
//    if ([text isEqualToString:@"\n"])
//    {
//        noof_enter = noof_enter+1;
//        
//        
//        [textView resignFirstResponder];
//        
//        if (noof_enter<=5)
//        {
//         
//            
//            
//            
//           // [UIView animateWithDuration:.3f animations:^{
//                
//                
////                down_chat_view.frame = CGRectMake(0, main_view.frame.size.height-down_chat_view.frame.size.height-keybord_height, self.view.frame.size.width, textView.contentSize.height+10);
////                
////                 text_view.frame = CGRectMake(text_view.frame.origin.x, 8, text_view.frame.size.width, down_chat_view.frame.size.height-16);
////            
////            
////            NSLog(@"height--->%f",down_chat_view.frame.size.height);
//            
//            
//          //  }];
//
//            
//            
//        }
//    }
//    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    
    UITextPosition* pos = textView.endOfDocument;//explore others like beginningOfDocument if you want to customize the behaviour
    CGRect currentRect = [textView caretRectForPosition:pos];
    
    if (currentRect.origin.y > previousRect.origin.y){
        //new line reached, write your code
        
        noof_enter = noof_enter+1;
        
        if (noof_enter<=3)
        {
            if (textviewFrame.size.height<textView.contentSize.height)
            {
                
                
                down_chat_view.frame = CGRectMake(0, main_view.frame.size.height-down_chat_view.frame.size.height-keybord_height-noof_enter*3, self.view.frame.size.width, textView.contentSize.height+10+noof_enter*2);
                
                
                
                text_view.frame = CGRectMake(text_view.frame.origin.x, 8, text_view.frame.size.width, down_chat_view.frame.size.height-16);
                
                
                  chatTable.frame = CGRectMake(chatTable.frame.origin.x, chatTable.frame.origin.y, chatTable.frame.size.width, main_view.frame.size.height-down_chat_view.frame.size.height-keybord_height-20 - header_base.frame.size.height+noof_enter*2);
                
                
            }
            
           
        }
        
        NSLog(@"new---line");
        
    }
    previousRect = currentRect;
    
}

- (void)keyboardWillHide:(NSNotification *)n
{
    
    
    //    scroll.contentSize =CGSizeMake(scroll_size, 0);
    //    [scroll setContentOffset:CGPointMake(scroll.contentOffset.x, 0) animated:YES];
    
    [UIView animateWithDuration:.3f animations:^{
        
        
        down_chat_view.frame = down_viewFrame;
        text_view.frame = textviewFrame;
        
          chatTable.frame = CGRectMake(chatTable.frame.origin.x, chatTable.frame.origin.y, chatTable.frame.size.width, main_view.frame.size.height-down_chat_view.frame.size.height-header_base.frame.size.height-20);
        
        
       // second_Step.frame = CGRectMake(0, first_view.frame.origin.y, self.view.frame.size.width, second_Step.frame.size.height);
        
    }];
    
    keybord_height=0;
    
}


//-(CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font
//{
//    CGFloat result = font.pointSize + 4;
//    if (text)
//    {
//        CGSize textSize = { widthValue, CGFLOAT_MAX };       //Width and height of text area
//        CGSize size;
//        
//            //iOS 7
//            CGRect frame = [text boundingRectWithSize:textSize
//                                              options:NSStringDrawingUsesLineFragmentOrigin
//                                           attributes:@{ NSFontAttributeName:font }
//                                              context:nil];
//            size = CGSizeMake(frame.size.width, frame.size.height+1);
//        
//        result = MAX(size.height, result); //At least one row
//    }
//    return result;
//}








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)send_msg:(UIButton *)sender {
    
    
   //[chatTable setContentOffset:CGPointMake(0, chatTable.contentSize.height-chatTable.frame.size.height) animated:YES];
    
   
    
    down_chat_view.frame = CGRectMake(0, main_view.frame.size.height-down_viewFrame.size.height-keybord_height, self.view.frame.size.width, down_viewFrame.size.height);
    
    text_view.frame = textviewFrame;
    
    
    
    chatTable.frame = CGRectMake(chatTable.frame.origin.x, chatTable.frame.origin.y, chatTable.frame.size.width, main_view.frame.size.height-down_chat_view.frame.size.height-keybord_height-20 - header_base.frame.size.height);
    
    
    
    NSString *letters = @"SR";
    NSInteger index = arc4random_uniform([letters length]);
    NSString *randomLetter = [letters substringWithRange:NSMakeRange(index, 1)];
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    
    [dic setObject:randomLetter forKey:@"user"];
    [dic setObject:text_view.text forKey:@"chat"];
    
    
    
    
    
    
    NSInteger pos=[chat_data count];
    
    [chat_data addObject:dic];
    
    [chatTable beginUpdates];
    
    
        NSArray *insert=[NSArray arrayWithObject:[NSIndexPath indexPathForRow:pos inSection:0]];
    
    if ([randomLetter isEqualToString:@"S"])
    {
         [chatTable insertRowsAtIndexPaths:insert withRowAnimation:UITableViewRowAnimationRight];
    }
    else
    {
        [chatTable insertRowsAtIndexPaths:insert withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    
        
    
    [chatTable endUpdates];
    
    
    
    [chatTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:chat_data.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
    noof_enter=0;
    
    text_view.text = @"";
    
}

-(NSString *) randomStringWithLength: (int) len {
    
    NSString *letters = @"SR";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
     
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}
@end
