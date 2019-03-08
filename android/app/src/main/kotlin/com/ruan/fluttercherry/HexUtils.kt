package com.ruan.fluttercherry


/**
 * 二进制和16进制的相互装换
 */
object HexUtils {
    /**
     * 十六进制String转换成Byte[]
     * @param hexString the hex string
     * *
     * @return byte[]
     */
    fun hexStringToBytes(string: String): ByteArray {
        var hexString = string.toUpperCase()
        val length = hexString.length / 2
        val hexChars = hexString.toCharArray()
        val d = ByteArray(length)
        for (i in 0 until length) {
            val pos = i * 2
            d[i] = (charToByte(hexChars[pos]).toInt() shl 4 or charToByte(hexChars[pos + 1]).toInt()).toByte()
        }
        return d
    }

    private fun charToByte(c: Char): Byte {
        return "0123456789ABCDEF".indexOf(c).toByte()
    }

    /* 这里我们可以将byte转换成int，然后利用Integer.toHexString(int)来转换成16进制字符串。
      * @param src byte[] data
      * @return hex string
      */
    fun bytesToHexString(src: ByteArray): String {
        val stringBuilder = StringBuilder("")
        if (src.isEmpty()) { return "" }
        for (i in 0 until src.size) {
            val v = src[i].toInt() and 0xFF
            val hv = Integer.toHexString(v)
            if (hv.length < 2) {
                stringBuilder.append(0)
            }
            stringBuilder.append(hv)
        }
        return stringBuilder.toString()
    }
}