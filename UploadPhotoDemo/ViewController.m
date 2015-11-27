//
//  ViewController.m
//  UploadPhotoDemo
//
//  Created by 吴玉铁 on 15/11/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"


@interface ViewController (){
    // AFN的客户端，使用基本地址初始化，同时会实例化一个操作队列，以便于后续的多线程处理
    AFHTTPSessionManager   *_httpClient;
    NSOperationQueue *_queue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
//    UIImage * image = [UIImage imageNamed:@"1.png"];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSData *imageData = UIImageJPEGRepresentation(image, 1);
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyyMMddHHmmss";
//    NSString *str = [formatter stringFromDate:[NSDate date]];
//    NSString *fileName = [NSString stringWithFormat:@"%@", str];
//    NSDictionary *parameters = @{@"filename":fileName};
//
    //拼接URL
    //urlString = [BaseURL stringByAppendingString:urlString];
    
    //创建管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"vip.jpg"], 1);
    NSDictionary *dataDic = @{@"upload":imageData};
    
    [manager POST:@"http://test.clzx521.com/app/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //key->value @"pic":NSData*(二进制图片数据）
        //for (NSString *key in dataDic) {
            //获取二进制文件数据
          //  NSData *data = dataDic[key];
            
            //把文件数据追加到formData的末尾
            [formData appendPartWithFileData:imageData name:@"upload" fileName:@"key" mimeType:@"image/png/jpeg"];
        //}
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



@end
