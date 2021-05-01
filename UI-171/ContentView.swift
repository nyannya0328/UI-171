//
//  ContentView.swift
//  UI-171
//
//  Created by にゃんにゃん丸 on 2021/04/30.
//

import SwiftUI

struct ContentView: View {
    @Namespace var animation
    @StateObject var model = MainViewModel()
    var body: some View {
//        MainView(animation: animation)
//            .environmentObject(model)
        
        VideoView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension View{
//    
//    func getRect()->CGRect{
//        
//        return UIScreen.main.bounds
//    }
//    
//    func getSafeArea()->UIEdgeInsets{
//        
//        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//}
