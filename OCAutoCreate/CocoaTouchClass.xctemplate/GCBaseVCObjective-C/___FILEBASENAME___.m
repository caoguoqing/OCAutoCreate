//  ___FILEBASENAMEASIDENTIFIER___.m
//  ___TARGETNAME__
//
// Created by ___AUTHOR___ ___CREATEDATE___
// Copyright 2018 ___AUTHOR___. All rights reserved.
//
//                .-~~~~~~~~~-._       _.-~~~~~~~~~-.
//            __.'              ~.   .~              `.__
//          .'//                  \./                  \\`.
//        .'//                     |                     \\`.
//      .'// .-~"""""""~~~~-._     |     _,-~~~~"""""""~-. \\`.
//    .'//.-"                 `-.  |  .-'                 "-.\\`.
//  .'//______.============-..   \ | /   ..-============.______\\`.
//.'______________________________\|/______________________________`.
//
//

#import "___FILEBASENAME___.h"
#import "Head.h"
@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___
#pragma mark - getter and setter
-(___MOUDELNAME___ViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [___MOUDELNAME___ViewModel new];
    }
    return _viewModel;
}
#pragma mark - event
#pragma mark - method
-(void)initilization
{
    self.navigationItem.title = @"";
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationController.navigationBar.shadowImage = [[UIImage new]rt_darkenWithLevel:0.3f];
    [self setNavgationTheme:1];
    [self.view addSubview:self.baseTable];
    if (@available(iOS 11.0, *)) {
        self.baseTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.baseTable.contentInset = UIEdgeInsetsMake([self topShelterHeight], 0, [self bottomShelterHeight], 0);
    [self.baseTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.baseTable setSeparatorColor: Main_Color_BG];
    [self.baseTable setBackgroundColor:Main_Color_BG];
    [self.baseTable setTintColor:Main_Color_BG];
    @WeakSelf;
    self.baseTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfp reloadData];
    }];
    [self viewModelBand];
    [self reloadData];
}
-(void)viewModelBand
{
    @WeakSelf;
    GCBaseObservationModel *observation = [GCBaseObservationModel new];
    observation.observation = self.viewModel;
    observation.keyPath = @"datas";
    observation.handler = ^(NSString *keyPath) {
        [selfp reloadView];
    };
    [self registObservation:observation];
}
-(void)reloadData
{
    [self.viewModel requestData];
}
-(void)reloadView
{
    [self.baseTable reloadData];
}
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initilization];
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
#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return WFCGFloatY(45);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat height = cell.height;
    return height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end


/*
 11111111111111111111111111111111111111001111111111111111111111111
 11111111111111111111111111111111111100011111111111111111111111111
 11111111111111111111111111111111100001111111111111111111111111111
 11111111111111111111111111111110000111111111111111111111111111111
 11111111111111111111111111111000000111111111111111111111111111111
 11111111111111111111111111100000011110001100000000000000011111111
 11111111111111111100000000000000000000000000000000011111111111111
 11111111111111110111000000000000000000000000000011111111111111111
 11111111111111111111111000000000000000000000000000000000111111111
 11111111111111111110000000000000000000000000000000111111111111111
 11111111111111111100011100000000000000000000000000000111111111111
 11111111111111100000110000000000011000000000000000000011111111111
 11111111111111000000000000000100111100000000000001100000111111111
 11111111110000000000000000001110111110000000000000111000011111111
 11111111000000000000000000011111111100000000000000011110001111111
 11111110000000011111111111111111111100000000000000001111100111111
 11111111000001111111111111111111110000000000000000001111111111111
 11111111110111111111111111111100000000000000000000000111111111111
 11111111111111110000000000000000000000000000000000000111111111111
 11111111111111111100000000000000000000000000001100000111111111111
 11111111111111000000000000000000000000000000111100000111111111111
 11111111111000000000000000000000000000000001111110000111111111111
 11111111100000000000000000000000000000001111111110000111111111111
 11111110000000000000000000000000000000111111111110000111111111111
 11111100000000000000000001110000001111111111111110001111111111111
 11111000000000000000011111111111111111111111111110011111111111111
 11110000000000000001111111111111111100111111111111111111111111111
 11100000000000000011111111111111111111100001111111111111111111111
 11100000000001000111111111111111111111111000001111111111111111111
 11000000000001100111111111111111111111111110000000111111111111111
 11000000000000111011111111111100011111000011100000001111111111111
 11000000000000011111111111111111000111110000000000000011111111111
 11000000000000000011111111111111000000000000000000000000111111111
 11001000000000000000001111111110000000000000000000000000001111111
 11100110000000000001111111110000000000000000111000000000000111111
 11110110000000000000000000000000000000000111111111110000000011111
 11111110000000000000000000000000000000001111111111111100000001111
 11111110000010000000000000000001100000000111011111111110000001111
 11111111000111110000000000000111110000000000111111111110110000111
 11111110001111111100010000000001111100000111111111111111110000111
 11111110001111111111111110000000111111100000000111111111111000111
 11111111001111111111111111111000000111111111111111111111111100011
 11111111101111111111111111111110000111111111111111111111111001111
 11111111111111111111111111111110001111111111111111111111100111111
 11111111111111111111111111111111001111111111111111111111001111111
 11111111111111111111111111111111100111111111111111111111111111111
 11111111111111111111111111111111110111111111111111111111111111111
 
 
 */
