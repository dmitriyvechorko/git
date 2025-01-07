fun main() {
    println("Direct binary: ")
    println(21.db)
    println(-(21).db)
    println(13.db)
    println(-(13).db)
    println("Inversed binary: ")
    println(-(21).ib)
    println(-(13).ib)
    println("Complementary binary: ")
    println(-(21).cb)
    println(-(13).cb)
    println("Addition: ")
    println("Direct binary: ")
    println(21.db + 13.db)
    println((21.db + 13.db).int)
    println(-(21).db + 13.db)
    println((-(21).db + 13.db).int)
    println(-(21).db + -(13).db)
    println((-(21).db + -(13).db).int)
    println((21.db + -(13).db))
    println((21.db + -(13).db).int)
    println("Inversed binary: ")
    println(-(21).ib + 13.ib)
    println((-(21).ib + 13.ib).int)
    println(-(21).ib + -(13).ib)
    println((-(21).ib + -(13).ib).int)
    println("Complementary binary: ")
    println(-(21).cb + 13.cb)
    println((-(21).cb + 13.cb).int)
    println(-(21).cb + -(13).cb)
    println((-(21).cb + -(13).cb).int)
    println("Subtraction: ")
    println("Direct binary: ")
    println(21.db - 13.db)
    println((21.db - 13.db).int)
    println(-(21).db - 13.db)
    println((-(21).db - 13.db).int)
    println(-(21).db - -(13).db)
    println((-(21).db - -(13).db).int)
    println((21.db - -(13).db))
    println((21.db - -(13).db).int)
    println("Inversed binary: ")
    println(-(21).ib - 13.ib)
    println((-(21).ib - 13.ib).int)
    println(-(21).ib - -(13).ib)
    println((-(21).ib - -(13).ib).int)
    println("Complementary binary: ")
    println(-(21).cb - 13.cb)
    println((-(21).cb - 13.cb).int)
    println(-(21).cb - -(13).cb)
    println((-(21).cb - -(13).cb).int)
    println("Multiplication: ")
    println(21.db * 13.db)
    println((21.db * 13.db).int)
    println(-(21).db * 13.db)
    println((-(21).db * 13.db).int)
    println(-(21).db * -(13).db)
    println((-(21).db * -(13).db).int)
    println((21.db * -(13).db))
    println((21.db * -(13).db).int)
    println("Division: ")
    val res1 = 21.cb / 13.cb
    println("${res1.first},${res1.second}")
    val res2 = 21.cb / -(13).cb
    println("${res2.first},${res2.second}")
    val res3 = -(21).cb / -(13).cb
    println("${res3.first},${res3.second}")
    println("Floating point addition: ")
    println(13f.fp + 21f.fp)
    println((13f.fp + 21f.fp).equals(34f.fp))
}