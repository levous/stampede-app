//
//  RepositoryBuildTaskViewTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryBuildTaskViewTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoryBuildTaskView_Previews.previews,
                   title: "RepositoryBuildTaskView_Previews")
    }
}
