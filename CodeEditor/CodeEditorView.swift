//
//  File.swift
//  CodeEditor
//
//  Created by Consultant on 12/16/22.
//

import SwiftUI
import Runestone


struct CodeEditorView: UIViewRepresentable {
    var lineSpacing: Double = 1.0
    var showLineNumbers: Bool = true
    var showLineWrapping: Bool = true

    init() {
        self.lineSpacing = 1
        self.showLineNumbers = true
        self.showLineWrapping = true
    }

    fileprivate init(lineSpacing: Double, showLineNumbers: Bool, showLineWrapping: Bool) {
        self.lineSpacing = lineSpacing
        self.showLineNumbers = showLineNumbers
        self.showLineWrapping = showLineWrapping
    }
    
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

// MARK: - CodeEditorView Modifiers

extension CodeEditorView {
    func lineHeight(_ value: Binding<Double>) -> CodeEditorView {
        CodeEditorView(
            lineSpacing: value.wrappedValue,
            showLineNumbers: showLineNumbers,
            showLineWrapping: showLineWrapping
        )
    }

    func lineWrapping(_ value: Binding<Bool>) -> CodeEditorView {
        CodeEditorView(
            lineSpacing: lineSpacing,
            showLineNumbers: showLineNumbers,
            showLineWrapping: value.wrappedValue
        )
    }

    func showsLineNumbers(_ value: Binding<Bool>) -> CodeEditorView {
        CodeEditorView(
            lineSpacing: lineSpacing,
            showLineNumbers: value.wrappedValue,
            showLineWrapping: showLineWrapping
        )
    }
}
