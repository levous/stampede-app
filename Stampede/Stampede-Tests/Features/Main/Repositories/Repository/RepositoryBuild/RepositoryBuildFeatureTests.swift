//
//  RepositoryBuildFeatureTests.swift
//  Stampede-MobileTests
//
//  Created by David House on 1/14/20.
//  Copyright © 2020 David House. All rights reserved.
//

import XCTest
@testable import Stampede

class RepositoryBuildFeatureTests: XCTestCase {

    func testCapturePreviews() {
        capture(RepositoryBuildFeature_Previews.previews,
                   title: "RepositoryBuildFeature_Previews")
    }
}
