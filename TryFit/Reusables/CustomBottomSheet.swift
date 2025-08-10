//
//  CustomBottomSheet.swift
//  TryFit
//
//  Created by Oluwatobiloba Akinrujomu on 09/06/2025.
//
import SwiftUI

struct CustomBottomSheet<Content: View>: View {
    @Binding var isPresented: Bool
    let content: Content
    
    @GestureState private var dragOffset: CGFloat = 0
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }
    
    var body: some View {
        if isPresented {
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }
                
                VStack {
                    Spacer()
                    VStack {
                        Capsule()
                            .frame(width: 40, height: 5)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        
                        ScrollView {
                            content
                                .padding()
                        }
                        .frame(maxHeight: UIScreen.main.bounds.height * 0.8)
                    }
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                    .offset(y: max(dragOffset, 0))
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { value, state, _ in
                                state = value.translation.height
                            }
                            .onEnded { value in
                                if value.translation.height > 100 {
                                    isPresented = false
                                }
                            }
                    )
                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: dragOffset)
                }
            }
            .zIndex(1)
        }
    }
}
