package com.zzt.goodreads.utils;

/**
 * @Author ctynt
 * @Date 2023/9/25
 * @Description
 */

public class StringUtil {
    public static String subUri(String uri) {
        int position = uri.lastIndexOf("/");
        return uri.substring(position+1);

    }
}
