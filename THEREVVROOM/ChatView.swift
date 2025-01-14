import SwiftUI

struct Message: Identifiable, Hashable {
    let id: UUID
    let body: String
    let title: String
    let senderDisplayName: String
    let senderId: UUID
}

func generateRandomMessages(count: Int) -> [Message] {
    let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    let words = loremIpsum.components(separatedBy: " ")

    var messages = [Message]()

    for _ in 0..<count {
        let body = (0..<10).map { _ in words.randomElement()! }.joined(separator: " ")
        let title = (0..<3).map { _ in words.randomElement()! }.joined(separator: " ")
        let senderDisplayName = (0..<2).map { _ in words.randomElement()! }.joined(separator: " ")

        let message = Message(
            id: UUID(),
            body: body,
            title: title,
            senderDisplayName: senderDisplayName,
            senderId: UUID()
        )

        messages.append(message)
    }

    return messages
}

let fixedMessages = generateRandomMessages(count: 20)


struct ChatView: View {
    
    @State var messages = fixedMessages
    @State var messageDraft: String = ""
    
    var body: some View {
        VStack(spacing: 0.0) {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack {
                        ForEach(messages) { message in
                            MessageBubble(isOP: message.senderDisplayName == "You" ? true : Bool.random(), messageContent: message.body)
                        }
                    }
                    .padding(.horizontal)
                    .onChange(of: messages.count) { _, _ in
                        proxy.scrollTo(messages[messages.count - 1])
                    }
                }
            }
            .contentMargins(.bottom, 20.0)
            Divider()
                .padding(.bottom)
            MessageInputField(text: $messageDraft) { message in
                messages.append(Message(id: UUID(),
                                        body: message,
                                        title: "",
                                        senderDisplayName: "You",
                                        senderId: UUID()))
            }
        }
    }
}

struct MessageBubble: View {
    var isOP: Bool
    var messageContent: String
    
    var body: some View {
        ZStack {
            HStack {
                isOP ? Spacer() : nil
                Text(messageContent)
                    .padding()
                    .foregroundStyle(isOP ? .white : .black,
                                     isOP ? .white : .black)
                    .background(isOP
                                ? .blue
                                : Color(red: 210/255, green: 210/255, blue: 210/255)
                    )
                    .clipShape(MessageBubbleShape(direction: isOP ? .right : .left))
                isOP ? nil : Spacer()
            }
        }
        .padding((isOP ? .leading : .trailing), 90.0)
        
    }
}

struct MessageInputField: View {
    @Binding var text: String
    var send: (String) -> Void
    var body: some View {
        HStack {
            TextField("Message", text: $text)
                .onSubmit {
                    send(text)
                    text = ""
                }
            Button(action: {
                send(text)
                text = ""
            }, label: {
                Image(systemName: "arrow.up.circle.fill")
            })
        }
        .padding()
        .background(.quaternary)
        .clipShape(RoundedRectangle(cornerRadius: 18.0))
        .padding(.horizontal)
    }
}

struct MessageBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            p.addLine(to: CGPoint(x: 21, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 20),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 4, y: 8))
            p.addLine(to: CGPoint(x: 4, y: height - 11))
            p.addCurve(to: CGPoint(x: 0, y: height),
                       control1: CGPoint(x: 4, y: height - 1),
                       control2: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                       control1: CGPoint(x: 4.0, y: height + 0.5),
                       control2: CGPoint(x: 8, y: height - 1))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 16, y: height),
                       control2: CGPoint(x: 20, y: height))
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}

#Preview {
    ChatView()
}

