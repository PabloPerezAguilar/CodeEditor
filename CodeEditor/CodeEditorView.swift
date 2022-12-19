//
//  File.swift
//  CodeEditor
//
//  Created by Consultant on 12/16/22.
//

import SwiftUI
import Runestone


struct CodeEditorView: UIViewRepresentable {
    
    var lineSpacing: Double
    var showLineNumbers: Bool
    var showLineWrapping: Bool
    
    func makeUIView(context: Context) -> TextView {
        let textView =  TextView()
        textView.showTabs = true
        textView.showSpaces = true
        textView.autocorrectionType = .no
        textView.autocapitalizationType = .none
        textView.smartQuotesType = .no
        textView.smartDashesType = .no
        
        return textView
    }
    
    func updateUIView(_ uiView: TextView, context: Context) {
        uiView.lineHeightMultiplier = lineSpacing
        uiView.showLineNumbers = showLineNumbers
        uiView.isLineWrappingEnabled = showLineWrapping
    }
}
