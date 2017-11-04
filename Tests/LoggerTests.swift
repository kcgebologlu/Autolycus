//
//  LoggerTests.swift
//  Autolycus
//
//  Created by Harlan Kellaway on 11/4/17.
//  Copyright © 2017 Harlan Kellaway. All rights reserved.
//

import XCTest
@testable import Autolycus

class LoggerTests: XCTestCase {
    
    func testLogger_logsMessage_whenCannotConstrain_inCenter() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.inCenter(of: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_edges() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.edges(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logMessage_whenCannotConstrain_size_value() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.size(CGSize(width: 10, height: 10), logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logMessage_whenCannotConstrain_size_otherView() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.size(of: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logMessage_whenCannotConstrain_origin_otherView() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.origin(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_width_value() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.width(10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_width_toOtherView() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.width(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_width_minMax() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.width(min: 10, max: 100, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_height_value() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.height(10, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_height_toOtherView() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.height(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_height_minMax() {
        let view = UIView()
        let logger = FakeLogger()
        
        view.height(min: 10, max: 100, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_leadingToTrailing() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.leadingToTrailing(of: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstrain_leading() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.leading(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }
    
    func testLogger_logsMessage_whenCannotConstraint_leftToRight() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.leftToRight(of: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }

    func testLogger_logsMessage_whenCannotConstrain_left() {
        let view1 = UIView()
        let view2 = UIView()
        let logger = FakeLogger()
        
        view1.left(to: view2, logger: logger)
        
        XCTAssertEqual(logger.lastMessageLogged, AutolycusLogger.prepareForAutoLayoutMessage)
    }

    
}
