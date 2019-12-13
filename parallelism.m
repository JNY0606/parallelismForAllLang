#import <Foundation/Foundation.h>


void doit(void (^cb)(NSString*)) {
    /* check cpu parallelism
    while (true) { }
    //*/
    
    [NSThread sleepForTimeInterval:1];
    NSLog(@"%s", "並行");
    cb(@"bb");
}


int count=0;
int main(int argc, const char * argv[]) {
    auto threads=5;
    NSCondition* lobj=[[NSCondition alloc] init];
    
    typedef void (^Callback)(NSString*);
    Callback listener = ^(NSString* s){
        [lobj lock];
        
        ++count;
        [NSThread sleepForTimeInterval:1];
        NSLog(@"%d", count);
        
        [lobj unlock];
    };
    
    for (auto i=0; i<threads; ++i) {
        NSThread* t = [[NSThread alloc] initWithBlock: ^{
            doit(listener);
        }];
        
        [t start];
    }
    
    while (threads!=count) [NSThread sleepForTimeInterval:1];
}
