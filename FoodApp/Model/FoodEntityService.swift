//
//  FoodEntityService.swift
//  FoodApp
//
//  Created by Michał Niemiec on 22/05/2022.
//

import Foundation
import CoreData

class FoodEntityService {

    private let persistentContainer: NSPersistentContainer
    private let container: NSPersistentContainer
    private let containerName: String = "Model"
    private let entityName: String = "FoodEntity"
    private let backgroundContext: NSManagedObjectContext!
    @Published var savedEntities: [FoodEntity] = []

    lazy var mainContext: NSManagedObjectContext = {
        return container.viewContext
    }()

    init() {
        persistentContainer = CoreDataStack.shared.persistentContainer
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
        }
        backgroundContext = container.newBackgroundContext()
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }

    fileprivate func save(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error: \(error)\nCould not save Core Data context.")
            }
            context.reset()
        }
    }

    func add(_ item: FoodResponse, place: Int) {
        let taskContext = self.persistentContainer.newBackgroundContext()
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        taskContext.undoManager = nil

        taskContext.performAndWait {
                guard let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: taskContext) as? FoodEntity else {
                    print("Error: Failed to create a new PhotoEntity object!")
                    return
                }
            entity.update(with: item, place: place)
            save(taskContext)
        }
    }

    func fetchAll() async -> [FoodModel] {
        var items = [FoodModel]()
        let context = persistentContainer.viewContext
        do {
            let fetch = FoodEntity.fetchRequest()
            items = try context.fetch(fetch).map{
                FoodModel(entity: $0)
            }
        } catch {

        }
        return items
    }
}

class CoreDataStack {
    private let containerName: String = "Model"
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)

        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        })

        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true

        container.viewContext.automaticallyMergesChangesFromParent = true

        return container
    }()

    private init() {}

}
