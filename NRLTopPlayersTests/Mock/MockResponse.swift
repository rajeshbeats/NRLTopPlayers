//
//  MockResponse.swift
//  NRLTopPlayersTests
//
//  Created by Ramachandrakurup, Rajesh on 25/8/19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation
// swiftlint:disable line_length
enum MockResponse {

	static let validTopPlayers = """
[{"match_id":"NRL20172101","team_A":{"id":55011,"name":"Penrith","code":"PEN","short_name":"Panthers","top_players":[{"id":115370,"position":"Full Back","full_name":"Dylan Edwards","short_name":"D. Edwards","stat_value":221,"jumper_number":1},{"id":109705,"position":"Prop Forward","full_name":"James Tamou","short_name":"J. Tamou","stat_value":163,"jumper_number":8},{"id":111483,"position":"Wing","full_name":"Josh Mansour","short_name":"J. Mansour","stat_value":162,"jumper_number":2},{"id":114076,"position":"Wing","full_name":"Dallin Watene-Zelezniak","short_name":"D. Watene-Zelezniak","stat_value":141,"jumper_number":5},{"id":113214,"position":"Interchange","full_name":"Reagan Campbell-Gillard","short_name":"R. Campbell-Gillard","stat_value":132,"jumper_number":10}]},"team_B":{"id":55005,"name":"Canterbury","code":"CBY","short_name":"Bulldogs","top_players":[{"id":111148,"position":"Full Back","full_name":"William Hopoate","short_name":"W. Hopoate","stat_value":198,"jumper_number":1},{"id":112952,"position":"Lock","full_name":"David Klemmer","short_name":"D. Klemmer","stat_value":184,"jumper_number":13},{"id":108807,"position":"Centre","full_name":"Josh Morris","short_name":"J. Morris","stat_value":123,"jumper_number":3},{"id":111702,"position":"Second Row","full_name":"Josh Jackson","short_name":"J. Jackson","stat_value":122,"jumper_number":11},{"id":108896,"position":"Prop Forward","full_name":"Aiden Tolman","short_name":"A. Tolman","stat_value":118,"jumper_number":8}]},"stat_type":"run_metres"},{"match_id":"NRL20172101","team_A":{"id":55011,"name":"Penrith","code":"PEN","short_name":"Panthers","top_players":[{"id":108392,"position":"Hooker","full_name":"Peter Wallace","short_name":"P. Wallace","stat_value":68,"jumper_number":9},{"id":114198,"position":"Centre","full_name":"Waqa Blake","short_name":"W. Blake","stat_value":60,"jumper_number":4},{"id":115370,"position":"Full Back","full_name":"Dylan Edwards","short_name":"D. Edwards","stat_value":60,"jumper_number":1},{"id":109705,"position":"Prop Forward","full_name":"James Tamou","short_name":"J. Tamou","stat_value":54,"jumper_number":8},{"id":111814,"position":"Centre","full_name":"Tyrone Peachey","short_name":"T. Peachey","stat_value":52,"jumper_number":3}]},"team_B":{"id":55005,"name":"Canterbury","code":"CBY","short_name":"Bulldogs","top_players":[{"id":108896,"position":"Prop Forward","full_name":"Aiden Tolman","short_name":"A. Tolman","stat_value":84,"jumper_number":8},{"id":109768,"position":"Five Eighth","full_name":"Josh Reynolds","short_name":"J. Reynolds","stat_value":79,"jumper_number":6},{"id":112952,"position":"Lock","full_name":"David Klemmer","short_name":"D. Klemmer","stat_value":77,"jumper_number":13},{"id":111702,"position":"Second Row","full_name":"Josh Jackson","short_name":"J. Jackson","stat_value":60,"jumper_number":11},{"id":110028,"position":"Prop Forward","full_name":"James Graham","short_name":"J. Graham","stat_value":51,"jumper_number":10}]},"stat_type":"fantasy_points"}]
"""

	static let invalidTopPlayers = """
[{"match_id":"NRL20172101","Penrith","code":"PEN","short_name":"Panthers","top_players":[{"id":115370,"position":"Full Back","full_name":"Dylan Edwards","short_name":"D. Edwards","stat_value":221,"jumper_number":1},{"id":109705,"position":"Prop Forward","full_name":"James Tamou","short_name":"J. Tamou","stat_value":163,"jumper_number":8},{"id":111483,"position":"Wing","full_name":"Josh Mansour","short_name":"J. Mansour","stat_value":162,"jumper_number":2},{"id":114076,"position":"Wing","full_name":"Dallin Watene-Zelezniak","short_name":"D. Watene-Zelezniak","stat_value":141,"jumper_number":5},{"id":113214,"position":"Interchange","full_name":"Reagan Campbell-Gillard","short_name":"R. Campbell-Gillard","stat_value":132,"jumper_number":10}]},"team_B":{"id":55005,"name":"Canterbury","code":"CBY","short_name":"Bulldogs","top_players":[{"id":111148,"position":"Full Back","full_name":"William Hopoate","short_name":"W. Hopoate","stat_value":198,"jumper_number":1},{"id":112952,"position":"Lock","full_name":"David Klemmer","short_name":"D. Klemmer","stat_value":184,"jumper_number":13},{"id":108807,"position":"Centre","full_name":"Josh Morris","short_name":"J. Morris","stat_value":123,"jumper_number":3},{"id":111702,"position":"Second Row","full_name":"Josh Jackson","short_name":"J. Jackson","stat_value":122,"jumper_number":11},{"id":108896,"position":"Prop Forward","full_name":"Aiden Tolman","short_name":"A. Tolman","stat_value":118,"jumper_number":8}]},"stat_type":"run_metres"}]
"""

