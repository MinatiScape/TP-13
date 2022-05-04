package com.google.photos.base;

import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.io.BaseEncoding;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes.dex */
public class ImageUrlOptionsStringBuilder {
    public static final Joiner OPTION_JOINER = new Joiner("-");
    public ParsedImageUrlOptions$Builder options = new ParsedImageUrlOptions$Builder(null);

    public ImageUrlOptionsStringBuilder setSize(int value, boolean sign) {
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        Integer valueOf = Integer.valueOf(value);
        ImageUrlOptionsEnum imageUrlOptionsEnum = ImageUrlOptionsEnum.SIZE;
        parsedImageUrlOptions$Builder.setOptionWithReadableError(imageUrlOptionsEnum, valueOf, "Size");
        this.options.setIsSigned(imageUrlOptionsEnum, sign);
        return this;
    }

    public String toString(String prefix, boolean signedOnly) {
        int i;
        Map.Entry<ImageUrlOptionsEnum, ImageUrlOptionsParsing$TokenInfo> entry;
        String str;
        String str2;
        String str3;
        int i2;
        ParsedImageUrlOptions$Builder parsedImageUrlOptions$Builder = this.options;
        String str4 = parsedImageUrlOptions$Builder.existingOptionString;
        Map<ImageUrlOptionsEnum, ImageUrlOptionsParsing$TokenInfo> map = parsedImageUrlOptions$Builder.existingOptionTokenInfoMap;
        Map<ImageUrlOptionsEnum, ParsedImageUrlOptions$OptionState> map2 = parsedImageUrlOptions$Builder.newOptionMap;
        if (map2.size() == 0 && !signedOnly) {
            return str4.isEmpty() ? "" : str4.length() != 0 ? prefix.concat(str4) : new String(prefix);
        }
        ArrayList arrayList = new ArrayList();
        Iterator<Map.Entry<ImageUrlOptionsEnum, ImageUrlOptionsParsing$TokenInfo>> it = map.entrySet().iterator();
        Iterator<Map.Entry<ImageUrlOptionsEnum, ParsedImageUrlOptions$OptionState>> it2 = map2.entrySet().iterator();
        Character ch = null;
        Map.Entry<ImageUrlOptionsEnum, ImageUrlOptionsParsing$TokenInfo> next = it.hasNext() ? it.next() : null;
        Map.Entry<ImageUrlOptionsEnum, ParsedImageUrlOptions$OptionState> next2 = it2.hasNext() ? it2.next() : null;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (next == null && next2 == null) {
                if (i3 != 0) {
                    arrayList.add(str4.substring(i4, i4));
                }
                if (arrayList.isEmpty()) {
                    return "";
                }
                String valueOf = String.valueOf(OPTION_JOINER.join(arrayList));
                return valueOf.length() != 0 ? prefix.concat(valueOf) : new String(prefix);
            }
            int i5 = 1;
            if (next2 == null) {
                i = 1;
            } else if (next == null) {
                i = i4;
            } else {
                int compareTo = next.getKey().compareTo(next2.getKey());
                i = compareTo < 0 ? 1 : i4;
                if (compareTo == 0) {
                    next = ch;
                }
            }
            if (i != 0) {
                ImageUrlOptionsParsing$TokenInfo value = next.getValue();
                if (signedOnly) {
                    Objects.requireNonNull(value);
                    i2 = i4;
                } else {
                    i2 = 1;
                }
                if (i2 == 0 || i3 != 0) {
                    if (i2 != 0) {
                        Objects.requireNonNull(value);
                    }
                    if (i3 != 0) {
                        arrayList.add(str4.substring(i4, i4));
                        i3 = i4;
                    }
                    if (i2 != 0) {
                        Objects.requireNonNull(value);
                    } else {
                        i5 = i3;
                    }
                } else {
                    Objects.requireNonNull(value);
                }
                i3 = i5;
                entry = ch;
            } else {
                ImageUrlOptionsEnum key = next2.getKey();
                ParsedImageUrlOptions$OptionState value2 = next2.getValue();
                if (!signedOnly || value2.signed) {
                    if (i3 != 0) {
                        arrayList.add(str4.substring(i4, i4));
                        i3 = i4;
                    }
                    if (value2.value != null) {
                        if (value2.signed) {
                            str = key.getSignedOptionKey();
                        } else {
                            str = key.getOptionKey();
                        }
                        switch (key.getOptionType().ordinal()) {
                            case 0:
                                BaseEncoding.StandardBaseEncoding standardBaseEncoding = (BaseEncoding.StandardBaseEncoding) BaseEncoding.BASE64_URL;
                                Character ch2 = standardBaseEncoding.paddingChar;
                                BaseEncoding.StandardBaseEncoding standardBaseEncoding2 = standardBaseEncoding;
                                if (ch2 != null) {
                                    standardBaseEncoding2 = standardBaseEncoding.newInstance(standardBaseEncoding.alphabet, ch);
                                }
                                long longValue = ((Long) next2.getValue().value).longValue();
                                int i6 = 8;
                                byte[] bArr = new byte[8];
                                int i7 = 7;
                                while (i7 >= 0) {
                                    byte[] bArr2 = bArr;
                                    bArr2[i7] = (byte) (longValue & 255);
                                    i6 = 8;
                                    longValue >>= 8;
                                    i7--;
                                    bArr = bArr2;
                                }
                                byte[] bArr3 = bArr;
                                Objects.requireNonNull(standardBaseEncoding2);
                                Preconditions.checkPositionIndexes(0, i6, i6);
                                BaseEncoding.Alphabet alphabet = ((BaseEncoding.StandardBaseEncoding) standardBaseEncoding2).alphabet;
                                StringBuilder sb = new StringBuilder(IntMath.divide(i6, alphabet.bytesPerChunk, RoundingMode.CEILING) * alphabet.charsPerChunk);
                                try {
                                    standardBaseEncoding2.encodeTo(sb, bArr3, 0, i6);
                                    str3 = sb.toString();
                                    i4 = 0;
                                    str2 = str3;
                                    break;
                                } catch (IOException e) {
                                    throw new AssertionError(e);
                                }
                            case 1:
                                str2 = "";
                                break;
                            case 2:
                                str2 = ((String) next2.getValue().value).replace(';', ':');
                                break;
                            case 3:
                                str2 = ((Integer) next2.getValue().value).toString();
                                break;
                            case 4:
                                str2 = ((Long) next2.getValue().value).toString();
                                break;
                            case 5:
                                str2 = ((Float) next2.getValue().value).toString();
                                break;
                            case 6:
                                Object[] objArr = new Object[1];
                                objArr[i4] = Integer.valueOf(((Integer) next2.getValue().value).intValue());
                                String valueOf2 = String.valueOf(String.format("%08x", objArr));
                                if (valueOf2.length() == 0) {
                                    str3 = new String("0x");
                                    str2 = str3;
                                    break;
                                } else {
                                    str2 = "0x".concat(valueOf2);
                                    break;
                                }
                            default:
                                String valueOf3 = String.valueOf(key.getOptionType());
                                throw new IllegalStateException(FakeDrag$$ExternalSyntheticOutline0.m(valueOf3.length() + 24, "OptionType ", valueOf3, " not handled."));
                        }
                        String valueOf4 = String.valueOf(str);
                        String valueOf5 = String.valueOf(str2);
                        arrayList.add(valueOf5.length() != 0 ? valueOf4.concat(valueOf5) : new String(valueOf4));
                    }
                }
                next2 = null;
                entry = next;
            }
            next = (entry != null || !it.hasNext()) ? entry : it.next();
            if (next2 == null && it2.hasNext()) {
                next2 = it2.next();
            }
            ch = null;
        }
    }
}
