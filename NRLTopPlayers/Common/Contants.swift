//
//  Contants.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit
/// Constants
struct Constant {
	static let appName = "NRL"
	static let homeTitle = "Top Players"
	static let matchId = "NRL20172101"

	enum Message {
		static let notAvailable = "Data not available, please try again later"
		static let unknownError = "Unknown Error"
	}

	enum Color {
		static let primary = UIColor(named: "Primary")
		static let teamA = UIColor(named: "TeamA")
		static let teamB = UIColor(named: "TeamB")
	}
}

struct StatsSection {
	let title: String
	let teamA: String
	let teamB: String
}

struct Endpoint {
	// swiftlint:disable line_length
	private static let topPlayers = "https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/%@/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A00239D3-45F6-4A0A-810C-54A347F144C2"
	private static let playerDetails = "https://statsapi.foxsports.com.au/3.0/api/sports/league/series/1/seasons/115/teams/%d/players/%d/detailedstats.json?&userkey=9024ec15-d791-4bfd-aa3b-5bcf5d36da4f"
	private static let playerImage = "https://media.foxsports.com.au/match-centre/includes/images/headshots/landscape/nrl/%d.jpg"
	// swiftlint:enable line_length

	static func playerImage(_ playerId: Int) -> URL {
		return URL(string: String(format: Endpoint.playerImage, playerId))!
	}

	static func playerDetails(team: Int, player: Int) -> URL {
		return URL(string: String(format: Endpoint.playerDetails, team, player))!
	}

	static func topPlayers(match: String) -> URL {
		return URL(string: String(format: topPlayers, match))!
	}
}

/// App specific error
struct AppError: LocalizedError {
	let errorDescription: String?

	/// Unknown error case
	static let unknown = AppError(errorDescription: Constant.Message.unknownError)
	static let notAvailable = AppError(errorDescription: Constant.Message.notAvailable)
}
