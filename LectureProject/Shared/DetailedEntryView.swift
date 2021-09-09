//
//  DetailedEntryView.swift
//  Pretty Diary
//
//  Created by Kamil Grzeczkowski on 03/08/2021.
//

import SwiftUI

struct DetailedEntryView: View {
    var item: Item
    @State var name: String = ""
    @State var call: String = ""
    @State var email: String = ""
    @State var notes: String = ""
    @State var showImagePicker: Bool = false
    @State var image = UIImage()
    
    
    init(wpis:Item?, image:UIImage){
        self.item = wpis!
        self.name = item.name ?? "name"
        self.call = item.call ?? "phone_number"
        self.email = item.email ?? "example@icloud.com"
        self.notes = item.notes ?? ""
        self.image = image
    }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.showImagePicker.toggle()
                }, label: {
                    Image(uiImage: UIImage(data: item.image!)!)
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                        
                })
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        self.image = image
                        item.image = image.pngData()
                        try?
                            item.managedObjectContext?.save()
                    }
                }
                .cornerRadius(90)
                .padding()
                .font(.system(size: 75))
                TextField("name", text: self.$name)
                    .padding()
                    .background(Color.white)
                    .onAppear {
                        self.name = item.name ?? ""
                                    }
                    .onChange(of: self.name){ c in
                                    item.name = c
                                    try? item.managedObjectContext?.save()
                                }
                Spacer()
            }
            Text("Phone")
                .background(Color.gray)
            TextField("123 456 789", text: self.$call)
                .padding()
                .background(Color.white)
                .onAppear {
                    self.call = item.call ?? ""
                                }
                .onChange(of: self.call){ c in
                                item.call = c
                                try? item.managedObjectContext?.save()
                            }
            Text("Email")
                .background(Color.gray)
            TextField("example@icloud.com", text: self.$email)
                .padding()
                .background(Color.white)
                .onAppear {
                    self.email = item.email ?? ""
                                }
                .onChange(of: self.email){ c in
                                item.email = c
                                try? item.managedObjectContext?.save()
                            }
            Text("Notes")
            TextEditor(text: self.$notes)
                            .padding()
                            .background(Color.gray)
                            .onAppear {
                                self.notes = item.notes ?? ""
                            }
                            .onChange(of: self.notes){ c in
                            item.notes = c
                            try? item.managedObjectContext?.save()
                        }
            Spacer()
        }.background(Color.gray)
    }
}

struct DetailedEntryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedEntryView(wpis: nil, image: UIImage(systemName: "person.fill")!)
    }
}

