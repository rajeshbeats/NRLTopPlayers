//
//  NRLTopPlayersTests.swift
//  NRLTopPlayersTests
//
//  Created by Ramachandrakurup, Rajesh on 23/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import XCTest
@testable import NRLTopPlayers

class NRLTopPlayersTests: XCTestCase {

	let url = Endpoint.topPlayers(match: Constant.matchId)

    override func setUp() {
		setupURLMockup()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testValidTopPlayer() {
		URLMockProtocol.testURLs = [url: Data(MockResponse.validTopPlayers.utf8)]
		let testExpectation = expectation(description: "Successful response from endpoint")

		let dataSource = HomeDataSource()
		let viewModel = HomeViewModel(listDataSource: dataSource)
		viewModel.fetchTopPlayers { error in
			XCTAssert(error == nil, "Unexpected error")
			XCTAssert(dataSource.data!.count > 0, "Data source data is empty")
			let status = dataSource.data![0].statType
			XCTAssert(status == "fantasy_points", "Stats type sorting is not proper")
			let player1 = viewModel.selectedPlayer(IndexPath(item: 0, section: 0))
			XCTAssert(player1?.playerId == 108392, "Error in Player selection")
			let player2 = viewModel.selectedPlayer(IndexPath(item: 3, section: 0))
			XCTAssert(player2?.playerId == 109768, "Error in Player selection")
			let team = viewModel.selectedTeam(IndexPath(item: 1, section: 0))
			XCTAssert(team == 55005, "Error in Team selection")

			testExpectation.fulfill()
		}
		wait(for: [testExpectation], timeout: 5)
	}

	func testInvalidTopPlayer() {
		URLMockProtocol.testURLs = [url: Data(MockResponse.invalidTopPlayers.utf8)]
		let testExpectation = expectation(description: "Invalud response from endpoint")

		let dataSource = HomeDataSource()
		let viewModel = HomeViewModel(listDataSource: dataSource)
		viewModel.fetchTopPlayers { error in
			XCTAssert(error != nil, "Expecting a proper error")
			XCTAssert(dataSource.data == nil, "Data source data should be empty on error case")
			testExpectation.fulfill()
		}
		wait(for: [testExpectation], timeout: 5)
	}

	func testNetworkError() {
		URLMockProtocol.testURLs = [url: nil]
		let testExpectation = expectation(description: "Invalud response from endpoint")

		let dataSource = HomeDataSource()
		let viewModel = HomeViewModel(listDataSource: dataSource)
		viewModel.fetchTopPlayers { error in
			XCTAssert(error != nil, "Expecting network error")
			XCTAssert(dataSource.data == nil, "Data source data should be empty on network error")
			testExpectation.fulfill()
		}
		wait(for: [testExpectation], timeout: 5)
	}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
