//
//  MatchDetails.swift
//  NRLTopPlayers
//
//  Created by Ramachandrakurup, Rajesh on 24/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

struct MatchDetails: Codable {

	let matchId: String?
	let statType: String?
	let teamA: Team?
	let teamB: Team?

	enum CodingKeys: String, CodingKey {
		case matchId = "match_id"
		case statType = "stat_type"
		case teamA = "team_A"
		case teamB = "team_B"
	}
}

struct Team: Codable {
	let teamId: Int?
	let name: String?
	let code: String?
	let shortName: String?
	let topPlayers: [Player]?

	enum CodingKeys: String, CodingKey {
		case teamId = "id"
		case name
		case code = "team_A"
		case shortName = "short_name"
		case topPlayers = "top_players"
	}
}

struct Player: Codable {
	let playerId: Int?
	let position: String?
	let fullName: String?
	let shortName: String?
	let statValue: Int?
	let jumberNumber: Int?
	let lastMatchStats: [String: Int?]?

	enum CodingKeys: String, CodingKey {
		case playerId = "id"
		case position
		case fullName = "full_name"
		case shortName = "short_name"
		case statValue = "stat_value"
		case jumberNumber = "jumper_number"
		case lastMatchStats = "last_match_stats"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		playerId = try? values.decodeIfPresent(Int.self, forKey: .playerId)
		position = try? values.decodeIfPresent(String.self, forKey: .position)
		fullName = try? values.decodeIfPresent(String.self, forKey: .fullName)
		shortName = try? values.decodeIfPresent(String.self, forKey: .shortName)
		statValue = try? values.decodeIfPresent(Int.self, forKey: .statValue)
		jumberNumber = try? values.decodeIfPresent(Int.self, forKey: .jumberNumber)
		lastMatchStats = try? values.decodeIfPresent([String: Int?].self, forKey: .lastMatchStats)
	}
}

extension Array where Element == MatchDetails {
	subscript(indexPath: IndexPath) -> Player? {
		let index = Int(indexPath.item / 2)
		if indexPath.item % 2 == 0 {
			return self[indexPath.section].teamA?.topPlayers?[index]
		} else {
			return self[indexPath.section].teamB?.topPlayers?[indexPath.item / 2]
		}
	}

	func teamId(for indexPath: IndexPath) -> Int? {
		if indexPath.item % 2 == 0 {
			return self[indexPath.section].teamA?.teamId
		} else {
			return self[indexPath.section].teamB?.teamId
		}
	}
}
