
import SwiftUI

@available(iOS 13.0, *)
public struct CardViewModifier: ViewModifier {
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let cornerRadius: CGFloat
    let shadowRadius: CGFloat
    let shadowYPosition: CGFloat
    let shadowXPosition: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .frame(
                width: frameWidth,
                height: frameHeight
            )
            .cornerRadius(cornerRadius)
            .shadow(
                color: .gray,
                radius: shadowRadius,
                x: shadowXPosition,
                y: shadowYPosition
            )
    }
}

@available(iOS 13.0, *)
public extension View {
    func cardModifier(
        frameWidth: CGFloat = 200,
        frameHeight: CGFloat = 200,
        cornerRadius: CGFloat = 10,
        shadowRadius: CGFloat = 3,
        shadowYPosition: CGFloat = 0.5,
        shadowXPosition: CGFloat = .zero
    ) -> some View {
        modifier(
            CardViewModifier(
                frameWidth: frameWidth,
                frameHeight: frameHeight,
                cornerRadius: cornerRadius,
                shadowRadius: shadowRadius,
                shadowYPosition: shadowYPosition,
                shadowXPosition: shadowXPosition
            )
        )
    }
}
