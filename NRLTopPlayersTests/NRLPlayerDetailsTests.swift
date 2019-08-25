//
//  NRLPlayerDetailsTests.swift
//  NRLTopPlayersTests
//
//  Created by Ramachandrakurup, Rajesh on 25/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import XCTest
@testable import NRLTopPlayers

class NRLPlayerDetailsTests: XCTestCase {

	let url = Endpoint.playerDetails(team: 55011, player: 115370)

    override func setUp() {
		// set up URL Mockup
       setupURLMockup()
    }

	/// Selected dummy player
	var player: Player {
		let data = Data(MockResponse.player.utf8)
		guard let player = try? JSONDecoder().decode(Player.self, from: data) else {
			fatalError("Player not available")
		}
		return player
	}

	/// Test valid palyer details cases
	func testValidPlayerDetails() {
		URLMockProtocol.testURLs = [url: Data(MockResponse.validPlayerDetails.utf8)]
		let testExpectation = expectation(description: "Successful response from endpoint")
		let dataSource = PlayerDetailsDataSource(player)
		let viewModel = PlayerDetailsViewModel(dataSource: dataSource, teamId: 55011)

		viewModel.fetchPlayerDetails { error in
			XCTAssert(error == nil, "Unexpected error")
			XCTAssert(dataSource.player.lastMatchStats!.count > 0, "Last matches stats for playe should be available")
			XCTAssert(dataSource.stats.count > 0, "Last matches stats for playe should be available")
			let key = dataSource.stats[0]
			let value = dataSource.player.lastMatchStats![key]!
			XCTAssert(dataSource.player.formattedStatsValue(for: key) == "\(key.displayFormat) : \(value ?? 0)", "Stats display format error")
			XCTAssert(viewModel.showStatsNotAvailable == false, "Not available should be false")
			testExpectation.fulfill()
		}
		wait(for: [testExpectation], timeout: 5)
	}

	/// Test player details data with invalid data
	func testInValidPlayerDetails() {
		URLMockProtocol.testURLs = [url: Data(MockResponse.invalidPlayerDetails.utf8)]
		let testExpectation = expectation(description: "Error response from endpoint")

		let dataSource = PlayerDetailsDataSource(player)
		let viewModel = PlayerDetailsViewModel(dataSource: dataSource, teamId: 55011)

		viewModel.fetchPlayerDetails { error in
			XCTAssert(error != nil, "Proper error should be availabe")
			XCTAssert(dataSource.player.lastMatchStats == nil, "Last matches stats should be empty on error")
			XCTAssert(viewModel.showStatsNotAvailable == true, "Not available status should be true")
			XCTAssert(dataSource.stats.count == 0, "Last matches stats should be empty on error")
			testExpectation.fulfill()
		}
		wait(for: [testExpectation], timeout: 5)
	}

	/// Test error handling in network failure case
	func testErrorAPIPlayerDetails() {
		URLMockProtocol.testURLs = [url: nil]
		let testExpectation = expectation(description: "Error response from endpoint")

		let dataSource = PlayerDetailsDataSource(player)
		let viewModel = PlayerDetailsViewModel(dataSource: dataSource, teamId: 55011)

		viewModel.fetchPlayerDetails { error in
			XCTAssert(error != nil, "Proper error should be availabe")
			XCTAssert(dataSource.player.lastMatchStats == nil, "Last matches stats should be empty on error")
			XCTAssert(dataSource.stats.count == 0, "Last matches stats should be empty on error")
			testExpectation.fulfill()
		}
		wait(for: [testExpectation], timeout: 5)
	}

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
