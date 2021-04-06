
import SwiftUI

@available(iOS 13.0, *)
public struct CardViewModifier: ViewModifier {
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
            .scaleEffect(tapped ? Constants.scaleTapped : 1)
            .animation(.default)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .updating($tapped, body: { (_, tapped, _) in
                        tapped = true
                    })
                    .sequenced(
                        before: DragGesture(coordinateSpace: .global)
                    )
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
