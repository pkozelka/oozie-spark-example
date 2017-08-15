class SparkFileCopy{
  def main(args: Array[String]): Unit = {
    if(args.length < 2) {
      System.err.println("Usage: SparkFileCopy <file> <file>")
      System.exit(1)
    }
    val input = args(0)
    val output = args(1)

    import org.apache.spark._

    val conf = new SparkConf().setAppName("Oozie Example Spark Job")
    val sc = new SparkContext(conf)

    val lines = sc.textFile(input)
    lines.saveAsTextFile(output)

    sc.stop()

  }
}