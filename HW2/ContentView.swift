//
//  ContentView.swift
//  HW2
//
//  Created by user19 on 2025/10/1.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: 13)
                Image("meow1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48)
                    .clipShape(Circle())
                SearchView()

            }
            HStack {
                Text("直播")
                Text("推薦")
                Text("熱門")
                Text("動畫")
                Text("影視")
            }
            ScrollView {
                HStack{
                    VideoView(VideoTitle: "123", Publisher: "123", VideoImage: Image("Test1"))
                    VideoView(VideoTitle: "123", Publisher: "123", VideoImage: Image("Test1"))
                }
                HStack{
                    VideoView(VideoTitle: "123", Publisher: "123", VideoImage: Image("meow1"))
                    VideoView(VideoTitle: "123", Publisher: "123", VideoImage: Image("meow1"))
                }
                HStack{
                    VideoView(VideoTitle: "123", Publisher: "123", VideoImage: Image("Test"))
                    VideoView(VideoTitle: "123", Publisher: "123", VideoImage: Image("Test"))
                }

                
            }
            .padding(10)
            .background(Color(.secondarySystemBackground))
            HStack {
                Text("首頁")
                Text("關注")
                Text("+")
                Text("訊息")
                Text("我的")
            }
            .padding(10)
        }
    }
}

struct SearchView: View {
    @State var search: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("搜尋", text: $search)
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
        .padding(7)
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(10)
    }
}

struct VideoView: View {
    var VideoTitle: String = ""
    var Publisher: String = ""
    var VideoImage: Image
    init(VideoTitle: String, Publisher: String, VideoImage: Image) {
        self.VideoTitle = VideoTitle
        self.Publisher = Publisher
        self.VideoImage = VideoImage
    }
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    private var backgroundColor : Color {
        colorScheme == .dark ? Color.black: Color.white
    }
    private var fontColor : Color {
        colorScheme == .dark ? Color.white: Color.black
    }
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                VideoImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 120)
                    .clipped()
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundStyle(.white)
                            .font(Font.system(size: 8))
                            .padding(3)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(style: StrokeStyle(lineWidth: 1.5))
                                    .foregroundStyle(.white)
                            }
                        Text("73.1萬")
                            .font(Font.system(size: 14))
                            .foregroundStyle(.white)
                        Image(systemName: "list.dash.header.rectangle")
                            .foregroundStyle(.white)
                        Text("196")
                            .font(Font.system(size: 14))
                            .foregroundStyle(.white)
                        Spacer()
                        Text("1:12")
                            .font(Font.system(size: 14))
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 10)
                }
            }
                
            Text(VideoTitle)
            HStack {
                Text("UP")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 10))
                    .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1.5)
                    )
                Text(Publisher)
                    .foregroundColor(.secondary)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.secondary)
                    .rotationEffect(.degrees(90))
            }
            .padding()
        }
        .padding(1)
        .background(backgroundColor)
        .cornerRadius(10)
        
    }
}



#Preview {

    ContentView()
}
