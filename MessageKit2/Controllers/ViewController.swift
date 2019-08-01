//
//  ViewController.swift
//  MessageKit2
//
//  Created by 安藤奨 on 2019/08/01.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView

//UIViewControllerからMessagesViewControllerに変更することによって、チャット画面を作成するために使える便利な機能を使用できるようになります

class ViewController: MessagesViewController {
    
    var messageList:[Message] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messageInputBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func createResponse(text: String) -> Message {
        let chatUser = ChatUser(senderId: "9999", displayName: "UserName");
        if text == "こんにちは" {
            return Message(user: chatUser, text: "Hello", messageId: UUID().uuidString, sentDate: Date())
        }
        
        return Message(user: chatUser, text: "よくわかりません", messageId: UUID().uuidString, sentDate: Date())
    }


}

extension ViewController: MessagesDataSource{
    func currentSender() -> SenderType {
        let id = "1234"
        let name = "Seedkun"
        return ChatUser(senderId: id, displayName: name)
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
       return messageList[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }
    
    
    
    
}
//送信ボタンの処理を追記する
extension ViewController: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        // 自分の情報を取得
        let me = self.currentSender() as! ChatUser
        
        // 自分の情報、送信されたテキストからMessageオブジェクト作成
        let newMessage = Message(user: me, text: text, messageId: UUID().uuidString, sentDate: Date())
        
        // 全メッセージを保持する配列に新しいメッセージを追加
        messageList.append(newMessage)
        
        // 新しいメッセージを画面に追加
        messagesCollectionView.insertSections([messageList.count - 1])
        
        let responseMessage = createResponse(text: text)
        messageList.append(responseMessage)
        messagesCollectionView.insertSections([messageList.count - 1])
        
        // 入力バーの入力値リセット
        inputBar.inputTextView.text = ""
    }
    
}

extension ViewController: MessagesDisplayDelegate {
    
}

extension ViewController: MessagesLayoutDelegate {
    
}
