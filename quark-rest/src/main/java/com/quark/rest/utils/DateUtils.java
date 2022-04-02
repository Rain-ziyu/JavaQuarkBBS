package com.quark.rest.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    public static boolean JudgeSameDay(Date firstDate,Date secondDate){
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
        return fmt.format(firstDate).equals(fmt.format(secondDate));
    }
}
