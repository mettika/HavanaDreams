import Scenes
import Igis
import Foundation

class Subject : RenderableEntity, EntityMouseClickHandler {
    var Width: Int
    var Height: Int
    var rectangle: Rectangle
    init(rect:Rect) {
        Height = rect.size.height
        Width = rect.size.width
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name:"ClickRect")
    }

    func DrawTutorialBox(canvasSize: Size, canvas: Canvas) {
        var BoxRectangle = DrawRectangle(x: canvasSize.center.x / 2, y: 7 * canvasSize.center.y / 4, Width:175, Height:50)
        var fillStyle = FillStyle(color:Color(.black))
        var strokeStyle = StrokeStyle(color:Color(.black))
        let  text = Text(location:Point(x: (canvasSize.center.x / 2) + 5, y: (7 * canvasSize.center.y / 4) + 30), text: "Tutorial")
        text.font = "18pt Courier"
        canvas.render(strokeStyle, fillStyle, BoxRectangle)
        fillStyle = FillStyle(color:Color(.white))
        strokeStyle = StrokeStyle(color:Color(.white))
        canvas.render(strokeStyle, fillStyle, text)
            
    }

        func onEntityMouseClick(globalLocation:Point) {
        let hitbox = rectangle.rect
        let containment = hitbox.containment(target:globalLocation)
        if !containment.intersection([.containedFully]).isEmpty {
            print("\(globalLocation.x) Degrees North, \(globalLocation.y) Degrees East. LAUNCH CODES AUTHENTICATED.")
            director.enqueueScene(scene: MainScene())
            director.transitionToNextScene()
        }
        
    }

    
    func DrawRectangle(x:Int, y:Int, Width: Int, Height: Int) -> Rectangle {
        let DrawnRectangle : Rectangle
        let rect = Rect(topLeft:Point(x:x, y:y), size: Size(width:Width, height:Height))
        DrawnRectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        return DrawnRectangle
    }

    override func setup (canvasSize:Size, canvas:Canvas) {
        dispatcher.registerEntityMouseClickHandler(handler:self)
    }

       override func render (canvas:Canvas) {
           if let CanvasSize = canvas.canvasSize {
               DrawTutorialBox(canvasSize: CanvasSize, canvas: canvas)
           }
       }

     override func boundingRect() -> Rect {
         return Rect(size: Size(width: Int.max, height: Int.max))
     }

    override func teardown() {
          dispatcher.unregisterEntityMouseClickHandler (handler: self)
      }
      
    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }

       
}
       
