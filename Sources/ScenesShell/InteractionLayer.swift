import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {

    let PlayBoundingRect = ClickBoundingRect(rect:Rect(size:Size(width:200, height:200)))
    
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
          
          // We insert our RenderableEntities in the constructor
          insert(entity: PlayBoundingRect, at: .front)
      }

      override func preSetup(canvasSize: Size, canvas: Canvas) {
          PlayBoundingRect.move(to:Point(x:canvasSize.center.x - 130, y: canvasSize.center.y - 200))
      }

   
    //  override func onClick(location:Point(x:100, y:100)) {
      
    //  }      
}
 
