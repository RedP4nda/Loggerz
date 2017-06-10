//
//  JustLogService.swift
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

import JustLog

/**
 Justlog Logging service
 */
public class JustLogService: MessageLogger {

    /**
     Init JustLogService Service
     */
    public required init() {
    }

    /**
     Configure JustLog logger.
     - parameter host: the host where the log should be sent
     - parameter port: the port the server is listening on
     - parameter token: if you use Logz.io platform, your token
     - parameter timeout: the socket timeout
     - parameter logSocketActivity: if set to true, logs the socketActivity to the console
     - parameter filename: the filename where the log should be written to.
     - parameter defaultUserInfo: A dictionnary of infos to be added to each logged message
     */
    public static func configure(host: String, port: UInt16, token: String = "", timeout: TimeInterval = 25, logSocketActivity: Bool = false, filename: String = "JustLogService.log", defaultUserInfo: [String : Any]? = nil) {
        Logger.shared.logstashHost = host
        Logger.shared.logstashPort = port
        Logger.shared.logzioToken = token
        Logger.shared.logstashTimeout = timeout
        Logger.shared.logLogstashSocketActivity = logSocketActivity
        Logger.shared.logFilename = filename


        // default info
        Logger.shared.defaultUserInfo = defaultUserInfo
        Logger.shared.setup()

    }

    /**
     Logs a message from given items.
     - parameter items: items/objects to be logged
     - parameter logLevel: the log level from any of these values (verbose, info, warning, error)
     - parameter error: the error to be logged
     */
    public func logMessage(_ items: Any..., logLevel: LogLevel, error: Error? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        switch logLevel {
        case .verbose:
            Logger.shared.verbose(items.description, error: error as NSError?, userInfo: nil, file, function, line)
        case .info:
            Logger.shared.info(items.description, error: error as NSError?, userInfo: nil, file, function, line)
        case .warning:
            Logger.shared.warning(items.description, error: error as NSError?, userInfo: nil, file, function, line)
        case .error:
            Logger.shared.error(items.description, error: error as NSError?, userInfo: nil, file, function, line)
        }
    }
}
