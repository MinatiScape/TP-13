package com.adobe.xmp;

import java.util.GregorianCalendar;
import java.util.TimeZone;
/* loaded from: classes.dex */
public interface XMPDateTime extends Comparable {
    GregorianCalendar getCalendar();

    int getDay();

    int getHour();

    int getMinute();

    int getMonth();

    int getNanoSecond();

    int getSecond();

    TimeZone getTimeZone();

    int getYear();
}
