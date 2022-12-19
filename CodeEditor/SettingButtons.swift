//
//  SettingButtons.swift
//  CodeEditor
//
//  Created by Consultant on 12/17/22.
//

import SwiftUI

struct SettingButtons: View {
    @State var showSettings: Bool = false
    var lineSpacing: Binding<Double>
    @Binding var showLineNumbers: Bool
    @Binding var showLineWrapping: Bool
    
    var body: some View {
        VStack(){
            Button{
                withAnimation(.linear) {
                    showSettings.toggle()
                }
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                    .shadow(radius: 10)
                    .overlay {
                        Image(
                            systemName: showSettings ? "chevron.up" : "slider.horizontal.3"
                        )
                        .foregroundColor(
                            showSettings ? .red : .blue
                        )
                    }
            }
            if(showSettings){
                Button {
                    lineSpacing.wrappedValue = lineSpacing.wrappedValue + 1.0
                } label: {
                    Label("More line spacing", systemImage: "plus")
                        .settingButtonStyle()
                }
                Button {
                    lineSpacing.wrappedValue = lineSpacing.wrappedValue > 1.0 ? lineSpacing.wrappedValue - 1.0 : 1.0
                } label: {
                    Label("Less line spacing", systemImage: "minus")
                        .settingButtonStyle()
                }
                
                Button {
                    showLineNumbers.toggle()
                } label: {
                    Label(
                        "\(showLineNumbers ? "Hide" : "Show" ) line numbers",
                        systemImage: showLineNumbers ? "lightswitch.on" : "lightswitch.off.fill"
                    )
                    .settingButtonStyle(isSwitch: true, isActive: showLineNumbers)
                }
                Button {
                    showLineWrapping.toggle()
                } label: {
                    Label(
                        "\(showLineWrapping ? "Deactivate" : "Activate" ) line wraping",
                        systemImage: showLineWrapping ? "lightswitch.on" : "lightswitch.off.fill"
                    )
                    .settingButtonStyle(isSwitch: true, isActive: showLineWrapping)
                }
            }
           
        }
    }
}
