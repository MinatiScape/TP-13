package com.adobe.xmp.impl;

import com.adobe.xmp.XMPDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;
/* loaded from: classes.dex */
public class XMPDateTimeImpl implements XMPDateTime {
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

    @Override // java.lang.Comparable
    public int compareTo(Object dt) {
        XMPDateTime xMPDateTime = (XMPDateTime) dt;
        long timeInMillis = getCalendar().getTimeInMillis() - xMPDateTime.getCalendar().getTimeInMillis();
        if (timeInMillis != 0) {
            return (int) (timeInMillis % 2);
        }
        return (int) ((this.nanoSeconds - xMPDateTime.getNanoSecond()) % 2);
    }

    @Override // com.adobe.xmp.XMPDateTime
    public Calendar getCalendar() {
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

    @Override // com.adobe.xmp.XMPDateTime
    public int getDay() {
        return this.day;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public int getHour() {
        return this.hour;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public int getMinute() {
        return this.minute;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public int getMonth() {
        return this.month;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public int getNanoSecond() {
        return this.nanoSeconds;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public int getSecond() {
        return this.second;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public TimeZone getTimeZone() {
        return this.timeZone;
    }

    @Override // com.adobe.xmp.XMPDateTime
    public int getYear() {
        return this.year;
    }

    public void setDay(int day) {
        if (day < 1) {
            this.day = 1;
        } else if (day > 31) {
            this.day = 31;
        } else {
            this.day = day;
        }
    }

    public void setHour(int hour) {
        this.hour = Math.min(Math.abs(hour), 23);
    }

    public void setMinute(int minute) {
        this.minute = Math.min(Math.abs(minute), 59);
    }

    public void setMonth(int month) {
        if (month < 1) {
            this.month = 1;
        } else if (month > 12) {
            this.month = 12;
        } else {
            this.month = month;
        }
    }

    public void setNanoSecond(int nanoSecond) {
        this.nanoSeconds = nanoSecond;
    }

    public void setSecond(int second) {
        this.second = Math.min(Math.abs(second), 59);
    }

    public void setTimeZone(TimeZone timeZone) {
        this.timeZone = timeZone;
    }

    public void setYear(int year) {
        this.year = Math.min(Math.abs(year), 9999);
    }

    public String toString() {
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
}
