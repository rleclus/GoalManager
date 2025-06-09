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
			goals.append(Goal(id: UUID(), targetSteps: targetSteps, weekday: weekday, countedSteps: countedSteps, durationInSeconds: durationInMinutes))
		}
		return goals
	}
	
	public func saveEmptyWeek(with name: String, for startDate:Date) throws {
		var goals: [Goal] = []
 		let days = Week.generateWeekdays()
		for day in days {
			goals.append(Goal(id: UUID(), targetSteps: 0, weekday: day, countedSteps: 0, durationInSeconds: 0))
		}
		try addGoals(name: name, startDate: startDate, goals: goals)
	}
	
	public func fetchGoal(startDate: Date, for day: String) throws -> Goal? {
		let goalWeek = try fetchGoals(for: startDate)
		let goal = goalWeek?.goalsForWeek.filter { goal in
			return goal.weekday == day
		}
		return goal?.count == 1 ? goal?.first : nil
	}
	
	public func saveContext() throws {
		try context.save()
	}
}
