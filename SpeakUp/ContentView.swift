//
//  ContentView.swift
//  SpeakUp
//
//  Created by Julio Rico on 28/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataContoller = DataController()
    @State private var isShowingRecordSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(dataContoller.filtered, content: RecordingView.init)
                    .onDelete(perform: dataContoller.delete)
            }
            .searchable(text: $dataContoller.filter)
            .navigationTitle("Speak Up!")
            .toolbar {
                Button {
                    isShowingRecordSheet = true
                } label: {
                    Label("New recording", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isShowingRecordSheet, content: NewRecordingView.init)
            .environmentObject(dataContoller)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
