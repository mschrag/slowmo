#include <stdio.h>
#include <Foundation/Foundation.h>

@protocol SlowmoMonitorWindow
  - (void)setAllowTripleShiftSlowMotion:(BOOL)doit;
@end

@protocol SlowmoMonitorController
  + (id<SlowmoMonitorController>)sharedInstance;
  - (id<SlowmoMonitorWindow>)monitorWindow;
@end

void inject_init(void) __attribute__((constructor));
void inject_init(void) {
	[[(id<SlowmoMonitorController>)[NSClassFromString(@"MonitorController") sharedInstance] monitorWindow] setAllowTripleShiftSlowMotion:YES];
}
