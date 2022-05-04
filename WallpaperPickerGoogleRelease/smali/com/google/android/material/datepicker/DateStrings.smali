.class public Lcom/google/android/material/datepicker/DateStrings;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getDateString(J)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-static {p0, p1, v0}, Lcom/google/android/material/datepicker/DateStrings;->getDateString(JLjava/text/SimpleDateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDateString(JLjava/text/SimpleDateFormat;)Ljava/lang/String;
    .locals 2

    .line 2
    invoke-static {}, Lcom/google/android/material/datepicker/UtcDates;->getTodayCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 3
    invoke-static {}, Lcom/google/android/material/datepicker/UtcDates;->getUtcCalendar()Ljava/util/Calendar;

    move-result-object v1

    .line 4
    invoke-virtual {v1, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    if-eqz p2, :cond_0

    .line 5
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 6
    invoke-virtual {p2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p2, 0x1

    .line 7
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {v1, p2}, Ljava/util/Calendar;->get(I)I

    move-result p2

    if-ne v0, p2, :cond_1

    .line 8
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/google/android/material/datepicker/DateStrings;->getMonthDay(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 9
    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/google/android/material/datepicker/DateStrings;->getYearMonthDay(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMonthDay(JLjava/util/Locale;)Ljava/lang/String;
    .locals 1

    const-string v0, "MMMd"

    .line 1
    invoke-static {v0, p2}, Lcom/google/android/material/datepicker/UtcDates;->getAndroidFormat(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p2

    .line 2
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getYearMonthDay(JLjava/util/Locale;)Ljava/lang/String;
    .locals 1

    const-string v0, "yMMMd"

    .line 1
    invoke-static {v0, p2}, Lcom/google/android/material/datepicker/UtcDates;->getAndroidFormat(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p2

    .line 2
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
