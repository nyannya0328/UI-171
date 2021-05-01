//
//  VideoPlayerViewModel.swift
//  UI-171
//
//  Created by にゃんにゃん丸 on 2021/05/01.
//

import SwiftUI
import AVKit

class VideoPlayerViewModel: ObservableObject {
    @Published var showPlayer = false
    @Published var offset : CGSize = .zero
    @Published var scale : CGFloat = 0
    @Published var selectedVideo : Video = Video(player: AVPlayer())
}


