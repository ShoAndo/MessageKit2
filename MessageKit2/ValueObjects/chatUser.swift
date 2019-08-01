//
//  chatUser.swift
//  MessageKit2
//
//  Created by 安藤奨 on 2019/08/01.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import MessageKit

/// チャットユーザーの情報を持つクラス
class ChatUser: SenderType {
    /// ユーザーID
    var senderId: String
    
    /// 表示名
    var displayName: String
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - senderId: ユーザーID
    ///   - displayName: 表示名
    init(senderId: String, displayName: String) {
        self.senderId = senderId
        self.displayName = displayName




    }

}































































