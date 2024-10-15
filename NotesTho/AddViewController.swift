//
//  AddViewController.swift
//  NotesTho
//
//  Created by Highest on 11.08.2024.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
        private let manager = CoreMenager.shared
        var note: Note?
        
        lazy var titlField: UITextField = {
            let title = UITextField()
            title.placeholder = "Введите заголовок"
            title.text = note?.title ?? ""
            title.translatesAutoresizingMaskIntoConstraints = false
            title.heightAnchor.constraint(equalToConstant: 50).isActive = true
            title.backgroundColor = .gray
            
            return title
        }()
        
        lazy var textView: UITextView = {
            let title = UITextView()
            title.text = note?.title ?? ""
            title.translatesAutoresizingMaskIntoConstraints = false
            title.heightAnchor.constraint(equalToConstant: 100).isActive = true
            title.backgroundColor = .gray
            title.font = UIFont.systemFont(ofSize: 16)
            
            return title
        }()
        lazy var btn: UIButton = {
            let btn = UIButton(primaryAction: action)
            btn.setTitle("save", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        lazy var action = UIAction { _ in
            if self.note == nil {
                self.manager.addNewNote(title: self.titlField.text ?? "",text: self.textView.text)
            } else {
                self.note?.updateNote(newTitle: self.titlField.text ?? "", newText: self.textView.text)
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(titlField)
            view.addSubview(textView)
            view.addSubview(btn)
            view.backgroundColor = .white
            title = "Add"


            NSLayoutConstraint.activate([
                titlField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                titlField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                titlField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

                textView.topAnchor.constraint(equalTo: titlField.bottomAnchor, constant: 10),
                textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

                btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                btn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                btn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)

            ])
            
        }
        
        
        
    }
