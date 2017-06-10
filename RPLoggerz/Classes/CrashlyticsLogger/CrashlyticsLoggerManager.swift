//
//  CrashlyticsLoggerManager.swift
//
// Copyright (c) 2017 Florian PETIT <florianp37@me.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
// 

import CrashlyticsRecorder


/**
 Crashlytics Logging manager, enabling to add any log message to crash logs reported by the current session
 */
public class CrashlyticsLoggerManager: MessageLogger {

    /// Singleton
    public static let sharedManager = CrashlyticsLoggerManager()
    /// A CrashlyticsRecorder object (used to inject and use crashlytics instance inside any pod)
    var recorder: CrashlyticsRecorder?

    /**
     Sets up the CrashlyticsLoggerManager with crashlytics instance.
     - parameter crashlytics: the crashlytics instance
     */
    public static func setupCrashlyticsRecorder(crashlytics: CrashlyticsProtocol) {
       sharedManager.recorder = CrashlyticsRecorder.createSharedInstance(crashlytics: crashlytics)
    }

    /**
     Adds a message to eventually be logged to crashlytics instance.
     - parameter items: items/objects to be logged
     - parameter logLevel: the log level from any of these values (verbose, info, warning, error)
     - parameter error: the error to be logged
     */
    public func logMessage(_ items: Any..., logLevel: LogLevel, error: Error? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        guard let crashlyticsRecorder = CrashlyticsLoggerManager.sharedManager.recorder else {
            return
        }

        crashlyticsRecorder.log("%@", args: items)
    }
}
