//
//  Goal.swift
//  GoalManager
//
//  Created by Robert le Clus on 2025/06/06.
//
import Foundation
import SwiftData

@Model
public class Goal: Identifiable {
	@Attribute(.unique) public var id: UUID
	public var targetSteps: Int
	public var countedSteps: Int
	public var durationInSeconds: Int
	public var caloriesBurned: Double
	public var weekday: String
	
	public init(id: UUID, targetSteps: Int, weekday: String, countedSteps: Int = 0, durationInSeconds: Int = 0, caloriesBurned: Double = 0) {
		self.id = id
		self.targetSteps = targetSteps
		self.weekday = weekday
		self.countedSteps = countedSteps
		self.durationInSeconds = durationInSeconds
		self.caloriesBurned = caloriesBurned
	}
}
