//
//  WeekEnum.swift
//  FitnessTrackerApp
//
//  Created by Robert le Clus on 2025/06/07.
//

public enum Week: String {
	case Sunday
	case Monday
	case Tuesday
	case Wednesday
	case Thursday
	case Friday
	case Saturday
	public static func generateWeekdays() -> [String] {
		return generateWeekArray().map { $0.rawValue }
	}
	public static func generateWeekArray() -> [Week] {
		return [Week.Sunday,
				Week.Monday,
				Week.Tuesday,
				Week.Wednesday,
				Week.Thursday,
				Week.Friday,
				Week.Saturday]
	}
}
