package com.google.android.apps.wallpaper.module;

import android.app.WallpaperInfo;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.model.DownloadableLiveWallpaperInfo;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperCategory;
import com.android.wallpaper.module.DefaultCategoryProvider;
import com.android.wallpaper.module.DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;
import com.android.wallpaper.module.DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda2;
import com.google.android.apps.wallpaper.model.GoogleLiveWallpaperInfo;
import com.google.android.apps.wallpaper.model.MicropaperWallpaperInfo;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import kotlin.jvm.internal.Intrinsics;
import org.xmlpull.v1.XmlPullParserException;
import wireless.android.learning.acmi.micropaper.frontend.MicropaperFrontend;
/* loaded from: classes.dex */
public final class WallpaperCategoryProvider extends DefaultCategoryProvider {
    public static List<Category> sSystemStaticCategories;

    /* loaded from: classes.dex */
    public static class GoogleFetchCategoriesTask extends DefaultCategoryProvider.FetchCategoriesTask {
        public boolean mForceRefresh;
        public Resources mPixelApkResources;
        public Resources mStubApkResources;
        public String mStubPackageName;

        public static ArrayList getNexusLiveWallpaperPackageNames(Resources resources, String str, String str2) {
            String[] stringArray;
            ArrayList arrayList = new ArrayList();
            int identifier = resources.getIdentifier(str, "array", str2);
            if (identifier == 0) {
                return arrayList;
            }
            for (String str3 : resources.getStringArray(identifier)) {
                arrayList.add(resources.getString(resources.getIdentifier(str3 + "_package_name", "string", str2)));
            }
            return arrayList;
        }

