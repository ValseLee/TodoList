//
//  CoreDataManager.swift
//  TodoList
//
//  Created by 이승준 on 2022/09/14.
//

import UIKit
import CoreData

final class CoreDataManager {
	static let shared = CoreDataManager()
	
	// MARK: CoreData
	private let appDelegate = UIApplication.shared.delegate as? AppDelegate
	private lazy var context = appDelegate?.persistentContainer.viewContext
	
	private let modelName = "MemoDataModel"
		
	// MARK: LifeCycle
	private init() {}
	
	// MARK: Fetch Memo
	private func getMemoListFormCoreData() -> [MemoDataModel] {
		var memoData = [MemoDataModel]()
		
		if let context = context {
			let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
//			let request = NSFetchRequest<MemoDataModel>(entityName: self.modelName)
			let dataOrder = NSSortDescriptor(key: "date", ascending: false)
			request.sortDescriptors = [dataOrder]
			
			do {
				if let fetchedMemoData = try context.fetch(request) as? [MemoDataModel] {
					memoData = fetchedMemoData
				}
			} catch {
				dump("DEBUG: FETCH FAILED")
			}
		}
		return memoData
	}
	
	// MARK: Save Memo on Context
	private func saveMemoData(memoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
		if let context = context {
			if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
				if let memoData = NSManagedObject(entity: entity, insertInto: context) as? MemoDataModel {
					memoData.memoText = memoText
					memoData.backgroundColor = colorInt
					memoData.date = Date()
					appDelegate?.saveContext()
				}
			}
		}
		completion()
	}
	
	// MARK: Delete Memo
	private func deleteMemoData(data: MemoDataModel, completion: @escaping () -> Void) {
		guard let date = data.date else {
			completion()
			return
		}
		
		if let context = context {
			let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
			request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
			
			do {
				if let fetchedData = try context.fetch(request) as? [MemoDataModel] {
					if let target = fetchedData.first {
						context.delete(target)
						appDelegate?.saveContext()
					}
				}
				completion()
			} catch {
				dump("DEBUG: DELETE FAILED")
				completion()
			}
		}
	}
	
	// MARK: Update Memo
	private func updateMemoData(newData: MemoDataModel, completion: @escaping () -> Void) {
		guard let date = newData.date else {
			completion()
			return
		}
		
		if let context = context {
			let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
			request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
			
			do {
				if let fetchedData = try context.fetch(request) as? [MemoDataModel] {
					if var target = fetchedData.first {
						target = newData
						appDelegate?.saveContext()
					}
				}
				completion()
			} catch {
				dump("DEBUG: UPDATE FAILED")
				completion()
			}
		}
		
	}
}
