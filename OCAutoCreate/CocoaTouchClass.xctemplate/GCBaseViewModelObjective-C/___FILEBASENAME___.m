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
-(NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray new];
    }
    return _datas;
}
#pragma mark - method
#pragma mark - method_public
-(void)requestDatas
{
    @WeakSelf;
    NSString *interface = @"";
    NSMutableDictionary *para = [NSMutableDictionary new];
    [[InterfaceManager shareInterface]requetInterface:interface withParameter:para handler:^(NSDictionary *info, InterfaceStatusModel *infoModel) {
        if (0 == infoModel.status) {
            
        }
    }];
}
#pragma mark - method_private
#pragma mark - life
-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}
#pragma mark - delegate
@end
