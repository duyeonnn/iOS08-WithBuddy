//
//  CoreDataManager.swift
//  WithBuddy
//
//  Created by 김두연 on 2021/11/08.
//

import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()
    
    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WithBuddyModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        self.persistentContainer.viewContext
    }
    
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        do {
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @discardableResult
    func insertGathering(_ gathering: Gathering) -> Bool {
        let gatheringEntity = GatheringEntity(context: self.context, gathering: gathering)
        gatheringEntity.addToBuddyList(NSSet(array: self.fetchBuddyEntity(of: gathering.buddyList)))
        
        do {
            try self.context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    @discardableResult
    func insertBuddy(_ buddy: Buddy) -> Bool {
        BuddyEntity(context: self.context, buddy: buddy)
        
        do {
            try self.context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    private func fetchBuddyEntity(of buddyList: [Buddy]) -> [BuddyEntity] {
        let request = BuddyEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id IN %@", buddyList.map{ $0.id })
        return self.fetch(request: request)
    }
}
