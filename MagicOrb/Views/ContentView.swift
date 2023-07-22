//
//  ContentView.swift
//  MagicOrb
//
//  Created by Simon Erlic on 2023-07-15.
//

import SwiftUI
import SwiftData
import AnimateText

var titleFont = "bluunext-bold"
var textFont = "bluunext-bold"

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
    static let notificationFeedback = UINotificationFeedbackGenerator()
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
    open override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {

        if motion == .motionShake {
            UIDevice.notificationFeedback.notificationOccurred(.warning)
        }
    }
    
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
    
}

// An example view that responds to being shaken
struct ContentView: View {
    // Let's prepare the speech recognition
    @State private var unitType: ATUnitType = .letters
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    // Let's prepare the vibration feedback
    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
    let notificationFeedback = UINotificationFeedbackGenerator()
    
    // Initialize other state objects
    @State private var magicAnswer:String = "Ask your question and shake"
    @State var isRecording = false
    
    @State private var displayInfoSheet = false
    
    init() {
        impactFeedback.prepare()
        notificationFeedback.prepare()
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .mask(
                    AnimateText<ATBlurEffect>($magicAnswer, type:unitType)
                        .font(Font.custom(textFont, size: 22))
                        .onShake {
                            notificationFeedback.notificationOccurred(.success)
                            magicAnswer = selectRandomString() ?? "Oops, can you please submit a bug report?";
                        }
                        .shadow(color: .gray, radius: 10)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                )
                
                AnimateText<ATOpacityEffect>($speechRecognizer.transcript, type:unitType)
                    .font(Font.custom(textFont, size: 16))
                    .padding()

                Button {
                    impactFeedback.impactOccurred()
                    if (!isRecording) {
                        speechRecognizer.resetTranscript()
                        speechRecognizer.startTranscribing()
                        
                        isRecording = true
                    } else {
                        speechRecognizer.stopTranscribing()
                        isRecording = false
                    }
                } label: {
                    Label(isRecording ? "End" : "Ask", systemImage: "mic")
                        .font(Font.custom(titleFont, size: 18))
                        .shadow(color: .purple, radius: 10)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Fortune")
            .toolbar { // <2>
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        VStack {
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .mask(
                                Text("Fortune").font(Font.custom(titleFont, size: 32))
                            )
                        }
                        Spacer().overlay(
                            Button(action: {
                                displayInfoSheet = !displayInfoSheet
                            }, label: {
                                Image(systemName: "info.circle")
                                    .foregroundStyle(.gray)
                            })
                            .padding()
                        )
                        Spacer()
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $displayInfoSheet) {
                        AboutView()
            }
        }
    }
}

#Preview {
    ContentView()
}
