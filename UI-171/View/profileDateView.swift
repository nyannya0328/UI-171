//
//  profileDateView.swift
//  UI-171
//
//  Created by にゃんにゃん丸 on 2021/04/30.
//

import SwiftUI

struct profileDateView: View {
    @EnvironmentObject var model : MainViewModel
    @GestureState var offset : CGFloat = 0
    var animation : Namespace.ID
    var body: some View {
        ZStack(alignment:.top){
            
            if model.selectedProfile != nil{
                
                if model.showEnlargeImage{
                    
                    Image(model.selectedProfile.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: model.selectedProfile.id, in: animation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .offset(y:model.offset)
                        .gesture(DragGesture().updating($offset, body: { value, out, _ in
                            out = value.translation.height
                        }).onEnded({ value in
                            
                            let offset = model.offset > 0 ? model.offset : -model.offset
                            
                            withAnimation{
                                
                                if offset > 200{
                                    
                                    
                                    model.showProfile.toggle()
                                    model.showEnlargeImage.toggle()
                                    model.selectedProfile = nil
                                }
                                model.offset = 0
                                
                            }
                            
                        }))
                        .background(Color.gray.opacity(getopacity()).ignoresSafeArea())
                        
                    
                    HStack{
                        
                        Button(action: {
                            
                            model.showProfile.toggle()
                            model.selectedProfile = nil
                            
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(.white)
                        })
                        
                        Text(model.selectedProfile.username)
                            .font(.title2)
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "TEXT\(model.selectedProfile.id)", in: animation)
                        
                        Spacer()
                            
                    }
                    .padding()
                    
                    
                }
                
                else{
                    
                    Button(action: {
                        
                        withAnimation(.easeOut){
                            
                            model.showEnlargeImage.toggle()
                        }
                        
                    }, label: {
                        Image(model.selectedProfile.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay(TitleView(profile: model.selectedProfile, animation: animation),alignment: .top)
                    })
                        .overlay(ButtonActions(),alignment: .bottom)
                        .matchedGeometryEffect(id: model.selectedProfile.id, in: animation)
                        .frame(width: 300, height: 300)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.primary.opacity(0.3).ignoresSafeArea())
                        .onTapGesture {
                            withAnimation{
                                
                                model.showProfile.toggle()
                                model.selectedProfile = nil
                                
                            }
                        }
                    
                }
                
              
            }
        }
        .onChange(of:offset, perform: { value in
            
            model.offset = offset
            
        })
    }
    func getopacity()->Double{
        
        let offset = model.offset > 0 ? model.offset : -model.offset
        let progress = offset / 200
        return 1-Double(progress)
        
    }
}

struct profileDateView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView : View {
    
    
    var profile : profile
    
    var animation : Namespace.ID
    var body: some View{
        
        Text(profile.username)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .matchedGeometryEffect(id: "TEXT\(profile.id)", in: animation)
            .frame(maxWidth: .infinity,alignment: .leading)
            .lineLimit(1)
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.3))
        
        
            
        
        
    }
}

struct ButtonActions : View {
    var body: some View{
        
        HStack{
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "message.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "info.circle.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
            })
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
        
    }
}
