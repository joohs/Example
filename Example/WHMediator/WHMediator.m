//
//  WHMediator.m
//  Example
//
//  Created by Jon on 2018/5/14.
//  Copyright © 2018年 Jon.wu. All rights reserved.
//

#import "WHMediator.h"
#import <objc/runtime.h>

@interface WHMediator ()

@property (nonatomic, strong) NSMutableDictionary *cacheTarget;

@end

@implementation WHMediator

+ (instancetype)sharedInstance {
    static WHMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[WHMediator alloc] init];
    });
    return mediator;
}

- (NSMutableDictionary *)cacheTarget {
    if (_cacheTarget == nil) {
        _cacheTarget = [[NSMutableDictionary alloc] init];
    }
    return _cacheTarget;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget {
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionString = [NSString stringWithFormat:@"Action_%@:", actionName];
    Class targetClass;
    NSObject *target = self.cacheTarget[targetClassString];
    if (target == nil) {
        targetClass = NSClassFromString(targetClassString);
        target = [[targetClass alloc] init];
    }
    SEL action = NSSelectorFromString(actionString);
    if (target == nil) {
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
        return nil;
    }
    if (shouldCacheTarget) {
        self.cacheTarget[targetClassString] = target;
    }
    if ([target respondsToSelector:action]) {
        return [self safePerformAction:action target:target params:params];
    } else {
        //target是swift对象
        actionString = [NSString stringWithFormat:@"Action_%@WithParams:", actionName];
        action = NSSelectorFromString(actionString);
        if ([target respondsToSelector:action]) {
            return [self safePerformAction:action target:target params:params];
        } else {
            SEL action = NSSelectorFromString(@"notFound:");
            if ([target respondsToSelector:action]) {
                return [self safePerformAction:action target:target params:params];
            } else {
                // 这里也是处理无响应请求的地方，在notFound都没有的时候，直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
                [self.cacheTarget removeObjectForKey:targetClassString];
                return nil;
            }
        }
        
    }
}

- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if ([elts count] < 2) {
            continue;
        }
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    id result = [self performTarget:url.host action:actionName params:params shouldCacheTarget:NO];
    if (completion) {
        if (result) {
            completion(@{@"retult":result});
        } else {
            completion(nil);
        }
    }
    return result;
}

#pragma mark - private method
- (id)safePerformAction:(SEL)action target:(NSObject *)target params:(NSDictionary *)params {
    NSMethodSignature *methodSignature = [target methodSignatureForSelector:action];
    if (methodSignature == nil) {
        return nil;
    }
    const char *retType = [methodSignature methodReturnType];
    if (strcmp(retType, @encode(void)) == 0) {
        [self invocationWithMethodSignature:methodSignature action:action target:target params:params];
        return nil;
    }
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [self invocationWithMethodSignature:methodSignature action:action target:target params:params];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);;
    }
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [self invocationWithMethodSignature:methodSignature action:action target:target params:params];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);;
    }
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [self invocationWithMethodSignature:methodSignature action:action target:target params:params];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [self invocationWithMethodSignature:methodSignature action:action target:target params:params];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);;
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}

- (NSInvocation *)invocationWithMethodSignature:(NSMethodSignature *)methodSignature action:(SEL)action target:(NSObject *)target params:(NSDictionary *)params{
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setArgument:&params atIndex:2];
    [invocation setSelector:action];
    [invocation setTarget:target];
    [invocation invoke];
    return invocation;
}

@end
