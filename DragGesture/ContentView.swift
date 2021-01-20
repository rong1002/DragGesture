//
//  ContentView.swift
//  DragGesture
//
//  Created by Lin Bo Rong on 2021/1/20.
//

import SwiftUI

struct ContentView: View {    
    @State var choose = 1
    @State var color = Color.black
    @State var color1 = Color.green
    @State var color2 = Color.red
    @State var color3 = Color.yellow
    
    @State var circ = [shape]()
    @State var rec = [shape]()
    @State var trai = [shape]()
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                ForEach(0..<trai.count, id: \.self){ (item) in
                    
                    let magnificationGesture = MagnificationGesture()
                        .onChanged{ value in
                            trai[item].scale = trai[item].newScale * value.magnitude
                        }.onEnded { value in
                            trai[item].newScale = trai[item].scale
                        }
                    let rotationGesture = RotationGesture()
                        .onChanged{ angle in
                            trai[item].degrees = trai[item].newDegrees + angle.degrees
                        }.onEnded { angle in
                            trai[item].newDegrees = trai[item].degrees
                        }
                    
                    TriangleView(positionX: -30, positionY: -140, rotationDegrees: 0, width:100)
                        .foregroundColor(color2)
                        .offset(trai[item].offset)
                        .rotationEffect(Angle.degrees(trai[item].degrees))
                        .scaleEffect(trai[item].scale)
                        .gesture(
                            DragGesture()
                                .onChanged({(value) in
                                    trai[item].offset = CGSize(width: value.translation.width +  trai[item].newPosition.width, height: value.translation.height +  trai[item].newPosition.height)
                                }).onEnded({(value) in
                                    trai[item].newPosition =  trai[item].offset
                                })
                        )
                        .gesture(
                            SimultaneousGesture(magnificationGesture, rotationGesture)
                        )
                }
                ForEach(0..<circ.count, id: \.self){ (item) in
                    
                    let magnificationGesture = MagnificationGesture()
                        .onChanged{ value in
                            circ[item].scale = value.magnitude
                        }.onEnded { value in
                            circ[item].newScale = circ[item].scale
                        }
                    let rotationGesture = RotationGesture()
                        .onChanged{ angle in
                            circ[item].degrees = angle.degrees
                        }.onEnded { angle in
                            circ[item].newDegrees = circ[item].degrees
                        }
                    
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(color1)
                        .offset(circ[item].offset)
                        .rotationEffect(Angle.degrees(circ[item].degrees))
                        .scaleEffect(circ[item].scale)
                        .gesture(
                            DragGesture()
                                .onChanged({(value) in
                                    circ[item].offset = CGSize(width: value.translation.width +  circ[item].newPosition.width, height: value.translation.height +  circ[item].newPosition.height)
                                })
                                .onEnded({(value) in
                                    circ[item].newPosition =  circ[item].offset
                                })
                        )
                        .gesture(
                            SimultaneousGesture(magnificationGesture, rotationGesture)
                        )
                }
                
                ForEach(0..<rec.count, id: \.self){ (item) in
                    
                    let magnificationGesture = MagnificationGesture()
                        .onChanged{ value in
                            rec[item].scale = value.magnitude
                        }.onEnded { value in
                            rec[item].newScale = rec[item].scale
                        }
                    let rotationGesture = RotationGesture()
                        .onChanged{ angle in
                            rec[item].degrees = angle.degrees
                        }.onEnded { angle in
                            rec[item].newDegrees = rec[item].degrees
                        }
                    
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(color)
                        .scaleEffect(rec[item].scale)
                        .offset(rec[item].offset)
                        .rotationEffect(Angle.degrees(rec[item].degrees))
                        .gesture(
                            DragGesture()
                                .onChanged({(value) in
                                    rec[item].offset = CGSize(width: value.translation.width +  rec[item].newPosition.width, height: value.translation.height +  rec[item].newPosition.height)
                                })
                                .onEnded({(value) in
                                    rec[item].newPosition =  rec[item].offset
                                })
                        )
                        .gesture(
                            SimultaneousGesture(magnificationGesture, rotationGesture)
                        )
                }
                
                
                
            }
            HStack{
                Button(action: changeColor) {
                    Text("改變顏色")
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 74/255, green: 55/255, blue: 222/255), Color.init(red: 102/255, green: 191/255, blue: 244/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(15.0)
                }
                Button(action: triangle) {
                    Text("＋三角形")
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 74/255, green: 55/255, blue: 222/255), Color.init(red: 102/255, green: 191/255, blue: 244/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(15.0)
                }
                Button(action: addcircle) {
                    Text("＋圓形")
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 74/255, green: 55/255, blue: 222/255), Color.init(red: 102/255, green: 191/255, blue: 244/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(15.0)
                }
                Button(action: addrec ) {
                    Text("＋正方形")
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 74/255, green: 55/255, blue: 222/255), Color.init(red: 102/255, green: 191/255, blue: 244/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .foregroundColor(.white)
                        .cornerRadius(15.0)
                }
            }
        }
    }
    
    func changeColor(){
        if(choose == 1){
            color = Color.orange
            color1 = Color.gray
            color2 = Color.green
            color3 = Color.red
            choose = choose + 1
        }
        else if (choose == 2){
            color = Color.green
            color1 = Color.red
            color2 = Color.black
            color3 = Color.yellow
            choose = choose + 1
        }
        else if (choose == 3){
            color = Color.blue
            color1 = Color.yellow
            color2 = Color.red
            color3 = Color.blue
            choose = choose + 1
        }else{
            color = Color.pink
            color1 = Color.purple
            color2 = Color.green
            color3 = Color.gray
            choose = 1
        }
    }
    
    func addrec(){
        rec.append(shape(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))
    }
    func addcircle(){
        circ.append(shape(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))
    }
    func triangle(){
        trai.append(shape(offset: CGSize(width: 3, height: 3), newPosition: CGSize(width: 1, height: 1),degrees: 0))
    }
}

struct shape {
    var offset = CGSize.zero
    var newPosition = CGSize.zero
    var degrees: Double = 0
    var scale: CGFloat = 1
    var newScale: CGFloat = 1
    var newDegrees: Double = 0
}

struct circule: Shape {
    func path(in rect: CGRect) ->Path{
        Path{(path) in
            path.move(to:CGPoint(x: rect.width, y: 0))
            path.addQuadCurve(to: CGPoint(x :0, y: rect.height), control: CGPoint(x: rect.width/5, y: rect.height/5))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 0), control: CGPoint(x: rect.width*17/20, y: rect.height*13/15))
            path.closeSubpath()
            
        }
    }
}
struct triangle: Shape {
    func path(in rect: CGRect) ->Path{
        Path{ (path) in
            path.move(to:CGPoint(x: 45, y: 20))
            path.addLine(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 100))
            path.addLine(to: CGPoint(x: 45, y:20))
            
        }
    }
}

struct TriangleView: View {
    var positionX: CGFloat = 0
    var positionY: CGFloat = 0
    var rotationDegrees: Double = 0
    var width: CGFloat = 0
    var body: some View {
        triangle()
            .frame(width: width, height: width*2)
            .rotationEffect(.degrees(rotationDegrees))
            .offset(x: positionX, y: positionY)
            .shadow(radius: 10 )
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView()
        triangle()
    }
}
