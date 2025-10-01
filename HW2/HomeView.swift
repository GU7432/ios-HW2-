//
//  ContentView.swift
//  HW2
//
//  Created by user19 on 2025/10/1.
//

import SwiftUI
struct HomeView: View {
    var Videos: View = [
        VideoView(VideoTitle: "能点火？扛子弹？30年前的手机能干嘛？", Publisher: "影视飓风", VideoImage: Image("Video1"), duration: "16:23", viewCount: "179.2萬", commentCount: "1萬"),
        VideoView(VideoTitle: "IRIS OUT - 米津玄師 / 重音テトSV【SynthV cover】 [yasai31]", Publisher: "yasai31", VideoImage: Image("Video2"), duration: "02:29", viewCount: "17.6萬", commentCount: "266"),
        VideoView(VideoTitle: "史上最快大量数据传输方式，居然是卡车拉硬盘！", Publisher: "UGREEN绿联", VideoImage: Image("Video3"), duration: "04:09", viewCount: "3.7萬", commentCount: "156")
    ]
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
                    .foregroundColor(.gray)
                    .padding(10)
                Text("推薦")
                    .foregroundColor(.pink)
                    .padding(10)
                    .bold()
                    .overlay {
                        RoundedRectangle(cornerRadius: 100)
                            .frame(width: 25, height: 3)
                            .foregroundColor(.pink)
                            .offset(y: 15)
                    }
                Text("熱門")
                    .foregroundColor(.gray)
                    .padding(10)
                Text("動畫")
                    .foregroundColor(.gray)
                    .padding(10)
                Text("影視")
                    .foregroundColor(.gray)
                    .padding(10)
            }
            .font(Font.system(size: 20))
            ScrollView {
                ForEach(stride(from: 0, to: Videos.count, by: 2), id: \.self) { index in
                    HStack(spacing: 10) {
                        Videos[index]
                        if index + 1 < Videos.count {
                            Videos[index + 1]
                        }
                    }
                    .padding(.vertical, 0.5)
                }

            }
            .padding(10)
            .background(Color(.secondarySystemBackground))
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "house")
                        .font(Font.system(size: 25))
                    Text("首頁")
                        .font(Font.system(size: 14))
                }
                .foregroundColor(.pink)
                Spacer()
                VStack {
                    Image(systemName: "fan")
                        .font(Font.system(size: 25))
                    Text("關注")
                        .font(Font.system(size: 14))
                }
                .foregroundColor(.gray)
                Spacer()
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        LinearGradient (
                            gradient: Gradient(colors: [Color.pink, Color.pink.opacity(0.7)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    )
                Spacer()
                VStack {
                    Image(systemName: "message")
                        .font(Font.system(size: 25))
                    Text("訊息")
                        .font(Font.system(size: 14))
                }
                .foregroundColor(.gray)
                Spacer()
                VStack {
                    Image(systemName: "tv")
                        .font(Font.system(size: 25))
                    Text("我的")
                        .font(Font.system(size: 14))
                }
                .foregroundColor(.gray)
                Spacer()
            }
        }
    }
}

struct SearchView: View {
    @State var search: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("影视飓风", text: $search)
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
    var duration: String = ""
    var viewCount: String = ""
    var commentCount: String = ""
    
    init(VideoTitle: String, Publisher: String, VideoImage: Image, duration: String = "0:00", viewCount: String = "0", commentCount: String = "0") {
        self.VideoTitle = VideoTitle
        self.Publisher = Publisher
        self.VideoImage = VideoImage
        self.duration = duration
        self.viewCount = viewCount
        self.commentCount = commentCount
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
            ZStack {
                VideoImage
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 120)
                    .clipped()
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 10,
                                bottomLeading: 0,
                                bottomTrailing: 0,
                                topTrailing: 10
                            )
                        )
                    )
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
                        Text(viewCount)
                            .font(Font.system(size: 14))
                            .foregroundStyle(.white)
                        Image(systemName: "list.dash.header.rectangle")
                            .foregroundStyle(.white)
                        Text(commentCount)
                            .font(Font.system(size: 14))
                            .foregroundStyle(.white)
                        Spacer()
                        Text(duration)
                            .font(Font.system(size: 14))
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                }
            }
                
            Text(truncateTitle(VideoTitle, maxLength: 30))
                .lineLimit(2, reservesSpace: true)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
            
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
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
        }
        .background(backgroundColor)
        .cornerRadius(10)
        
    }
    
    private func truncateTitle(_ title: String, maxLength: Int) -> String {
        if title.count > maxLength {
            let index = title.index(title.startIndex, offsetBy: maxLength)
            return String(title[..<index]) + "..."
        }
        return title
    }
}



#Preview {
    HomeView()
}
