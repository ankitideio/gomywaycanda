//
//  ConversationChatViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-2 on 03/12/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//


import UIKit
import IQKeyboardManagerSwift
import GrowingTextView
class ConversationChatViewController: UIViewController {
  @IBOutlet weak var messageTextView: GrowingTextView!
  @IBOutlet weak var bgViewBottomLayout: NSLayoutConstraint!
  @IBOutlet weak var chatTable: UITableView!
  var chatData : chatDataModal!
  var chatArr = [chatDataModal]()
  var conversation_id = String()
  var toId = String()
  var viewModel = TabBarsVM()
  var arrChat = [ChatInbox]()
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("ChatPUSHNOTIFICATION"), object: nil)
    IQKeyboardManager.shared.disabledDistanceHandlingClasses = [ConversationChatViewController.self]
    IQKeyboardManager.shared.disabledToolbarClasses = [ConversationChatViewController.self]
    messageTextView.layer.cornerRadius = 4.0
    messageTextView.delegate = self
    // *** Listen to keyboard show / hide ***
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    // *** Hide keyboard when tapping outside ***
    //    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
    //    view.addGestureRecognizer(tapGesture)
    chatTable.keyboardDismissMode = .onDrag
//    getAllChat()
    getAllChatApi()
  }
  @objc func methodOfReceivedNotification(notification: Notification) {
    let userDict = notification.userInfo as? NSDictionary ?? [:]
    self.chatData = chatDataModal.init(data: userDict as! [String : Any])
    self.chatArr.append(self.chatData)
    DispatchQueue.main.async {
      self.chatTable.reloadData()
      self.scrollToBottom()
    }
  }
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  @objc private func keyboardWillChangeFrame(_ notification: Notification) {
    if let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      var keyboardHeight = UIScreen.main.bounds.height - endFrame.origin.y
      if #available(iOS 11, *) {
        if keyboardHeight > 0 {
          keyboardHeight = keyboardHeight - view.safeAreaInsets.bottom
        }
      }
      print(keyboardHeight)
      bgViewBottomLayout.constant = keyboardHeight
      view.layoutIfNeeded()
    }
  }
  private func scrollToBottom(){
    if arrChat.count > 1 {
      DispatchQueue.main.async {
        let indexPath = IndexPath(row: self.arrChat.count-1, section: 0)
        self.chatTable.scrollToRow(at: indexPath, at: .bottom, animated: false)
      }
    }
  }
  func getAllChatApi() {
    viewModel.getChatApi(token: fethToken(), conversation_id: conversation_id) { data in
        self.arrChat = data ?? []
               self.chatTable.reloadData()
               self.scrollToBottom()
    }
  }

  func sendMessageApi(textStr:String) {
    viewModel.sendMessageApi(token: fethToken(), conversation_id: conversation_id, message: textStr, from_id: fetchUserId(), to_id: toId) {
    self.arrChat.removeAll()
      self.getAllChatApi()
    }
  }

  //MARK: - IBAction
  @IBAction func sendMessageAction(_ sender: Any) {
    if messageTextView.text.count < 1 {
      TostErrorMessage(view:self.view,message:"Please write your message!")
    }
    else
    {
      sendMessageApi(textStr: messageTextView.text ?? "")
      messageTextView.text = nil
    }
  }
  @IBAction func backTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}
class senderTableCell: UITableViewCell {
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    bgView.roundCorners(corners: [.topLeft, .bottomRight, .topRight], radius: 10.0)
  }
  @IBOutlet weak var time_lbl: UILabel!
  @IBOutlet weak var message_lbl: UILabel!
  @IBOutlet weak var bgView: UIView!
}
class reciverTableCell: UITableViewCell {
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    bgView.roundCorners(corners: [.topLeft, .bottomRight, .topRight], radius: 10.0)
  }
  @IBOutlet weak var bgView: UIView!
  @IBOutlet weak var name_lbl: UILabel!
  @IBOutlet weak var message_lbl: UILabel!
  @IBOutlet weak var time_lbl: UILabel!
}
extension ConversationChatViewController:GrowingTextViewDelegate
{
  // *** Call layoutIfNeeded on superview for animation when changing height ***
  func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
    UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveLinear], animations: { () -> Void in
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  func textViewDidBeginEditing(_ textView: UITextView) {
    self.scrollToBottom()
  }
}
extension ConversationChatViewController: UITableViewDataSource,UITableViewDelegate
{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrChat.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if fetchUserId() == arrChat[indexPath.row].fromId {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Scell", for: indexPath) as! senderTableCell
        cell.time_lbl.text = arrChat[indexPath.row].time ?? ""
        cell.message_lbl.text = arrChat[indexPath.row].message ?? ""
        return cell
    }
    else
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath) as! reciverTableCell
        cell.time_lbl.text = arrChat[indexPath.row].time ?? ""
        cell.name_lbl.text = arrChat[indexPath.row].fromUserFirstName ?? "" + " \(arrChat[indexPath.row].fromUserLastName ?? "")"
        cell.message_lbl.text = arrChat[indexPath.row].message ?? ""
        return cell
    }
  }
}
