//
//  MainViewModel.swift
//  UI-171
//
//  Created by にゃんにゃん丸 on 2021/04/30.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var showProfile = false
    @Published var selectedProfile : profile!
    
    @Published var showEnlargeImage = false
    @Published var offset : CGFloat = 0
}

