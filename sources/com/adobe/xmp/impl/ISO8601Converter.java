package com.adobe.xmp.impl;

import com.adobe.xmp.XMPDateTime;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
/* loaded from: classes.dex */
public final class ISO8601Converter {
    public static String render(XMPDateTime dateTime) {
        StringBuffer stringBuffer = new StringBuffer();
        DecimalFormat decimalFormat = new DecimalFormat("0000", new DecimalFormatSymbols(Locale.ENGLISH));
        stringBuffer.append(decimalFormat.format(dateTime.getYear()));
        if (dateTime.getMonth() == 0) {
            return stringBuffer.toString();
        }
        decimalFormat.applyPattern("'-'00");
        stringBuffer.append(decimalFormat.format(dateTime.getMonth()));
        if (dateTime.getDay() == 0) {
            return stringBuffer.toString();
        }
        stringBuffer.append(decimalFormat.format(dateTime.getDay()));
        if (!(dateTime.getHour() == 0 && dateTime.getMinute() == 0 && dateTime.getSecond() == 0 && dateTime.getNanoSecond() == 0 && (dateTime.getTimeZone() == null || dateTime.getTimeZone().getRawOffset() == 0))) {
            stringBuffer.append('T');
            decimalFormat.applyPattern("00");
            stringBuffer.append(decimalFormat.format(dateTime.getHour()));
            stringBuffer.append(':');
            stringBuffer.append(decimalFormat.format(dateTime.getMinute()));
            if (!(dateTime.getSecond() == 0 && dateTime.getNanoSecond() == 0)) {
                double nanoSecond = dateTime.getNanoSecond() / 1.0E9d;
                decimalFormat.applyPattern(":00.#########");
                stringBuffer.append(decimalFormat.format(nanoSecond + dateTime.getSecond()));
            }
            if (dateTime.getTimeZone() != null) {
                int offset = dateTime.getTimeZone().getOffset(dateTime.getCalendar().getTimeInMillis());
                if (offset == 0) {
                    stringBuffer.append('Z');
                } else {
                    int i = offset / 3600000;
                    int abs = Math.abs((offset % 3600000) / 60000);
                    decimalFormat.applyPattern("+00;-00");
                    stringBuffer.append(decimalFormat.format(i));
                    decimalFormat.applyPattern(":00");
                    stringBuffer.append(decimalFormat.format(abs));
                }
            }
        }
        return stringBuffer.toString();
    }
}
