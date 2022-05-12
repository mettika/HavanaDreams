import Scenes
import Igis

class ClickBoundingRect : RenderableEntity, EntityMouseClickHandler {
    var Width: Int
    var Height: Int
    var rectangle: Rectangle
    init(rect:Rect) {
        Height = rect.size.height
        Width = rect.size.width
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        super.init(name:"ClickRect")
    }

    func onEntityMouseClick(globalLocation:Point) {
        let hitbox = rectangle.rect
        let containment = hitbox.containment(target:globalLocation)
        if !containment.intersection([.containedFully]).isEmpty {
            print("\(globalLocation.x) Degrees North, \(globalLocation.y) Degrees East. TARGET ACQUIRED.")
            director.enqueueScene(scene: TutorialSelectionScene())
            director.transitionToNextScene()
        }
        
    }
      
//       func GetRect() {
//           var BoundingRect = boundingRect(SelectedRectangle:Rect(size:rectangle.size))
//           onEntityMouseClick(globalLocation:Rect(size:rectangle.size).topLeft.x)
// //          rectangle.onEntityMouseClick(globalLocation:BoundingRect.topLeft)
//       }
    
     override func setup (canvasSize:Size, canvas:Canvas) {
          dispatcher.registerEntityMouseClickHandler(handler: self)
          } 

     override func render(canvas:Canvas) {
         let strokeStyle = StrokeStyle(color:Color(.blue))
         let fillStyle = FillStyle(color:Color(.black))
         canvas.render(strokeStyle, fillStyle, rectangle)
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
