/*
 * Copyright 2008, Jens Alfke, Torsten Curdt
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FRExceptionReportingApplication.h"
#import "NSException+Callstack.h"
#import "FRFeedbackReporter.h"

@implementation FRExceptionReportingApplication

- (void) reportException:(NSException *)x
{
    [super reportException: x];
    
    @try {
        [[FRFeedbackReporter sharedReporter] reportException:x];
    }
    @catch (NSException *exception) {
        NSLog(@"Problem within FeedbackReporter %@: %@", [exception name], [exception  reason]);
    }
    @finally {
    }
}


@end
