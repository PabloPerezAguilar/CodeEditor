//
//  SettingButtons.swift
//  CodeEditor
//
//  Created by Consultant on 12/17/22.
//

import SwiftUI

struct SettingsToolbar: CustomizableToolbarContent {
    @State var showSettings: Bool = false
    var lineSpacing: Binding<Double>
    @Binding var showLineNumbers: Bool
    @Binding var showLineWrapping: Bool
    
    var body: some CustomizableToolbarContent {
        Group {
            ToolbarItem(id: "linespacing.increase", placement: .secondaryAction) {
                Button {
                    lineSpacing.wrappedValue = lineSpacing.wrappedValue + 1.0
                } label: {
                    Label("Increase Line Spacing", systemImage: "plus")
                }
            }
            ToolbarItem(id: "linespacing.decrease", placement: .secondaryAction) {
                Button {
                    lineSpacing.wrappedValue = max(1.0, lineSpacing.wrappedValue - 1.0)
                } label: {
                    Label("Decrease Line Spacing", systemImage: "minus")
                }
            }
            ToolbarItem(id: "linenumbers.toggle", placement: .secondaryAction) {
                Toggle(isOn: $showLineNumbers) {
                    Label(
                        "Toggle Line Numbers",
                        systemImage: "list.number"
                    )
                }
            }
            ToolbarItem(id: "linewrapping.toggle", placement: .secondaryAction) {
                Toggle(isOn: $showLineWrapping) {
                    Label(
                        "Toggle Line Wrapping",
                        systemImage: "text.append"
                    )
                }
            }
        }
    }
}
