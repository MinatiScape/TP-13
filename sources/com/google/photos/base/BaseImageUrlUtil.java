package com.google.photos.base;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.android.systemui.flags.FlagManager;
import com.google.android.libraries.imageurl.FifeImageUrlUtil;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import com.google.common.collect.ObjectArrays;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public class BaseImageUrlUtil<T> {
    public static final ImmutableList<OptionInfo> OPTIONS;
    public static final Splitter SPLIT_ON_EQUALS;
    public static final Splitter SPLIT_ON_SLASH = Splitter.on('/');
    public static final Splitter SPLIT_ON_DASH = Splitter.on('-');
    public static final Joiner JOIN_ON_SLASH = new Joiner("/");
    public static final Joiner JOIN_ON_DASH = new Joiner("-");
    public static final Joiner JOIN_ON_EQUALS = new Joiner("=");

    /* loaded from: classes.dex */
    public static class OptionInfo {
        public boolean isBool;
        public String key;

        public final String toString() {
            String str = this.key;
            boolean z = this.isBool;
            StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(str, 9));
            sb.append("{");
            sb.append(str);
            sb.append(", ");
            sb.append(z);
            sb.append("}");
            return sb.toString();
        }

        public OptionInfo(String key, boolean isBool) {
            this.key = key;
            this.isBool = isBool;
        }
    }

    /* loaded from: classes.dex */
    public interface UriWrapper<T> {
    }

    public static List<String> getPathComponents(String path) {
        Splitter splitter = SPLIT_ON_SLASH;
        splitter.getClass();
        path.getClass();
        ArrayList newArrayList = Lists.newArrayList(new Splitter.AnonymousClass5(path));
        return (newArrayList.size() < 1 || !((String) newArrayList.get(0)).isEmpty()) ? newArrayList : newArrayList.subList(1, newArrayList.size());
    }

    public static String makeOptions(String oldOptions, String newOptions, boolean merge) {
        boolean z;
        boolean z2;
        if (oldOptions != null) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "oldOptions is null");
        if (newOptions != null) {
            z2 = true;
        } else {
            z2 = false;
        }
        Preconditions.checkArgument(z2, "newOptions is null");
        if (oldOptions.isEmpty()) {
            return newOptions;
        }
        ArrayList splitOptions = splitOptions(oldOptions, !merge);
        if (splitOptions.isEmpty()) {
            return newOptions;
        }
        splitOptions.addAll(splitOptions(newOptions, false));
        ArrayListMultimap create = ArrayListMultimap.create();
        ArrayList arrayList = new ArrayList();
        Iterator it = splitOptions.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            OptionInfo optionInfo = null;
            ImmutableList.Itr listIterator = OPTIONS.listIterator(0);
            while (true) {
                if (!listIterator.hasNext()) {
                    break;
                }
                OptionInfo optionInfo2 = (OptionInfo) listIterator.next();
                if (str.toLowerCase().startsWith(optionInfo2.key)) {
                    if (!optionInfo2.isBool) {
                        optionInfo = optionInfo2;
                    } else if (str.length() == optionInfo2.key.length()) {
                        optionInfo = optionInfo2;
                        break;
                    }
                }
            }
            if (optionInfo != null) {
                create.put(optionInfo, str);
            } else {
                arrayList.add(str);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        ImmutableList.Itr listIterator2 = OPTIONS.listIterator(0);
        while (listIterator2.hasNext()) {
            String str2 = "";
            for (V v : create.get((ArrayListMultimap) ((OptionInfo) listIterator2.next()))) {
                if (Character.isUpperCase(v.charAt(0))) {
                    arrayList2.add(v);
                } else {
                    str2 = v;
                }
            }
            if (!str2.isEmpty()) {
                arrayList2.add(str2);
            }
        }
        arrayList2.addAll(arrayList);
        return JOIN_ON_DASH.join(arrayList2);
    }

    public static ArrayList splitOptions(String options, boolean stripUnsigned) {
        boolean z;
        String str;
        if (options != null) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "options is null");
        ArrayList arrayList = new ArrayList();
        Splitter splitter = SPLIT_ON_DASH;
        splitter.getClass();
        options.getClass();
        Iterator<String> it = splitter.strategy.iterator(splitter, options);
        while (it.hasNext()) {
            String next = it.next();
            if (!next.isEmpty()) {
                String str2 = "";
                if (next.startsWith("O") || next.startsWith("J")) {
                    while (next.length() < 12) {
                        Joiner joiner = JOIN_ON_DASH;
                        if (it.hasNext()) {
                            str = it.next();
                        } else {
                            str = str2;
                        }
                        joiner.getClass();
                        next = joiner.join(new Joiner.AnonymousClass3(new Object[0], next, str));
                    }
                }
                if (next.equals("pi") || next.equals("ya") || next.equals("ro")) {
                    Joiner joiner2 = JOIN_ON_DASH;
                    if (it.hasNext()) {
                        str2 = it.next();
                    }
                    joiner2.getClass();
                    next = joiner2.join(new Joiner.AnonymousClass3(new Object[0], next, str2));
                }
                if (!stripUnsigned || Character.isUpperCase(next.charAt(0))) {
                    arrayList.add(next);
                }
            }
        }
        return arrayList;
    }

    public T changeImageUrlOptions(ImageUrlOptionsStringBuilder options, UriWrapper<T> url, boolean signedOnly, boolean merge) throws InvalidUrlException {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4 = true;
        if (options != null) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "options is null");
        if (url != null) {
            z2 = true;
        } else {
            z2 = false;
        }
        Preconditions.checkArgument(z2, "url is null");
        FifeImageUrlUtil.AndroidUriWrapper androidUriWrapper = (FifeImageUrlUtil.AndroidUriWrapper) url;
        if (androidUriWrapper.getPath() != null) {
            List<String> pathComponents = getPathComponents(androidUriWrapper);
            if (pathComponents.size() > 0 && "image".equals(pathComponents.get(0))) {
                pathComponents.remove(0);
            }
            if (pathComponents.size() == 2) {
                pathComponents.remove(0);
            }
            int size = pathComponents.size();
            if (size >= 4 && ((size != 4 || !pathComponents.get(3).isEmpty()) && size <= 6)) {
                z3 = true;
            } else {
                z3 = false;
            }
            if (z3) {
                return setLegacyImageUrlOptions(options, url, signedOnly, merge);
            }
            int size2 = pathComponents.size();
            if (size2 < 1 || size2 > 1 || pathComponents.get(size2 - 1).isEmpty()) {
                z4 = false;
            }
            if (z4) {
                return setContentImageUrlOptions(options, url, signedOnly, merge);
            }
            throw new InvalidUrlException(androidUriWrapper.toString());
        }
        throw new InvalidUrlException("url path is null");
    }

    public T setContentImageUrlOptions(ImageUrlOptionsStringBuilder options, UriWrapper<T> url, boolean signedOnly, boolean merge) {
        boolean z;
        boolean z2;
        boolean z3;
        String str;
        if (options != null) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "options is null");
        if (url != null) {
            z2 = true;
        } else {
            z2 = false;
        }
        Preconditions.checkArgument(z2, "url is null");
        FifeImageUrlUtil.AndroidUriWrapper androidUriWrapper = (FifeImageUrlUtil.AndroidUriWrapper) url;
        if (androidUriWrapper.getPath() != null) {
            z3 = true;
        } else {
            z3 = false;
        }
        Preconditions.checkArgument(z3, "url path is null");
        Splitter splitter = SPLIT_ON_EQUALS;
        String path = androidUriWrapper.getPath();
        splitter.getClass();
        path.getClass();
        ArrayList newArrayList = Lists.newArrayList(new Splitter.AnonymousClass5(path));
        String imageUrlOptionsStringBuilder = options.toString(signedOnly);
        String path2 = androidUriWrapper.getPath();
        path2.getClass();
        ArrayList newArrayList2 = Lists.newArrayList(new Splitter.AnonymousClass5(path2));
        if (newArrayList2.size() == 2) {
            str = (String) newArrayList2.get(1);
        } else {
            str = "";
        }
        String makeOptions = makeOptions(str, imageUrlOptionsStringBuilder, merge);
        String str2 = (String) newArrayList.get(0);
        if (!makeOptions.isEmpty()) {
            Joiner joiner = JOIN_ON_EQUALS;
            joiner.getClass();
            str2 = joiner.join(new Joiner.AnonymousClass3(new Object[0], str2, makeOptions));
        }
        return (T) androidUriWrapper.uri.buildUpon().encodedPath(str2).build();
    }

    public T setLegacyImageUrlOptions(ImageUrlOptionsStringBuilder options, UriWrapper<T> url, boolean signedOnly, boolean merge) {
        boolean z;
        boolean z2;
        boolean z3;
        String str;
        boolean z4 = true;
        if (options != null) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "options is null");
        if (url != null) {
            z2 = true;
        } else {
            z2 = false;
        }
        Preconditions.checkArgument(z2, "url is null");
        FifeImageUrlUtil.AndroidUriWrapper androidUriWrapper = (FifeImageUrlUtil.AndroidUriWrapper) url;
        if (androidUriWrapper.getPath() != null) {
            z3 = true;
        } else {
            z3 = false;
        }
        Preconditions.checkArgument(z3, "url path is null");
        List<String> pathComponents = getPathComponents(androidUriWrapper);
        if (pathComponents.size() <= 0 || !pathComponents.get(0).equals("image")) {
            z4 = false;
        } else {
            pathComponents.remove(0);
        }
        String imageUrlOptionsStringBuilder = options.toString(signedOnly);
        if (pathComponents.size() == 4) {
            pathComponents.add("");
        } else if (pathComponents.size() == 5) {
            pathComponents.add(4, "");
        }
        String makeOptions = makeOptions(pathComponents.get(4), imageUrlOptionsStringBuilder, merge);
        pathComponents.set(4, makeOptions);
        if (makeOptions.equals("") && pathComponents.size() > 5) {
            pathComponents.remove(4);
        }
        if (z4) {
            pathComponents.add(0, "image");
        }
        String valueOf = String.valueOf(JOIN_ON_SLASH.join(pathComponents));
        if (valueOf.length() != 0) {
            str = "/".concat(valueOf);
        } else {
            str = new String("/");
        }
        return (T) androidUriWrapper.uri.buildUpon().encodedPath(str).build();
    }

    static {
        Splitter on = Splitter.on('=');
        SPLIT_ON_EQUALS = new Splitter(on.strategy, true, on.trimmer, 2);
        Splitter.on(':');
        OptionInfo optionInfo = new OptionInfo("s", false);
        OptionInfo optionInfo2 = new OptionInfo("w", false);
        OptionInfo optionInfo3 = new OptionInfo("c", true);
        OptionInfo optionInfo4 = new OptionInfo("d", true);
        OptionInfo optionInfo5 = new OptionInfo("h", false);
        OptionInfo optionInfo6 = new OptionInfo("s", true);
        OptionInfo optionInfo7 = new OptionInfo("h", true);
        OptionInfo optionInfo8 = new OptionInfo("p", true);
        OptionInfo optionInfo9 = new OptionInfo("pp", true);
        OptionInfo optionInfo10 = new OptionInfo("pf", true);
        OptionInfo optionInfo11 = new OptionInfo("n", true);
        OptionInfo optionInfo12 = new OptionInfo("r", false);
        OptionInfo[] optionInfoArr = {new OptionInfo("r", true), new OptionInfo("o", true), new OptionInfo("o", false), new OptionInfo("j", false), new OptionInfo("x", false), new OptionInfo("y", false), new OptionInfo("z", false), new OptionInfo("g", true), new OptionInfo("e", false), new OptionInfo("f", false), new OptionInfo("k", true), new OptionInfo("u", true), new OptionInfo("ut", true), new OptionInfo("i", true), new OptionInfo("a", true), new OptionInfo("b", true), new OptionInfo("b", false), new OptionInfo("c", false), new OptionInfo("t", false), new OptionInfo("nt0", false), new OptionInfo("v", true), new OptionInfo("q", false), new OptionInfo("fh", true), new OptionInfo("fv", true), new OptionInfo("fg", true), new OptionInfo("ci", true), new OptionInfo("rw", true), new OptionInfo("rwu", true), new OptionInfo("rwa", true), new OptionInfo("nw", true), new OptionInfo("rh", true), new OptionInfo("no", true), new OptionInfo("ns", true), new OptionInfo("k", false), new OptionInfo("p", false), new OptionInfo("l", false), new OptionInfo("v", false), new OptionInfo("nu", true), new OptionInfo("ft", true), new OptionInfo("cc", true), new OptionInfo("nd", true), new OptionInfo("ip", true), new OptionInfo("nc", true), new OptionInfo("a", false), new OptionInfo("rj", true), new OptionInfo("rp", true), new OptionInfo("rg", true), new OptionInfo("pd", true), new OptionInfo("pa", true), new OptionInfo("m", false), new OptionInfo("vb", false), new OptionInfo("vl", false), new OptionInfo("lf", true), new OptionInfo("mv", true), new OptionInfo(FlagManager.EXTRA_ID, true), new OptionInfo("al", true), new OptionInfo("ic", false), new OptionInfo("pg", true), new OptionInfo("mo", true), new OptionInfo("iv", false), new OptionInfo("il", false), new OptionInfo("ba", false)};
        ImmutableList.Itr itr = ImmutableList.EMPTY_ITR;
        Object[] objArr = new Object[74];
        objArr[0] = optionInfo;
        objArr[1] = optionInfo2;
        objArr[2] = optionInfo3;
        objArr[3] = optionInfo4;
        objArr[4] = optionInfo5;
        objArr[5] = optionInfo6;
        objArr[6] = optionInfo7;
        objArr[7] = optionInfo8;
        objArr[8] = optionInfo9;
        objArr[9] = optionInfo10;
        objArr[10] = optionInfo11;
        objArr[11] = optionInfo12;
        System.arraycopy(optionInfoArr, 0, objArr, 12, 62);
        ObjectArrays.checkElementsNotNull(objArr, 74);
        OPTIONS = ImmutableList.asImmutableList(objArr, 74);
    }

    public List<String> getPathComponents(UriWrapper<T> uri) {
        uri.getClass();
        return getPathComponents(((FifeImageUrlUtil.AndroidUriWrapper) uri).getPath());
    }

    /* loaded from: classes.dex */
    public static class InvalidUrlException extends Exception {
        public InvalidUrlException(String msg) {
            super(msg);
        }
    }
}
