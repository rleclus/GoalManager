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
	
	public func addGoals(name: String, goals: [Goal]) throws {
		let week = GoalWeek(id: UUID(), goalName: name, goalsForWeek: goals)
		context.insert(week)
		try context.save()
	}
	
	public func fetchGoals() throws -> [GoalWeek] {
		try context.fetch(FetchDescriptor<GoalWeek>())
	}
	
	public func makeGoals(from goalsData: [(Int,Int,Int,String)]) -> [Goal] {
		var goals: [Goal] = []
		for (targetSteps, countedSteps, durationInMinutes, weekday) in goalsData {
			goals.append(Goal(targetSteps: targetSteps, countedSteps: countedSteps, durationInMinutes: durationInMinutes, weekday: weekday, id: UUID()))
		}
		return goals
	}

}
