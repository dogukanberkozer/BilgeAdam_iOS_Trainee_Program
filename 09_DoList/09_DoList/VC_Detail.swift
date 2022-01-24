//
//  VC_Detail.swift
//  09_DoList
//
//  Created by Dogukan Berk Ozer on 24.01.2022.
//

import UIKit

class VC_Detail: UIViewController, UITextViewDelegate {
    
    var willUpdate : DoItem?
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvDesc: UITextView!
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var tvDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(willUpdate != nil)
        {
            tfTitle.text = willUpdate!.title
            tvDesc.text = willUpdate!.desc
            tvDetail.text = willUpdate!.detail
        }

        tvDesc.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        lblCounter.text = "\(tvDesc.text.count)/150"
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        return textView.text.count < 150
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if(willUpdate == nil)
        {
            DataAccessLayer.addDoItem(title: tfTitle.text!, desc: tvDesc.text!, detail: tvDetail.text!)
        }
        else
        {
            willUpdate!.title = "tfTitle.text"
            willUpdate!.desc = tvDesc.text
            willUpdate!.detail = "tvDetail.text"
            DataAccessLayer.updateDoItem()
        }
        navigationController?.popViewController(animated: true)
    }

}