	static let validPlayerDetails = """
{"id":115370,"surname":"Edwards","position":"Fullback","full_name":"Dylan Edwards","short_name":"D. Edwards","date_of_birth":"1996-01-10","height_cm":183,"other_names":"Dylan","weight_kg":93,"last_match_id":"NRL20192302","last_match_stats":{"errors":0,"goals":0,"intercepted":0,"intercepts":0,"kicks":0,"points":0,"possessions":32,"runs":21,"tackles":4,"tries":0,"mins_played":80,"attacking_kicks":0,"bombs_caught":0,"bombs_dropped":0,"charged_down":0,"charges_down":0,"drop_outs":0,"dummy_half_runs":1,"effective_offloads":0,"fantasy_points":58,"field_goal_attempts":null,"field_goal_misses":0,"field_goals":0,"forced_drop_outs":0,"general_play_pass":8,"goal_misses":0,"ineffective_tackles":0,"in_goal_escapes":0,"interchanges_off":0,"interchanges_on":0,"kick_errors":0,"kick_metres":0,"kick_return_metres":53,"kick_returns":7,"kicks_4020":0,"kicks_dead":0,"last_touch_try_assists":0,"line_break_assists":1,"line_break_causes":1,"line_breaks":0,"line_engagements":0,"long_kicks":0,"missed_tackles":1,"off_loads":0,"one_pass_runs":0,"penalties_conceded":0,"play_the_balls":23,"run_metres":152,"runs_7less_meters":null,"runs_8plus_meters":8,"send_offs":0,"sin_bins":0,"steals_one_on_one":0,"stolen_one_on_one":0,"tackle_busts":3,"tackled_opp20":5,"tackle_opp_half":5,"tackles_one_on_one":1,"try_assists":1,"try_causes":2,"try_contribution_percentage":null,"try_contributions":0,"try_involvements":1,"twenty_metre_restarts":0,"weighted_kicks":0,"post_contact_metres":null}}
"""

	static let invalidPlayerDetails = """
{"id":115370,"surname":"Edwards","position":"Fullback","full_name":"Dylan Edwards","short_name":"D. Edwards","date_of_birth":"1996-01-10","height_cm":183,"other_names":"Dylan","weight_kg":93,"last_match_id":"NRL20192302","last_m"goals":0,"intercepted":0,"intercepts":0,"kicks":0,"points":0,"possessions":32,"runs":21,"tackles":4,"tries":0,"mins_played":80,"attacking_kicks":0,"bombs_caught":0,"bombs_dropped":0,"charged_down":0,"charges_down":0,"drop_outs":0,"dummy_half_runs":1,"effective_offloads":0,"fantasy_points":58,"field_goal_attempts":null,"field_goal_misses":0,"field_goals":0,"forced_drop_outs":0,"general_play_pass":8,"goal_misses":0,"ineffective_tackles":0,"in_goal_escapes":0,"interchanges_off":0,"interchanges_on":0,"kick_errors":0,"kick_metres":0,"kick_return_metres":53,"kick_returns":7,"kicks_4020":0,"kicks_dead":0,"last_touch_try_assists":0,"line_break_assists":1,"line_break_causes":1,"line_breaks":0,"line_engagements":0,"long_kicks":0,"missed_tackles":1,"off_loads":0,"one_pass_runs":0,"penalties_conceded":0,"play_the_balls":23,"run_metres":152,"runs_7less_meters":null,"runs_8plus_meters":8,"send_offs":0,"sin_bins":0,"steals_one_on_one":0,"stolen_one_on_one":0,"tackle_busts":3,"tackled_opp20":5,"tackle_opp_half":5,"tackles_one_on_one":1,"try_assists":1,"try_causes":2,"try_contribution_percentage":null,"try_contributions":0,"try_involvements":1,"twenty_metre_restarts":0,"weighted_kicks":0,"post_contact_metres":null}}
"""

	static let player = """
{"id":115370,"position":"Full Back","full_name":"Dylan Edwards","short_name":"D. Edwards","stat_value":221,"jumper_number":1}
"""
}
// swiftlint:enable line_length