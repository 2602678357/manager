package com.util;

import java.util.UUID;

public class UUIDUtils {
    /**
     * 生成文件名
     * @return
     */
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }

}
