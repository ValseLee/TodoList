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

}

extension MemoDataModel : Identifiable {

}
