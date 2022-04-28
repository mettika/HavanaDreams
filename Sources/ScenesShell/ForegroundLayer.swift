import Scenes
import Igis

  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class ForegroundLayer : Layer {
      let foreground = Foreground()

      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Foreground")

          // We insert our RenderableEntities in the constructor
          insert(entity:foreground, at:.front)
      }
  }
