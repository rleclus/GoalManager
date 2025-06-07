//
//  GoalWeek.swift
//  GoalManager
//
//  Created by Robert le Clus on 2025/06/06.
//
import Foundation
import SwiftData

@Model
public class GoalWeek: Identifiable {
	@Attribute(.unique) public var id: UUID
	public var goalName: String
	public var goalsForWeek: [Goal]
	public init(id: UUID, goalName: String, goalsForWeek: [Goal]) {
		self.id = id
		self.goalName = goalName
		self.goalsForWeek = goalsForWeek
	}
}
