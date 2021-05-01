//
//  RecentRowView.swift
//  UI-171
//
//  Created by にゃんにゃん丸 on 2021/04/30.
//

import SwiftUI

struct RecentRowView: View {
    @EnvironmentObject var model : MainViewModel
    var profile : profile
    var animation : Namespace.ID
    var body: some View {
        HStack{
            
            Button(action: {
                withAnimation{
                    
                    model.selectedProfile = profile
                    model.showProfile.toggle()
                }
                
                
            }, label: {
                ZStack{
                    
                    
                    
                    Image(profile.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                       
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    if !model.showProfile{
                        
                        Image(profile.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: profile.id, in: animation)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                
                VStack{
                    HStack{
                        
                        
                        VStack(alignment:.leading){
                            
                            Text(profile.username)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            
                            Text(profile.lastmsg)
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                            
                            
                        }
                        
                        
                         Spacer()
                        
                        Text(profile.time)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        
                    }
                    Divider()
                    
                    
                }
                
            })
            .buttonStyle(PlainButtonStyle())
            
            
            
        }
    }
}

struct RecentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


