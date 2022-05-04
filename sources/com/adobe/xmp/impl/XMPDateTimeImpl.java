package com.adobe.xmp.impl;

import com.adobe.xmp.XMPDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;
/* loaded from: classes.dex */
public final class XMPDateTimeImpl implements XMPDateTime {
    public int day;
    public int hour;
    public int minute;
    public int month;
    public int nanoSeconds;
    public int second;
    public TimeZone timeZone;
    public int year;

    public XMPDateTimeImpl() {
        this.year = 0;
        this.month = 0;
        this.day = 0;
        this.hour = 0;
        this.minute = 0;
        this.second = 0;
        this.timeZone = TimeZone.getTimeZone("UTC");
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final GregorianCalendar getCalendar() {
        GregorianCalendar gregorianCalendar = (GregorianCalendar) Calendar.getInstance(Locale.US);
        gregorianCalendar.setGregorianChange(new Date(Long.MIN_VALUE));
        gregorianCalendar.setTimeZone(this.timeZone);
        gregorianCalendar.set(1, this.year);
        gregorianCalendar.set(2, this.month - 1);
        gregorianCalendar.set(5, this.day);
        gregorianCalendar.set(11, this.hour);
        gregorianCalendar.set(12, this.minute);
        gregorianCalendar.set(13, this.second);
        gregorianCalendar.set(14, this.nanoSeconds / 1000000);
        return gregorianCalendar;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object dt) {
        XMPDateTime xMPDateTime = (XMPDateTime) dt;
        long timeInMillis = getCalendar().getTimeInMillis() - xMPDateTime.getCalendar().getTimeInMillis();
        if (timeInMillis != 0) {
            return (int) (timeInMillis % 2);
        }
        return (int) ((this.nanoSeconds - xMPDateTime.getNanoSecond()) % 2);
    }

    public final void setHour(int hour) {
        this.hour = Math.min(Math.abs(hour), 23);
    }

    public final void setMinute(int minute) {
        this.minute = Math.min(Math.abs(minute), 59);
    }

    public final void setSecond(int second) {
        this.second = Math.min(Math.abs(second), 59);
    }

    public final void setYear(int year) {
        this.year = Math.min(Math.abs(year), 9999);
    }

    public final String toString() {
        return ISO8601Converter.render(this);
    }

    public XMPDateTimeImpl(Calendar calendar) {
        this.year = 0;
        this.month = 0;
        this.day = 0;
        this.hour = 0;
        this.minute = 0;
        this.second = 0;
        this.timeZone = TimeZone.getTimeZone("UTC");
        Date time = calendar.getTime();
        TimeZone timeZone = calendar.getTimeZone();
        GregorianCalendar gregorianCalendar = (GregorianCalendar) Calendar.getInstance(Locale.US);
        gregorianCalendar.setGregorianChange(new Date(Long.MIN_VALUE));
        gregorianCalendar.setTimeZone(timeZone);
        gregorianCalendar.setTime(time);
        this.year = gregorianCalendar.get(1);
        this.month = gregorianCalendar.get(2) + 1;
        this.day = gregorianCalendar.get(5);
        this.hour = gregorianCalendar.get(11);
        this.minute = gregorianCalendar.get(12);
        this.second = gregorianCalendar.get(13);
        this.nanoSeconds = gregorianCalendar.get(14) * 1000000;
        this.timeZone = gregorianCalendar.getTimeZone();
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getDay() {
        return this.day;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getHour() {
        return this.hour;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getMinute() {
        return this.minute;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getMonth() {
        return this.month;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getNanoSecond() {
        return this.nanoSeconds;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getSecond() {
        return this.second;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final TimeZone getTimeZone() {
        return this.timeZone;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public final int getYear() {
        return this.year;
    }
}
