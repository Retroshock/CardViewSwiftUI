
import SwiftUI

@available(iOS 13.0, *)
struct CardViewModifier: ViewModifier {
    private enum Constants {
        static let scaleTapped: CGFloat = 0.9
    }
    
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let cornerRadius: CGFloat
    let shadowRadius: CGFloat
    let shadowYPosition: CGFloat
    let shadowXPosition: CGFloat
    
    @GestureState private var tapped = false
    
    func body(content: Content) -> some View {
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
            .scaleEffect(tapped ? Constants.scaleTapped : 1)
            .animation(.default)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .updating($tapped, body: { (current, tapped, something) in
                        tapped = true
                    })
            )
    }
}

@available(iOS 13.0, *)
extension View {
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