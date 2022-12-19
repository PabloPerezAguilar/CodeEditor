//
//  SettingButtonModifier.swift
//  CodeEditor
//
//  Created by Consultant on 12/17/22.
//

import SwiftUI

struct SettingButton: ViewModifier{
    var isSwitch: Bool? = false
    var isActive: Bool? = true
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(getColor())
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(getColor(), lineWidth: 2.0)
                    .shadow(radius: 10)
            )
    }
    
    func getColor() -> Color {
        var color: Color = .gray
        
        if(!isSwitch!){
            return .blue
        }

        if(isActive!){
            color = .green
        }
        
        return color
    }
}

extension View {
    func settingButtonStyle(isSwitch: Bool? = false, isActive: Bool? = true) -> some View {
        modifier(SettingButton(isSwitch: isSwitch, isActive: isActive))
    }
}
