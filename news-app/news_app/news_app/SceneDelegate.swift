//
//  SceneDelegate.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let _ = (scene as? UIWindowScene) else { return }
        


        
        let navHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constant.Key.NAV_HOME) as! HomeNavigationController
        let navAuth = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constant.Key.NAV_AUTH) as! AuthNavigationController
        
        if UserDefaults.standard.getValue(swiftClass: LanguageManager.TypeLanguage.self, forKey: Constant.Key.KEY_LANGUAGE_APP) == nil{
            LanguageManager.setDefaultLanguage()
        }
        UserDefaults.standard.synchronize()
        if UserDefaults.getUser() == nil {
            window?.rootViewController = navAuth
            return
        }
        window?.rootViewController = navHome
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
//        Hàm này được gọi khi scene đang được giải phóng bởi hệ thống.
//        Thường được sử dụng để giải phóng bất kỳ tài nguyên nào liên quan đến scene này mà có thể được tạo lại khi scene kết nối lại sau này.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
//        Hàm này được gọi khi scene chuyển từ trạng thái không hoạt động sang trạng thái hoạt động.
//        Trong hàm này, bạn có thể khởi động lại bất kỳ tác vụ nào đã tạm dừng hoặc chưa được bắt đầu khi scene không hoạt động.
    }

    func sceneWillResignActive(_ scene: UIScene) {
//        Hàm này được gọi khi scene sắp chuyển từ trạng thái hoạt động sang trạng thái không hoạt động.
//        Thường được sử dụng để chuẩn bị cho bất kỳ gián đoạn tạm thời nào có thể xảy ra, chẳng hạn như một cuộc gọi điện thoại đến.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
//        Hàm này được gọi khi scene chuyển từ nền sang phía trước.
//        Thường được sử dụng để hoàn tác các thay đổi đã thực hiện khi ứng dụng chuyển sang nền.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
//        Hàm này được gọi khi scene chuyển từ phía trước sang nền.
//        Thường được sử dụng để lưu dữ liệu, giải phóng tài nguyên chia sẻ, và lưu trạng thái cụ thể của scene để khôi phục lại scene vào trạng thái hiện tại của nó.
    }


}

