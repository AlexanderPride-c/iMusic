//
//  Library.swift
//  iMusic
//
//  Created by Александр Прайд on 14.09.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import SwiftUI
import URLImage

struct Library: View {
    
    @State var tracks = UserDefaults.standard.saveTracks()
    @State private var showAlert = false
    @State private var track: SearchViewModel.Cell!
    
    var tabBarDelegate: MainTabBarControllerDelegate?
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            self.track = self.tracks[0]
                            self.tabBarDelegate?.maximizedTrackDetailController(viewModel: self.track)
                        }, label: {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9098039216, green: 0.2666666667, blue: 0.3529411765, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9181709285, green: 0.9272617298, blue: 0.9272617298, alpha: 1)))
                                .cornerRadius(10)
                        })
                        
                        Button(action: {
                            self.tracks = UserDefaults.standard.saveTracks()
                        }, label: {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9098039216, green: 0.2666666667, blue: 0.3529411765, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9181709285, green: 0.9272617298, blue: 0.9272617298, alpha: 1)))
                                .cornerRadius(10)
                        })
                    }
                }.padding().frame(height: 50)
                Divider().padding(.leading).padding(.trailing)
                
                List {
                    ForEach(tracks) { track in
                        LibraryCell(cell: track).gesture(LongPressGesture()
                            .onEnded{ _ in
                                print("Pressed!")
                                self.track = track
                                self.showAlert = true
                            }
                            .simultaneously(with: TapGesture()
                                .onEnded{ _ in
                                    let keyWindow = UIApplication.shared.connectedScenes
                                        .filter({ $0.activationState == .foregroundActive })
                                        .map({ $0 as? UIWindowScene })
                                        .compactMap({ $0 })
                                        .first?.windows
                                        .filter({$0.isKeyWindow}).first
                                 
                                    
                                    let tabBarVC = keyWindow?.rootViewController as? MainTabBarController
                                    tabBarVC?.trackDetailView.delegate = self
                                    
                                    self.track = track
                                    self.tabBarDelegate?
                                        .maximizedTrackDetailController(viewModel: self.track)
                                }))
                    }.onDelete(perform: delete)
                }
            }.actionSheet(isPresented: $showAlert, content: { ActionSheet(title: Text("Are you shure you want to delete this track?"), buttons: [.destructive(Text("Delete"), action: {
                print("Deleteing: \(self.track.trackName)")
                self.delete(track: self.track )
            }), .cancel()
            ])
            })
                
                .navigationBarTitle("Library")
        }
    }
    
    func delete(at offsets: IndexSet) {
        tracks.remove(atOffsets: offsets)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    
    func delete(track: SearchViewModel.Cell) {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return }
        tracks.remove(at: myIndex)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
}


struct LibraryCell: View {
    
    let cell: SearchViewModel.Cell
    
    var body: some View {
        HStack {
            URLImage(URL(string: cell.iconUrlString ?? "")!).frame(width: 60, height: 60).cornerRadius(2)
            VStack(alignment: .leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}

extension Library: TrackMovingDelegate {
    func moveBackForPreviosTrack() -> SearchViewModel.Cell? {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return nil }
        var nextTrack: SearchViewModel.Cell
        if myIndex - 1 == -1 {
            nextTrack = tracks[tracks.count - 1]
        } else {
            nextTrack = tracks[myIndex - 1]
        }
        self.track = nextTrack
        return nextTrack    }
    
    func moveForwardForPreviosTrack() -> SearchViewModel.Cell? {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return nil }
        var nextTrack: SearchViewModel.Cell
        if myIndex + 1 == tracks.count {
            nextTrack = tracks[0]
        } else {
            nextTrack = tracks[myIndex + 1]
        }
        self.track = nextTrack
        return nextTrack
    }
    
    
}
