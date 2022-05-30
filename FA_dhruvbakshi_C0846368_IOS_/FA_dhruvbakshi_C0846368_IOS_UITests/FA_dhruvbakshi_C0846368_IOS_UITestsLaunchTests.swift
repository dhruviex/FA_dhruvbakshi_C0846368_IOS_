//
//  FA_dhruvbakshi_C0846368_IOS_UITestsLaunchTests.swift
//  FA_dhruvbakshi_C0846368_IOS_UITests
//
//  Created by Dhruv Bakshi on 2022-05-30.
//

import XCTest

class FA_dhruvbakshi_C0846368_IOS_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
