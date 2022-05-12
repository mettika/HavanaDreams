import Scenes
import Igis

  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class TutorialSubjectLayer : Layer {
    let subject = Subject(rect:Rect(size:Size(width:175, height:50)))
    let NoTutorialSubject = noTutorialSubject(rect:Rect(size:Size(width:175, height:50)))

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Subject")

        // we insert our RenderableEntities in the constructor
        insert(entity:subject, at:.front)
    }

    override func preSetup(canvasSize: Size, canvas: Canvas) {
        subject.move(to:Point(x:canvasSize.center.x / 2, y: 7 *  canvasSize.center.y / 4))
        NoTutorialSubject.move(to:Point(x: (3  * canvasSize.center.x / 2) - 175, y: 7 * canvasSize.center.y / 4))
    }
}
