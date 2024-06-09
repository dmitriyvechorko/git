import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.CsvSource
import java.nio.ByteBuffer

class ConverterTest {

    @ParameterizedTest
    @CsvSource(
        "-8,11111111111111111111111111111000",
        "-7,11111111111111111111111111111001",
        "-6,11111111111111111111111111111010",
        "-5,11111111111111111111111111111011",
        "-4,11111111111111111111111111111100",
        "-3,11111111111111111111111111111101",
        "-2,11111111111111111111111111111110",
        "-1,11111111111111111111111111111111",
        "0,00000000000000000000000000000000",
        "1,00000000000000000000000000000001",
        "2,00000000000000000000000000000010",
        "3,00000000000000000000000000000011",
        "4,00000000000000000000000000000100",
        "5,00000000000000000000000000000101",
        "6,00000000000000000000000000000110",
        "7,00000000000000000000000000000111",
    )
    fun testTwosComplement(int: Int, result: String) {
        assertEquals(int.cb.toString(), result)
    }

    @Test
    fun testTwoComplementInt() {
        for (i in -1000..1000) {
            assertEquals(i, i.cb.int)
        }
    }

    @Test
    fun testTwoComplementMinus() {
        for (i in -1000..1000) {
            assertEquals(-i, (-(i.cb)).int)
        }
    }

    @Test
    fun testDirectInt() {
        for (i in -1000..1000) {
            assertEquals(i, i.db.int)
        }
    }

    @Test
    fun testDirectMinus() {
        for (i in -1000..1000) {
            assertEquals(-i, (-(i.db)).int)
        }
    }

    @Test
    fun testInverseInt() {
        for (i in -1000..1000) {
            assertEquals(i, i.ib.int)
        }
    }

    @Test
    fun testInverseMinus() {
        for (i in -1000..1000) {
            assertEquals(-i, (-(i.ib)).int)
        }
    }

    @ParameterizedTest
    @CsvSource(
        "-7,11111111111111111111111111111000",
        "-6,11111111111111111111111111111001",
        "-5,11111111111111111111111111111010",
        "-4,11111111111111111111111111111011",
        "-3,11111111111111111111111111111100",
        "-2,11111111111111111111111111111101",
        "-1,11111111111111111111111111111110",
        "0,00000000000000000000000000000000",
        "1,00000000000000000000000000000001",
        "2,00000000000000000000000000000010",
        "3,00000000000000000000000000000011",
        "4,00000000000000000000000000000100",
        "5,00000000000000000000000000000101",
        "6,00000000000000000000000000000110",
        "7,00000000000000000000000000000111",
        "21,00000000000000000000000000010101",
        "-10,11111111111111111111111111110101"
    )
    fun testInverseBinary(int: Int, result: String) {
        assertEquals(int.ib.toString(), result)
    }

    @ParameterizedTest
    @CsvSource(
        "-7,10000000000000000000000000000111",
        "-6,10000000000000000000000000000110",
        "-5,10000000000000000000000000000101",
        "-4,10000000000000000000000000000100",
        "-3,10000000000000000000000000000011",
        "-2,10000000000000000000000000000010",
        "-1,10000000000000000000000000000001",
        "0,00000000000000000000000000000000",
        "1,00000000000000000000000000000001",
        "2,00000000000000000000000000000010",
        "3,00000000000000000000000000000011",
        "4,00000000000000000000000000000100",
        "5,00000000000000000000000000000101",
        "6,00000000000000000000000000000110",
        "7,00000000000000000000000000000111",
    )
    fun testDirectBinary(int: Int, result: String) {
        assertEquals(int.db.toString(), result)
    }

    @Test
    fun testFloatingPoint() {
        assertEquals("01000000010010001111010111000011", (3.14f).fp.toString())
    }

}