//
//  AppDelegate.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//
import CoreData
import FirebaseAuth
import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var context : NSManagedObjectContext!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegate.context = persistentContainer.viewContext
        FirebaseApp.configure()
        importDataCategoriesDefault()
        
        if let directoryLocation = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {             print("Documents Directory: \(directoryLocation)Application Support") }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func importDataCategoriesDefault() {
        do {
            
            var arr : [CDCategory] = []
            let item :[CDCategory] = try AppDelegate.context.fetch(CDCategory.fetchRequest())
            if item.count == 0 {
                let user = CDUser(context: AppDelegate.context)
                user.idUser = "kJLXcuZUgNSTonSg3IO9688pz173"
                user.email = "cuong@gmail.com"
                user.listIndexCategories = [Constant.Key.KEY_TYPE_TUOI_TRE : Array(0...17),
                                            Constant.Key.KEY_TYPE_VN_EXPRESS : [20,15,1,3,16,6,5,4,8,9,10,11,12,13,14,2,17,7,18,19,0,21]]
                try AppDelegate.context.save()
                
                
                for (it) in Constant.CATEGORY_VN_EXPRESS {
                    let i = CDCategory(context: AppDelegate.context)
                    i.idCategory = Int64(it.id)
                    i.title = it.title
                    i.url = it.url
                    i.typeSource = it.sourceType
                    arr.append(i)
                }
                for (it) in Constant.CATEGORY_TUOI_TRE {
                    let i = CDCategory(context: AppDelegate.context)
                    i.idCategory = Int64(it.id)
                    i.title = it.title
                    i.url = it.url
                    i.typeSource = it.sourceType
                    arr.append(i)
                }
                try AppDelegate.context.save()
            }
            
            //            try print("\(AppDelegate.context.fetch(Categories.fetchRequest()))")
            //            try print("\(AppDelegate.context.fetch(Users.fetchRequest()))")
        }
        catch let error {
            print("Lỗi khi lưu\(error)")
        }
    }
}

