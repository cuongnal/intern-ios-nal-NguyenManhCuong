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
    static var userLogin : User?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegate.context = persistentContainer.viewContext
        FirebaseApp.configure()
        importDataDefault()
        
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
    func importDataDefault() {
        do {
            var arr : [CDCategory] = []
            let item :[CDCategory] = try AppDelegate.context.fetch(CDCategory.fetchRequest())
            if item.count == 0 {
                for (index, item) in Constant.CATEGORY_VN_EXPRESS.enumerated() {
                    let i = CDCategory(context: AppDelegate.context)
                    i.indexCategory = Int64(index)
                    i.title = item.title
                    i.url = item.url
                    i.idCate = item.idCate
                    i.typeSource = item.typeSource
                    arr.append(i)
                }
                for (index, item) in Constant.CATEGORY_TUOI_TRE.enumerated() {
                    let i = CDCategory(context: AppDelegate.context)
                    i.indexCategory = Int64(index)
                    i.title = item.title
                    i.url = item.url
                    i.idCate = item.idCate
                    i.typeSource = item.typeSource
                    arr.append(i)
                }
                try AppDelegate.context.save()
                
                let repoNews = NewsRepositoryImp()
                
                getNewsFromServer(repoNews: repoNews, completionHandler: { arr in
                    _ = repoNews.insertNewsByCategory(arrNews: arr)
                })
                
            }
        }
        catch let error {
            print("Lỗi khi lưu\(error)")
        }
    }
    private func getNewsFromServer(repoNews: NewsRepositoryImp ,completionHandler: @escaping (([News]) -> ())) {
        DispatchQueue.global(qos: .background).async {
            let vnExpressNews = repoNews.getAllNewsFromServerSource(typeSource: .vnExpress)
            let tuoiTreNews = repoNews.getAllNewsFromServerSource(typeSource: .tuoiTre)
            DispatchQueue.main.async {
                completionHandler(vnExpressNews + tuoiTreNews)
            }
        }
    }
}

