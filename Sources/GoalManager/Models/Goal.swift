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
	public var durationInMinutes: Int
	public var weekday: String
	
	public init(targetSteps: Int = 10000, countedSteps: Int, durationInMinutes: Int, weekday: String, id: UUID) {
		self.targetSteps = targetSteps
		self.countedSteps = countedSteps
		self.durationInMinutes = durationInMinutes
		self.weekday = weekday
		self.id = id
	}
}
