//
//  main.m
//  KCObjcBuild
//
//  Created by cooci on 2021/1/5.
// KC 重磅提示 调试工程很重要 源码直观就是爽
// ⚠️编译调试不能过: 请你检查以下几小点⚠️
// ①: enable hardened runtime -> NO
// ②: build phase -> denpendenice -> objc
// 爽了之后,还来一个 👍

void _objc_autoreleasePoolPrint(void);
#import <Foundation/Foundation.h>
#import "LGPerson.h"
//
//struct LGPerson {
//    LGPerson() {
//        printf("嘻嘻嘻哈哈");
//    };
//    ~LGPerson() {
//        printf("哈哈哈");
//    };
//};

// 现在研究的内容: 自动释放池 autoreleasepool
// 本质
// 第一种: clang  : @autoreleasepool = __AtAutoreleasePool __autoreleasepool;
// atautoreleasepoolobj = objc_autoreleasePoolPush();
// objc_autoreleasePoolPop(atautoreleasepoolobj);
// 第二种: 汇编
// 第三种: 编译源码的方式
// 自动释放池: 对象 结构体 内存分页 56 线程 栈 双向链表 page 4096
// 自动释放池: push pop 什么时候 线程 runloop  
/**
 libobjc.A.dylib`objc_autoreleasePoolPush:
 AutoreleasePoolPage::push at NSObject.mm:1167
 */
// class_data_bits_t
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSObject *obj1 = [NSObject alloc];
        NSObject *obj2 = [obj1 init];
        NSObject *obj3 = [obj1 init];
        NSLog(@"obj1-%@-%p-%p",obj1,obj1,&obj1);
        NSLog(@"obj2-%@-%p-%p",obj2,obj2,&obj2);
        NSLog(@"obj3-%@-%p-%p",obj3,obj3,&obj3);

        
        
        
//        LGPerson *person = [[LGPerson alloc] init];
//        person.name = @"cooci";
//        person.age = 12;
//        [person saySomething];
        
        //    class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
        // 4096
//        for (int i = 0 ; i<505; i++) {
//            NSObject *objc = [[NSObject alloc] autorelease];
//        }
//        _objc_autoreleasePoolPrint();
    }
    return 0;
}
