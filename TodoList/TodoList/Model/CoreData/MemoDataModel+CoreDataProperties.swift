//
//  MemoDataModel+CoreDataProperties.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/08.
//
//

import Foundation
import CoreData


extension MemoDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoDataModel> {
        return NSFetchRequest<MemoDataModel>(entityName: "MemoDataModel")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var backgroundColor: Int64

	var dateString: String? {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
		guard let date = self.date else { return "" }
		let savedDateString = formatter.string(from: date)
		return savedDateString
	}
}
