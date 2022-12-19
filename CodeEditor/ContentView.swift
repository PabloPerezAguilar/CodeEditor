//
//  ContentView.swift
//  CodeEditor
//
//  Created by Consultant on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    @State var lineSpacing: Double = 1.0
    @State var showLineNumbers: Bool = true
    @State var showLineWrapping: Bool = false
    
    
    var body: some View {
        NavigationStack {
            CodeEditorView()
                .showsLineNumbers($showLineNumbers)
                .lineWrapping($showLineWrapping)
                .lineHeight($lineSpacing)
            .toolbar {
                SettingsToolbar(
                    lineSpacing: $lineSpacing,
                    showLineNumbers: $showLineNumbers,
                    showLineWrapping: $showLineWrapping
                )
            }
            .toolbarRole(.editor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
