//
//  Message.swift
//  MessageKit2
//
//  Created by 安藤奨 on 2019/08/01.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import MessageKit

/// 1件のメッセージのデータを持つクラス
class Message{
    let user: ChatUser
    
    /// メッセージのテキスト
    let text: String
    
    /// メッセージID（1件のメッセージを特定するため）
    let messageId: String
    
    /// 送信日付
    let sentDate: Date
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - user: 送信者
    ///   - text: メッセージのテキスト
    ///   - messageId: メッセージID
    ///   - sentDate: 送信日付
    init(user: ChatUser, text: String, messageId: String, sentDate: Date) {
        self.user = user
        self.text = text
        self.messageId = messageId
        self.sentDate = sentDate
    }
}

extension Message: MessageType{
    
//    メッセージの送信者を返す
    var sender :SenderType{
        return Sender(id: user.senderId, displayName: user.displayName)
    }
    
    var kind: MessageKind{
        // タイプ：テキストと返す
        return .text(text)
    }
}
