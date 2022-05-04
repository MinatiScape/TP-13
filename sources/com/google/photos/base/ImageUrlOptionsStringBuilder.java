package com.google.photos.base;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.io.BaseEncoding;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes.dex */
public class ImageUrlOptionsStringBuilder {
    public static final Joiner OPTION_JOINER = new Joiner("-");
    public ParsedImageUrlOptions$Builder options = new ParsedImageUrlOptions$Builder();

    public final void setCenterCrop() {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        Boolean bool = Boolean.TRUE;
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.CENTER_CROP;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, bool, "CenterCrop");
        this.options.setIsSigned(imageUrlOptionsEnum, false);
    }

    public final void setHeight(int i) {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        Integer valueOf = Integer.valueOf(i);
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.HEIGHT;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, valueOf, "Height");
        this.options.setIsSigned(imageUrlOptionsEnum, false);
    }

    public final void setQualityBucket() {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.QUALITY_BUCKET;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, 1, "QualityBucket");
        this.options.setIsSigned(imageUrlOptionsEnum, false);
    }

    public final void setQualityLevel() {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.QUALITY_LEVEL;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, 90, "QualityLevel");
        this.options.setIsSigned(imageUrlOptionsEnum, false);
    }

    public final void setSize(int i) {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        Integer valueOf = Integer.valueOf(i);
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.SIZE;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, valueOf, "Size");
        this.options.setIsSigned(imageUrlOptionsEnum, false);
    }

    public final void setWidth(int i) {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        Integer valueOf = Integer.valueOf(i);
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.WIDTH;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, valueOf, "Width");
        this.options.setIsSigned(imageUrlOptionsEnum, false);
    }

    public final String toString(boolean z) {
        Map.Entry entry;
        Map.Entry entry2;
        int i;
        String str;
        String str2;
        String str3;
        int i2;
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        String str4 = parsedImageUrlOptions$Builder.existingOptionString;
        EnumMap enumMap = parsedImageUrlOptions$Builder.existingOptionTokenInfoMap;
        EnumMap enumMap2 = parsedImageUrlOptions$Builder.newOptionMap;
        if (enumMap2.size() != 0 || z) {
            ArrayList arrayList = new ArrayList();
            Iterator it = enumMap.entrySet().iterator();
            Iterator it2 = enumMap2.entrySet().iterator();
            if (it.hasNext()) {
                entry = (Map.Entry) it.next();
            } else {
                entry = null;
            }
            if (it2.hasNext()) {
                entry2 = (Map.Entry) it2.next();
            } else {
                entry2 = null;
            }
            int i3 = 0;
            int i4 = 0;
            while (true) {
                if (entry == null && entry2 == null) {
                    if (i3 != 0) {
                        arrayList.add(str4.substring(i4, i4));
                    }
                    if (arrayList.isEmpty()) {
                        return "";
                    }
                    String valueOf = String.valueOf(OPTION_JOINER.join(arrayList));
                    if (valueOf.length() != 0) {
                        return "".concat(valueOf);
                    }
                    return new String("");
                }
                int i5 = 1;
                if (entry2 == null) {
                    i = 1;
                } else if (entry == null) {
                    i = i4;
                } else {
                    int compareTo = ((ImageUrlOptionsEnum) entry.getKey()).compareTo((ImageUrlOptionsEnum) entry2.getKey());
                    if (compareTo < 0) {
                        i = 1;
                    } else {
                        i = i4;
                    }
                    if (compareTo == 0) {
                        entry = null;
                    }
                }
                if (i != 0) {
                    ImageUrlOptionsParsing$TokenInfo imageUrlOptionsParsing$TokenInfo = (ImageUrlOptionsParsing$TokenInfo) entry.getValue();
                    if (z) {
                        imageUrlOptionsParsing$TokenInfo.getClass();
                        i2 = i4;
                    } else {
                        i2 = 1;
                    }
                    if (i2 == 0 || i3 != 0) {
                        if (i2 != 0) {
                            imageUrlOptionsParsing$TokenInfo.getClass();
                        }
                        if (i3 != 0) {
                            arrayList.add(str4.substring(i4, i4));
                            i3 = i4;
                        }
                        if (i2 != 0) {
                            imageUrlOptionsParsing$TokenInfo.getClass();
                        } else {
                            i5 = i3;
                        }
                    } else {
                        imageUrlOptionsParsing$TokenInfo.getClass();
                    }
                    i3 = i5;
                    entry = null;
                } else {
                    ImageUrlOptionsEnum imageUrlOptionsEnum = (ImageUrlOptionsEnum) entry2.getKey();
                    ParsedImageUrlOptions$OptionState parsedImageUrlOptions$OptionState = (ParsedImageUrlOptions$OptionState) entry2.getValue();
                    if (!z || parsedImageUrlOptions$OptionState.signed) {
                        if (i3 != 0) {
                            arrayList.add(str4.substring(i4, i4));
                            i3 = i4;
                        }
                        if (parsedImageUrlOptions$OptionState.value != null) {
                            if (parsedImageUrlOptions$OptionState.signed) {
                                str = imageUrlOptionsEnum.getSignedOptionKey();
                            } else {
                                str = imageUrlOptionsEnum.getOptionKey();
                            }
                            switch (imageUrlOptionsEnum.getOptionType().ordinal()) {
                                case 0:
                                    BaseEncoding.Base64Encoding base64Encoding = BaseEncoding.BASE64_URL;
                                    Character ch = base64Encoding.paddingChar;
                                    BaseEncoding.StandardBaseEncoding standardBaseEncoding = base64Encoding;
                                    if (ch != null) {
                                        standardBaseEncoding = base64Encoding.newInstance(base64Encoding.alphabet);
                                    }
                                    long longValue = ((Long) ((ParsedImageUrlOptions$OptionState) entry2.getValue()).value).longValue();
                                    int i6 = 8;
                                    byte[] bArr = new byte[8];
                                    int i7 = 7;
                                    while (i7 >= 0) {
                                        bArr[i7] = (byte) (longValue & 255);
                                        longValue >>= 8;
                                        i7--;
                                        i4 = 0;
                                        i6 = 8;
                                    }
                                    int i8 = i6;
                                    Preconditions.checkPositionIndexes(i4, i8, i8);
                                    BaseEncoding.Alphabet alphabet = standardBaseEncoding.alphabet;
                                    StringBuilder sb = new StringBuilder(IntMath.divide(i8, alphabet.bytesPerChunk, RoundingMode.CEILING) * alphabet.charsPerChunk);
                                    try {
                                        standardBaseEncoding.encodeTo(sb, bArr, i8);
                                        str2 = sb.toString();
                                        break;
                                    } catch (IOException e) {
                                        throw new AssertionError(e);
                                    }
                                case 1:
                                    str2 = "";
                                    break;
                                case 2:
                                    str2 = ((String) ((ParsedImageUrlOptions$OptionState) entry2.getValue()).value).replace(';', ':');
                                    break;
                                case 3:
                                    str2 = ((Integer) ((ParsedImageUrlOptions$OptionState) entry2.getValue()).value).toString();
                                    break;
                                case 4:
                                    str2 = ((Long) ((ParsedImageUrlOptions$OptionState) entry2.getValue()).value).toString();
                                    break;
                                case 5:
                                    str2 = ((Float) ((ParsedImageUrlOptions$OptionState) entry2.getValue()).value).toString();
                                    break;
                                case 6:
                                    Object[] objArr = new Object[1];
                                    objArr[i4] = Integer.valueOf(((Integer) ((ParsedImageUrlOptions$OptionState) entry2.getValue()).value).intValue());
                                    String valueOf2 = String.valueOf(String.format("%08x", objArr));
                                    if (valueOf2.length() == 0) {
                                        str2 = new String("0x");
                                        break;
                                    } else {
                                        str2 = "0x".concat(valueOf2);
                                        break;
                                    }
                                default:
                                    String valueOf3 = String.valueOf(imageUrlOptionsEnum.getOptionType());
                                    throw new IllegalStateException(XMPNode$$ExternalSyntheticOutline0.m(valueOf3.length() + 24, "OptionType ", valueOf3, " not handled."));
                            }
                            String valueOf4 = String.valueOf(str);
                            String valueOf5 = String.valueOf(str2);
                            if (valueOf5.length() != 0) {
                                str3 = valueOf4.concat(valueOf5);
                            } else {
                                str3 = new String(valueOf4);
                            }
                            arrayList.add(str3);
                        }
                    }
                    entry2 = null;
                }
                if (entry == null && it.hasNext()) {
                    entry = (Map.Entry) it.next();
                }
                if (entry2 == null && it2.hasNext()) {
                    entry2 = (Map.Entry) it2.next();
                }
            }
        } else if (str4.isEmpty()) {
            return "";
        } else {
            if (str4.length() != 0) {
                return "".concat(str4);
            }
            return new String("");
        }
    }
}
