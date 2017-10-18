 object HelloWorld {
    def main(args: Array[String]) {
      println("Hello, world!")
      var leaky = List(1,2,3)
      println(leaky(0))
      var ar = Array(3 ,2 ,1 )
      var gdog = Array.ofDim[Int](3,3)
      println(gdog(2)(1))
    }
 }



