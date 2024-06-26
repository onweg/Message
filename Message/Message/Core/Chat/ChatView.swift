//
//  ChatView.swift
//  Message
//
//  Created by Пользователь on 09.04.2024.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    
    var body: some View {
        VStack{
            ScrollView{
                
                VStack{
                    CircularProfileImageView_(user: User.MOCK_USER, size: .xLarge)
                    
                    VStack(spacing: 4){
                        Text(User.MOCK_USER.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messanger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                ForEach(0...15, id: \.self){message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
                
            }
            
            ZStack(alignment: .trailing){
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(15)
                    .font(.subheadline)
                
                Button{
                    print("send message")
                }label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
