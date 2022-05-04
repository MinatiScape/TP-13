.class public final Lcom/adobe/xmp/impl/ISO8601Converter;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static render(Lcom/adobe/xmp/XMPDateTime;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dateTime"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 2
    new-instance v1, Ljava/text/DecimalFormat;

    new-instance v2, Ljava/text/DecimalFormatSymbols;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v2, v3}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    const-string v3, "0000"

    invoke-direct {v1, v3, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    .line 3
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getYear()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getMonth()I

    move-result v2

    if-nez v2, :cond_0

    .line 5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string v2, "\'-\'00"

    .line 6
    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 7
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getMonth()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 8
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getDay()I

    move-result v2

    if-nez v2, :cond_1

    .line 9
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 10
    :cond_1
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getDay()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getHour()I

    move-result v2

    if-nez v2, :cond_2

    .line 12
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getMinute()I

    move-result v2

    if-nez v2, :cond_2

    .line 13
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getSecond()I

    move-result v2

    if-nez v2, :cond_2

    .line 14
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getNanoSecond()I

    move-result v2

    if-nez v2, :cond_2

    .line 15
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    const/16 v2, 0x54

    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const-string v2, "00"

    .line 17
    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 18
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getHour()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v2, 0x3a

    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 20
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getMinute()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 21
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getSecond()I

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getNanoSecond()I

    move-result v2

    if-eqz v2, :cond_4

    .line 22
    :cond_3
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getSecond()I

    move-result v2

    int-to-double v2, v2

    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getNanoSecond()I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v4, v6

    add-double/2addr v4, v2

    const-string v2, ":00.#########"

    .line 23
    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 24
    invoke-virtual {v1, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 25
    :cond_4
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 26
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 27
    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object p0

    invoke-virtual {p0, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result p0

    if-nez p0, :cond_5

    const/16 p0, 0x5a

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_5
    const v2, 0x36ee80

    .line 29
    div-int v3, p0, v2

    .line 30
    rem-int/2addr p0, v2

    const v2, 0xea60

    div-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    const-string v2, "+00;-00"

    .line 31
    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    int-to-long v2, v3

    .line 32
    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, ":00"

    .line 33
    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    int-to-long v2, p0

    .line 34
    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 35
    :cond_6
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
