//
//  NavbarButtonTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/5/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class NavbarButtonTests: XCTestCase {

    func testCapturePreviews() {
        capture(NavbarButton_Previews.previews,
                   title: "NavbarButton_Previews")
    }
}
