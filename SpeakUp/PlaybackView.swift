//
//  PlaybackView.swift
//  SpeakUp
//
//  Created by Julio Rico on 28/9/22.
//
import AVFoundation
import SwiftUI

struct PlaybackView: View {
    @State private var audioPlayer: AVAudioPlayer?
    let recording: Recording
    
    var body: some View {
        ScrollView {
            Text(recording.transcription)
                .padding()
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: play) {
                Label("Play recording", systemImage: "play")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
        }
        .navigationTitle(recording.date.formatted(date: .abbreviated, time: .shortened))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func play() {
        do {
            let url = URL.documentsDirectory.appending(path: recording.filename)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaybackView(recording: .example)
        }
    }
}
