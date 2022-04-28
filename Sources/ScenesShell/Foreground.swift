import Scenes
import Igis
import Foundation
  /*
     This class is responsible for rendering the foreground.
   */


class Foreground : RenderableEntity {
let Artwork: Image
    init() {
        guard let ArtworkURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/bae0c5a56b92b91.png") else {
            fatalError("Failed to create URL for Artwork. Have your servers been annihilated in nuclear fire?")
        }
        Artwork = Image(sourceURL:ArtworkURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Foreground")
        
        // We insert our RenderableEntities in the constructor
        
    }
    
    
    func DrawRectangle(x:Int, y:Int, Width: Int, Height: Int) -> Rectangle {
        let DrawnRectangle : Rectangle
        let rect = Rect(topLeft:Point(x:x, y:y), size: Size(width:Width, height:Height))
        DrawnRectangle = Rectangle(rect:rect, fillMode:.stroke)
        return DrawnRectangle
    }

    func DrawPlayArrow(TopLeft:Point, canvas:Canvas) {
        let ArrowFillColor = FillStyle(color:Color(.black))
        let ArrowBorderColor = StrokeStyle(color:Color(.black))
        let Arrow = Path(fillMode:.fillAndStroke)
        Arrow.moveTo(Point(x:TopLeft.x, y:TopLeft.y))
        Arrow.lineTo(Point(x:TopLeft.x + 50, y:TopLeft.y + 50))
        Arrow.lineTo(Point(x:TopLeft.x, y:TopLeft.y + 100))
        Arrow.lineTo(Point(x:TopLeft.x, y:TopLeft.y))
        let ArrowLineWidth = LineWidth(width:1)
        canvas.render(ArrowLineWidth, ArrowBorderColor, ArrowFillColor, Arrow)
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(Artwork)
    }
    override func render (canvas:Canvas) {
        if let CanvasSize = canvas.canvasSize {
            var BackRect = Rect(topLeft:Point(x:0, y:0), size:Size(width: CanvasSize.width, height: CanvasSize.height))
            var BackRectangle = Rectangle(rect:BackRect, fillMode:.fill)
            var FillColor = FillStyle(color:Color(.black))
            canvas.render(FillColor, BackRectangle)
            if Artwork.isReady {
                Artwork.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:CanvasSize.width, height:CanvasSize.height)))
                canvas.render(Artwork)
            } 

            DrawPlayArrow(TopLeft:Point(x:CanvasSize.width / 2 - 25, y: 5 * CanvasSize.height / 16 + 30), canvas:canvas)
            
        }        
    }    
 } 
