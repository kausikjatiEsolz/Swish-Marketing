//
//  ViewReviews_ViewController.m
//  Promoter_List
//
//  Created by Kausik_Jati on 27/04/17.
//  Copyright © 2017 Kausik_Jati. All rights reserved.
//

#import "ViewReviews_ViewController.h"
#import "App_Header.h"

@interface ViewReviews_ViewController ()

@end

@implementation ViewReviews_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    App_Header *heade_view = [[App_Header alloc]init];
    
    [heade_view header_Class:@"VIEW REVIEWS" head_object:heade_view view:header_base controller:self Main_view:main_view ButtonImage:@"Back topbar"];
    
    text_font=[UIFont fontWithName:@"Helvetica" size:14];
    
    ary1=[[NSMutableArray alloc]initWithObjects:@"Anderson",@"Angela",@"Chloe",@"Carl",@"Colin",@"Frank",@"Isaac",@"Christian" ,nil];
    ary2=[[NSMutableArray alloc]initWithObjects:@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56" ,nil];
    ary3=[[NSMutableArray alloc]initWithObjects:@"3",@"2",@"1",@"5",@"3",@"2",@"4",@"2" ,nil];
    ary4=[[NSMutableArray alloc]initWithObjects:@"y. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to",@"at it has a more-or-less normal distribution of letters",@"tly with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",@" of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,",@"dskkhdkhaah cdkhcdkh",@"t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",@"hsaashg jdsahd jasdjkahs sadjl",@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handf" ,nil];
    
    api_array=[[[[NSMutableArray alloc]initWithObjects:ary1,ary2,ary3,ary4, nil]mutableCopy]mutableCopy];
    viewreview_table.allowsMultipleSelectionDuringEditing = NO;

    
    [_aboutme addTarget:self action:@selector(aboutme:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_byme addTarget:self action:@selector(byme:) forControlEvents:UIControlEventTouchUpInside];
    
    [_aboutme setTitleColor:[UIColor colorWithRed:(85/255.0) green:(166/255.0) blue:(199/255.0) alpha:1] forState:UIControlStateNormal];
    _aboutme.backgroundColor=[UIColor colorWithRed:(250/255.0) green:(250/255.0) blue:(250/255.0) alpha:1];
    
    
    btn_view.backgroundColor=[UIColor whiteColor];
    UIColor *color = [UIColor blackColor];
    btn_view.layer.shadowColor = [color CGColor];
    btn_view.layer.shadowRadius = 1.0f;
    btn_view.layer.shadowOpacity = 0.5;
    btn_view.layer.shadowOffset = CGSizeZero;
    btn_view.layer.masksToBounds = NO;

    
    [viewreview_table reloadData];
}






- (IBAction)aboutme:(id)sender {
    
//    UIButton *btn=(UIButton *)sender;
    btn_lbl1.frame=CGRectMake(0,btn_view.frame.size.height, _aboutme.frame.size.width-1, 1);
    
    [_aboutme setTitleColor:[UIColor colorWithRed:(85/255.0) green:(166/255.0) blue:(199/255.0) alpha:1] forState:UIControlStateNormal];
    
    [_byme setTitleColor:[UIColor colorWithRed:(151/255.0) green:(151/255.0) blue:(151/255.0) alpha:1] forState:UIControlStateNormal];
    
    _aboutme.backgroundColor=[UIColor colorWithRed:(250/255.0) green:(250/255.0) blue:(250/255.0) alpha:1];
    _byme.backgroundColor=[UIColor whiteColor];
    
    
    text_font=[UIFont fontWithName:@"Helvetica" size:14];
    
    ary1=[[NSMutableArray alloc]initWithObjects:@"Anderson",@"Angela",@"Chloe",@"Carl",@"Colin",@"Frank",@"Isaac",@"Christian" ,nil];
    ary2=[[NSMutableArray alloc]initWithObjects:@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56",@"31-08-1982 10:20:56" ,nil];
    ary3=[[NSMutableArray alloc]initWithObjects:@"3",@"2",@"1",@"5",@"3",@"2",@"4",@"2" ,nil];
    ary4=[[NSMutableArray alloc]initWithObjects:@"y. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to",@"at it has a more-or-less normal distribution of letters",@"tly with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",@" of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,",@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",@"jshadj",@"hsaashg jdsahd jasdjkahs sadjl",@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handf" ,nil];
    [api_array removeAllObjects];
    api_array=[[NSMutableArray alloc]initWithObjects:ary1,ary2,ary3,ary4, nil];
    aboutme_array=[[[NSMutableArray alloc]initWithObjects:api_array, nil]mutableCopy];
    viewreview_table.allowsMultipleSelectionDuringEditing = NO;
    [viewreview_table setContentOffset:CGPointZero animated:NO];
    

    [viewreview_table reloadData];
}







- (IBAction)byme:(id)sender {
    
//    UIButton *btn=(UIButton *)sender;
    
        btn_lbl1.frame=CGRectMake(_byme.frame.origin.x, btn_view.frame.size.height, _byme.frame.size.width, 1);


        [_byme setTitleColor:[UIColor colorWithRed:(85/255.0) green:(166/255.0) blue:(199/255.0) alpha:1] forState:UIControlStateNormal];
    
    [_aboutme setTitleColor:[UIColor colorWithRed:(151/255.0) green:(151/255.0) blue:(151/255.0) alpha:1] forState:UIControlStateNormal];
    
    
    _byme.backgroundColor=[UIColor colorWithRed:(250/255.0) green:(250/255.0) blue:(250/255.0) alpha:1];
    _aboutme.backgroundColor=[UIColor whiteColor];
    
    
    
    
    text_font=[UIFont fontWithName:@"Helvetica" size:14];
    
    ary1=[[NSMutableArray alloc]initWithObjects:@"sajdh",@"dksad",@"jkdsaknj",@"saj",@"sdh",@"lkasjdas",@"jkcxa",@"jnkasj" ,nil];
    ary2=[[NSMutableArray alloc]initWithObjects:@"24-07-1982 07:53:32",@"24-07-1982 07:53:32",@"24-07-1982 07:53:32",@"24-07-1982 07:53:32",@"24-07-1982 07:53:32",@"24-07-1982 07:53:32",@"24-07-1982 07:53:32",@"24-07-1982 07:53:32" ,nil];
    ary3=[[NSMutableArray alloc]initWithObjects:@"4",@"1",@"4",@"2",@"5",@"2",@"3",@"0" ,nil];
    ary4=[[NSMutableArray alloc]initWithObjects:@"Lorem ipsum dolor sit amet, mea ei omnis liber reprehendunt, elit aperiam ne sed, ea eum alia regione euripidis.",@"lkdacdascklcdlksa",@"An his mundi maiestatis, cu vix luptatum recteque. Maiorum denique sit ei. Ne erat populo phaedrum est. In quo repudiandae delicatissimi, malis corpora id eum. His at odio bonorum, sea te simul platonem reprehendunt, vix adhuc laboramus at. Ne sed purto noster, ex iriure delicata cum.",@" good",@"jdkhas dajk djk askjdsa dkjasna jkddjk djkd klajda",@"Eum ignota postulant posidonium at, ut mel alii nulla constituto. Eu his tamquam admodum complectitur, cibo nonumes copiosae no qui, nisl accusam mediocrem his cu. Sea id stet deserunt ullamcorper, usu paulo clita dicam cu, quidam quaeque mnesarchum an mea. Sed regione inciderint no, ad nec nisl tation corpora. Per no modus viris patrioque.",@"djdjna dajkdas kajk ajkaj ",@"knsd" ,nil];
    
    [api_array removeAllObjects];
    api_array=[[NSMutableArray alloc]initWithObjects:ary1,ary2,ary3,ary4 ,nil];
    byme_array=[[[NSMutableArray alloc]initWithObjects:api_array, nil]mutableCopy];
    
        viewreview_table.allowsMultipleSelectionDuringEditing = NO;
    [viewreview_table setContentOffset:CGPointZero animated:NO];
    [viewreview_table reloadData];
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"cellid";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size_=[self findHeightForText:[ary4 objectAtIndex:indexPath.row] havingWidth:viewreview_table.frame.size.width andFont:text_font];
    
    return size_.height+10+20+15+5+5+20+10;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ary4.count;
}


- (CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font
{
    CGSize size = CGSizeZero;
    if (text) {
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //stop reuse subviews
    
    for (UIView *obj  in cell.subviews)
    {
        [obj removeFromSuperview];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:(250/255.0) green:(250/255.0) blue:(250/255.0) alpha:1];
    
    //view
    
    UIView *view=[[UIView alloc]init];
    view.frame=CGRectMake(5,5, cell.frame.size.width-10, cell.frame.size.height-10);
    
    UIColor *color = [UIColor blackColor];
    view.layer.shadowColor = [color CGColor];
    view.layer.shadowRadius = 1.0f;
    view.layer.shadowOpacity = 0.5;
    view.layer.shadowOffset = CGSizeZero;
    view.layer.masksToBounds = NO;
    
    [cell addSubview:view];
    
    
    
    //label
    
    UILabel *lbl1=[[UILabel alloc]init];
    lbl1.frame=CGRectMake( 10,  8, view.frame.size.width*0.48, 20);
    
    [view addSubview:lbl1];
    
    
    
    lbl1.text=[ary1 objectAtIndex:indexPath.row];
    
    UILabel *lbl2=[[UILabel alloc]init];
    lbl2.frame=CGRectMake(lbl1.frame.origin.x + lbl1.frame.size.width + 10,5, view.frame.size.width*0.35, 20);
    [view addSubview:lbl2];
    
    lbl2.textAlignment=NSTextAlignmentRight;
    
    [lbl2 setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    
    lbl2.text=[ary2 objectAtIndex:indexPath.row];
    
    //image & Star rating
    
    
    UIImageView *img1 =[[UIImageView alloc]init];
    img1.frame=CGRectMake(10, lbl1.frame.origin.y + lbl1.frame.size.height +5, 15,15);
    [view addSubview:img1];
    
    UIImageView *img2 =[[UIImageView alloc]init];
    img2.frame=CGRectMake(img1.frame.origin.x + img1.frame.size.width +3, lbl1.frame.origin.y + lbl1.frame.size.height +5, 15,15);
    [view addSubview:img2];
    
    UIImageView *img3 =[[UIImageView alloc]init];
    img3.frame=CGRectMake(img2.frame.origin.x + img2.frame.size.width +3,lbl1.frame.origin.y + lbl1.frame.size.height +5,15,15);
    [view addSubview:img3];
    
    UIImageView *img4 =[[UIImageView alloc]init];
    img4.frame=CGRectMake(img3.frame.origin.x + img3.frame.size.width +3,lbl1.frame.origin.y + lbl1.frame.size.height +5,15,15);
    [view addSubview:img4];
    
    UIImageView *img5 =[[UIImageView alloc]init];
    img5.frame=CGRectMake(img4.frame.origin.x + img4.frame.size.width +3,lbl1.frame.origin.y + lbl1.frame.size.height +5,15,15);
    [view addSubview:img5];
    
    
    
    if ([[ary3 objectAtIndex:indexPath.row]isEqualToString:@"1"] ) {
        [img1 setImage:[UIImage imageNamed:@ "star1"]];
        [img2 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img3 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img4 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img5 setImage:[UIImage imageNamed:@ "Star 3"]];
    }
    
    else  if ([[ary3 objectAtIndex:indexPath.row]isEqualToString:@"2"] ) {
        [img1 setImage:[UIImage imageNamed:@ "star1"]];
        [img2 setImage:[UIImage imageNamed:@ "star1"]];
        [img3 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img4 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img5 setImage:[UIImage imageNamed:@ "Star 3"]];
    }
    
    else  if ([[ary3 objectAtIndex:indexPath.row]isEqualToString:@"3"]) {
        [img1 setImage:[UIImage imageNamed:@ "star1"]];
        [img2 setImage:[UIImage imageNamed:@ "star1"]];
        [img3 setImage:[UIImage imageNamed:@ "star1"]];
        [img4 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img5 setImage:[UIImage imageNamed:@ "Star 3"]];
    }
    else  if ([[ary3 objectAtIndex:indexPath.row]isEqualToString:@"4"] ) {
        [img1 setImage:[UIImage imageNamed:@ "star1"]];
        [img2 setImage:[UIImage imageNamed:@ "star1"]];
        [img3 setImage:[UIImage imageNamed:@ "star1"]];
        [img4 setImage:[UIImage imageNamed:@ "star1"]];
        [img5 setImage:[UIImage imageNamed:@ "Star 3"]];
    }
    else  if ([[ary3 objectAtIndex:indexPath.row]isEqualToString:@"5"]) {
        [img1 setImage:[UIImage imageNamed:@ "star1"]];
        [img2 setImage:[UIImage imageNamed:@ "star1"]];
        [img3 setImage:[UIImage imageNamed:@ "star1"]];
        [img4 setImage:[UIImage imageNamed:@ "star1"]];
        [img5 setImage:[UIImage imageNamed:@ "star1"]];
    }
    else
    {
        [img1 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img2 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img3 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img4 setImage:[UIImage imageNamed:@ "Star 3"]];
        [img5 setImage:[UIImage imageNamed:@ "Star 3"]];
    }
    
    //label
    
    
    UILabel *lbl3=[[UILabel alloc]init];
    lbl3.frame=CGRectMake(10,img1.frame.origin.y + img1.frame.size.height +10, cell.frame.size.width-5-20,[self findHeightForText:[ary4 objectAtIndex:indexPath.row] havingWidth:viewreview_table.frame.size.width andFont:text_font].height);
    
    lbl3.font=[UIFont fontWithName:@"Helvetica" size:13.2f];
    
    
    [view addSubview:lbl3];
    
    lbl3.numberOfLines = 999;
    lbl3.lineBreakMode= NSLineBreakByWordWrapping;
    
    lbl3.text=[ary4 objectAtIndex:indexPath.row];
    
    
    view.backgroundColor = [UIColor whiteColor];
    // lbl1.backgroundColor =[UIColor blueColor];
    // lbl2.backgroundColor =[UIColor blueColor];
    // lbl3.backgroundColor =[UIColor blackColor];
    
    
    
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
