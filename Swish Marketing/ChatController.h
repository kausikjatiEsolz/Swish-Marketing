//
//  ChatController.h
//  Swish Marketing
//
//  Created by Rahul Singha Roy on 10/04/17.
//  Copyright © 2017 Kausik Jati. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChatController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UIView *header_base;
    __weak IBOutlet UIView *main_view;
    __weak IBOutlet UITableView *chatTable;
    __weak IBOutlet UIView *down_chat_view;
    __weak IBOutlet UITextView *text_view;
    
}
- (IBAction)send_msg:(UIButton *)sender;

@end
