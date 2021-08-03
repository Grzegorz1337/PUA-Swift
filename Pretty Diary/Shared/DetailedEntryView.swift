//
//  DetailedEntryView.swift
//  Pretty Diary
//
//  Created by Kamil Grzeczkowski on 03/08/2021.
//

import SwiftUI

struct DetailedEntryView: View {
    var item: Item
    @State var title: String = ""
    @State var content: String = ""
    
    init(wpis:Item?){
        self.item = wpis!
        self.title = wpis!.title ?? ""
        self.content = wpis!.content ?? ""
    }
    
    var body: some View {
        VStack{
            Text("Tekst z dnia: \(item.timestamp!)")
                .padding()
            TextField("Tytuł", text: self.$title)
                .padding()
                .font(.title)
                .onAppear {
                    self.title = item.title ?? ""
                }
                .onChange(of: self.title){ t in
                item.title = t
                try? item.managedObjectContext?.save()
            }
            TextEditor(text: self.$content)
                .padding()
                .background(Color.gray)
                .onAppear {
                    self.content = item.content ?? ""
                }
                .onChange(of: self.content){ c in
                item.content = c
                try? item.managedObjectContext?.save()
            }
            Spacer()
        }
    }
}

struct DetailedEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedEntryView(wpis: nil)
    }
}

