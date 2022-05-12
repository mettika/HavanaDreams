import Scenes

  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */

class TutorialBackgroundLayer : Layer {
      let background = TutorialBackground()

      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"TutorialBackground")

          // We insert our RenderableEntities in the constructor
          insert(entity:background, at:.back)
      }
  }
