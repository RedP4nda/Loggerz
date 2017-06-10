//
//  DotzuLoggerService.swift
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

import Dotzu

/**
 Dotzu Logging service
 */
public class DotzuLoggerService: MessageLogger {

    /**
     Init DotzuLogger Service
     */
    public required init() {
        self.configure()
    }

    /**
     Configure DotzuLogger Service
     */
    private func configure() {
        Dotzu.sharedManager.enable()

        let configuration = URLSessionConfiguration.default
        Dotzu.sharedManager.addLogger(session: configuration)

        //Use it:
        //For Alamofire
        //let sessionManager = Alamofire.SessionManager(configuration: configuration)

        //For URLSession
        //let session = URLSession(configuration: configuration)
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
            Logger.verbose(items, file: file, function: function, line: line)
        case .info:
            Logger.info(items, file: file, function: function, line: line)
        case .warning:
            Logger.warning(items, file: file, function: function, line: line)
        case .error:
            Logger.error(items, file: file, function: function, line: line)
        }
    }

}
