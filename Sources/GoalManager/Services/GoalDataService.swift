//
//  GoalDataService.swift
//  GoalManager
//
//  Created by Robert le Clus on 2025/06/06.
//
import Foundation
import SwiftData

public class GoalDataService {
	let context: ModelContext
	public init(context: ModelContext) {
		self.context = context
	}
	
	public func addGoals(name: String, startDate:Date, goals: [Goal]) throws {
		let week = GoalWeek(id: UUID(), goalName: name, startDate: startDate, goalsForWeek: goals)
		context.insert(week)
		try context.save()
	}
	
	public func fetchGoals() throws -> [GoalWeek] {
		try context.fetch(FetchDescriptor<GoalWeek>())
	}
	
	public func fetchGoals(for weekStarting: Date) throws -> GoalWeek? {
		let calendar = Calendar.current
		let startOfDay = calendar.startOfDay(for: weekStarting)
		guard let nextDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) else {
			return nil
		}
		
		let descriptor = FetchDescriptor<GoalWeek>(
			predicate: #Predicate { goal in
				goal.startDate >= startOfDay && goal.startDate < nextDay
			}
		)
		
		let weeks = try context.fetch(descriptor)
		if weeks.count > 0 {
			return weeks[0]
		} else {
			return nil
		}
	}
	
	public func makeGoals(from goalsData: [(Int,Int,Int,String)]) -> [Goal] {
		var goals: [Goal] = []
		for (targetSteps, countedSteps, durationInMinutes, weekday) in goalsData {
			goals.append(Goal(targetSteps: targetSteps, countedSteps: countedSteps, durationInMinutes: durationInMinutes, weekday: weekday, id: UUID()))
		}
		return goals
	}
}
