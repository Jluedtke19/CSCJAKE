class Triangle(e0 : Vertex, e1 : Vertex, e2 : Vertex){
  def fe = e0
  def se = e1
  def te = e2
  def getmid0 = new Vertex((e0.getX + e1.getX)/2, (e0.getY + e1.getY))
  def getmid1 = new Vertex((e1.getX + e2.getX)/2, (e0.getY + e1.getY))
  def getmid2 = new Vertex((e2.getX + e0.getX)/2, (e2.getY + e0.getY))
  def len =  Math.sqrt(Math.pow((e1.getX - e0.getX),2) + Math.pow((e1.getY - e0.getY),2))
}

object Triangle{
  def main(args: Array[String]): Unit = {
    def test0 = new Vertex(1, 1.5)
    def test1 = new Vertex(2, 0)
    def test2 = new Vertex(0, 0)
    def testTriangle = new Triangle(test0, test1, test2)
    println(testTriangle.getmid0.getY)
    println(testTriangle.len)
  }
}