        /* JADX WARN: Removed duplicated region for block: B:104:0x02f7 A[LOOP:5: B:102:0x02f1->B:104:0x02f7, LOOP_END] */
        /* JADX WARN: Removed duplicated region for block: B:77:0x01db  */
        /* JADX WARN: Removed duplicated region for block: B:81:0x01e6  */
        /* JADX WARN: Removed duplicated region for block: B:84:0x0212  */
        /* JADX WARN: Removed duplicated region for block: B:90:0x0286  */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Void doInBackground(java.lang.Void[] r15) {
            /*
                Method dump skipped, instructions count: 776
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.module.WallpaperCategoryProvider.GoogleFetchCategoriesTask.doInBackground(java.lang.Object[]):java.lang.Object");
        }

        public final Set<String> getExcludedLiveWallpaperPackageNames() {
            HashSet hashSet = new HashSet();
            List<Category> list = DefaultCategoryProvider.sSystemCategories;
            if (list != null) {
                hashSet.addAll((Collection) list.stream().filter(DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda2.INSTANCE).flatMap(DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1.INSTANCE).collect(Collectors.toSet()));
            }
            Resources resources = this.mStubApkResources;
            if (resources != null) {
                hashSet.addAll(getNexusLiveWallpaperPackageNames(resources, "nexus_live_categories", this.mStubPackageName));
            }
            Resources resources2 = this.mPixelApkResources;
            if (resources2 != null) {
                hashSet.addAll(getNexusLiveWallpaperPackageNames(resources2, "pixel_live_categories", "com.google.pixel.livewallpaper"));
            }
            hashSet.add(MicropaperFrontend.MICROPAPER_SERVICE.getPackageName());
            return hashSet;
        }

        public final ArrayList getNexusLiveWallpaperCategories(Resources resources, String str, String str2) {
            List list;
            List list2;
            int i;
            Context context;
            Object obj;
            Resources resources2 = resources;
            String str3 = str2;
            ArrayList arrayList = new ArrayList();
            String str4 = "array";
            int identifier = resources2.getIdentifier(str, str4, str3);
            if (identifier == 0) {
                return arrayList;
            }
            String[] stringArray = resources2.getStringArray(identifier);
            int i2 = 0;
            while (i2 < stringArray.length) {
                String str5 = stringArray[i2];
                String string = resources2.getString(resources2.getIdentifier(str5 + "_title", "string", str3));
                String string2 = resources2.getString(resources2.getIdentifier(str5 + "_package_name", "string", str3));
                String string3 = resources2.getString(resources2.getIdentifier(str5 + "_featured_service_name", "string", str3));
                int identifier2 = resources2.getIdentifier(str5 + "_service_names", str4, str3);
                if (identifier2 == 0) {
                    list = null;
                } else {
                    list = Arrays.asList(resources2.getStringArray(identifier2));
                }
                List list3 = list;
                Context context2 = this.mAppContext;
                if (list3 != null) {
                    Parcelable.Creator<LiveWallpaperInfo> creator = LiveWallpaperInfo.CREATOR;
                    List<ResolveInfo> queryIntentServices = context2.getPackageManager().queryIntentServices(new Intent("android.service.wallpaper.WallpaperService"), 128);
                    ResolveInfo[] resolveInfoArr = new ResolveInfo[list3.size()];
                    Iterator<ResolveInfo> it = queryIntentServices.iterator();
                    while (it.hasNext()) {
                        ResolveInfo next = it.next();
                        Iterator<ResolveInfo> it2 = it;
                        int indexOf = list3.indexOf(next.serviceInfo.name);
                        if (indexOf != -1) {
                            resolveInfoArr[indexOf] = next;
                        }
                        it = it2;
                    }
                    list2 = Arrays.asList(resolveInfoArr);
                } else {
                    list2 = LiveWallpaperInfo.getAllOnDevice(context2);
                }
                List list4 = list2;
                ArrayList arrayList2 = new ArrayList();
                Intrinsics liveWallpaperInfoFactory = R$style.getInjector().getLiveWallpaperInfoFactory();
                String str6 = str4;
                int i3 = 0;
                while (i3 < list4.size()) {
                    List list5 = list4;
                    ResolveInfo resolveInfo = (ResolveInfo) list4.get(i3);
                    String[] strArr = stringArray;
                    if (resolveInfo == null) {
                        Log.e("LiveWallpaperInfo", "Found a null resolve info");
                    } else {
                        try {
                            WallpaperInfo wallpaperInfo = new WallpaperInfo(context2, resolveInfo);
                            if (string2.equals(wallpaperInfo.getPackageName())) {
                                liveWallpaperInfoFactory.getClass();
                                if (wallpaperInfo.getComponent().equals(MicropaperFrontend.MICROPAPER_SERVICE)) {
                                    obj = new MicropaperWallpaperInfo(wallpaperInfo);
                                } else {
                                    obj = new GoogleLiveWallpaperInfo(wallpaperInfo, 0);
                                }
                                arrayList2.add(obj);
                            }
                        } catch (IOException e) {
                            context = context2;
                            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Skipping wallpaper ");
                            m.append(resolveInfo.serviceInfo);
                            Log.w("LiveWallpaperInfo", m.toString(), e);
                        } catch (XmlPullParserException e2) {
                            context = context2;
                            StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Skipping wallpaper ");
                            m2.append(resolveInfo.serviceInfo);
                            Log.w("LiveWallpaperInfo", m2.toString(), e2);
                        }
                    }
                    context = context2;
                    i3++;
                    list4 = list5;
                    stringArray = strArr;
                    context2 = context;
                }
                String[] strArr2 = stringArray;
                Context context3 = this.mAppContext;
                Parcelable.Creator<DownloadableLiveWallpaperInfo> creator2 = DownloadableLiveWallpaperInfo.CREATOR;
                List<ResolveInfo> queryIntentServices2 = context3.getPackageManager().queryIntentServices(new Intent("android.service.wallpaper.WallpaperService"), 640);
                if (list3 != null) {
                    ResolveInfo[] resolveInfoArr2 = new ResolveInfo[list3.size()];
                    for (ResolveInfo resolveInfo2 : queryIntentServices2) {
                        int indexOf2 = list3.indexOf(resolveInfo2.serviceInfo.name);
                        if (indexOf2 != -1) {
                            resolveInfoArr2[indexOf2] = resolveInfo2;
                        }
                    }
                    queryIntentServices2 = Arrays.asList(resolveInfoArr2);
                }
                ArrayList toBeInstalledComponent = DownloadableLiveWallpaperInfo.getToBeInstalledComponent(context3);
                ArrayList arrayList3 = new ArrayList();
                for (ResolveInfo resolveInfo3 : queryIntentServices2) {
                    if (resolveInfo3 != null) {
                        try {
                            WallpaperInfo wallpaperInfo2 = new WallpaperInfo(context3, resolveInfo3);
                            if (string2.equals(wallpaperInfo2.getPackageName())) {
                                DownloadableLiveWallpaperInfo downloadableLiveWallpaperInfo = new DownloadableLiveWallpaperInfo(wallpaperInfo2, str5);
                                if (toBeInstalledComponent.contains(downloadableLiveWallpaperInfo.mInfo.getComponent().flattenToString())) {
                                    arrayList3.add(downloadableLiveWallpaperInfo);
                                }
                            }
                        } catch (IOException | XmlPullParserException e3) {
                            StringBuilder m3 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Skipping wallpaper ");
                            m3.append(resolveInfo3.serviceInfo);
                            Log.w("DownloadLiveWallpaperInfo", m3.toString(), e3);
                        }
                    }
                }
                arrayList2.addAll(arrayList3);
                if (arrayList2.size() != 0) {
                    int i4 = 0;
                    while (true) {
                        if (i4 >= arrayList2.size()) {
                            i = 0;
                            break;
                        } else if (string3.equals(((com.android.wallpaper.model.WallpaperInfo) arrayList2.get(i4)).getWallpaperComponent().getServiceName())) {
                            i = i4;
                            break;
                        } else {
                            i4++;
                        }
                    }
                    arrayList.add(new WallpaperCategory(string, "nexus_live_category_" + i2, i, arrayList2, 101));
                }
                i2++;
                resources2 = resources;
                str3 = str2;
                str4 = str6;
                stringArray = strArr2;
            }
            return arrayList;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:121:0x0302  */
        /* JADX WARN: Removed duplicated region for block: B:122:0x030b  */
        /* JADX WARN: Removed duplicated region for block: B:124:0x030e  */
        /* JADX WARN: Removed duplicated region for block: B:129:0x031f  */
        /* JADX WARN: Removed duplicated region for block: B:136:0x0341 A[LOOP:6: B:134:0x0339->B:136:0x0341, LOOP_END] */
        /* JADX WARN: Removed duplicated region for block: B:87:0x0165 A[Catch: all -> 0x0169, TRY_ENTER, TRY_LEAVE, TryCatch #1 {IOException | XmlPullParserException -> 0x016f, blocks: (B:82:0x015c, B:88:0x016e, B:87:0x0165), top: B:138:0x0024 }] */
        /* JADX WARN: Removed duplicated region for block: B:96:0x0184 A[ADDED_TO_REGION] */
        /* JADX WARN: Type inference failed for: r3v20, types: [java.util.List] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.util.List<com.android.wallpaper.model.Category> getSystemCategories() {
            /*
                Method dump skipped, instructions count: 854
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.wallpaper.module.WallpaperCategoryProvider.GoogleFetchCategoriesTask.getSystemCategories():java.util.List");
        }

        public GoogleFetchCategoriesTask(CategoryReceiver categoryReceiver, Context context, boolean z) {
            super(categoryReceiver, context);
            this.mForceRefresh = z;
        }
    }

    public WallpaperCategoryProvider(Context context) {
        super(context);
    }
}
