package com.google.android.apps.wallpaper.backdrop;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.provider.DeviceConfig;
import android.util.Log;
import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.VolleyError;
import com.android.wallpaper.network.ServerFetcher$NextImageInCollectionCallback;
import com.android.wallpaper.network.WallpaperRequester;
import com.google.android.apps.common.volley.request.ProtoRequest;
import com.google.android.apps.wallpaper.backdrop.BackdropCategory;
import com.google.android.apps.wallpaper.module.DeviceConfigFilteringLabelProvider;
import com.google.android.apps.wallpaper.module.FilteringLabelProvider;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetImageFromCollectionRequest;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetImageFromCollectionResponse;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetImagesInCollectionRequest;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetImagesInCollectionResponse;
import com.google.common.collect.Sets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Locale;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;
/* loaded from: classes.dex */
public final class BackdropFetcher {
    public final FilteringLabelProvider mLabelProvider;
    public final WallpaperRequester mRequester;

    public final void fetchImagesInCollection(Context context, String str, final BackdropCategory.AnonymousClass2 r6) {
        ProtoRequest.Builder builder = new ProtoRequest.Builder();
        ProtoRequest.Callback<ImaxWallpaperProto$GetImagesInCollectionResponse> callback = new ProtoRequest.Callback<ImaxWallpaperProto$GetImagesInCollectionResponse>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropFetcher.2
            @Override // com.android.volley.Response.ErrorListener
            public final void onErrorResponse(VolleyError volleyError) {
                r6.onError(volleyError);
            }

            @Override // com.android.volley.Response.Listener
            public final void onResponse(Object obj) {
                r6.onSuccess(((ImaxWallpaperProto$GetImagesInCollectionResponse) obj).getImagesList());
            }
        };
        ImaxWallpaperProto$GetImagesInCollectionRequest.Builder newBuilder = ImaxWallpaperProto$GetImagesInCollectionRequest.newBuilder();
        newBuilder.copyOnWrite();
        ImaxWallpaperProto$GetImagesInCollectionRequest.m53$$Nest$msetCollectionId((ImaxWallpaperProto$GetImagesInCollectionRequest) newBuilder.instance, str);
        String language = getLanguage();
        newBuilder.copyOnWrite();
        ImaxWallpaperProto$GetImagesInCollectionRequest.m54$$Nest$msetLanguage((ImaxWallpaperProto$GetImagesInCollectionRequest) newBuilder.instance, language);
        ArrayList filteringLabelList = getFilteringLabelList(context);
        newBuilder.copyOnWrite();
        ImaxWallpaperProto$GetImagesInCollectionRequest.m52$$Nest$maddAllFilteringLabel((ImaxWallpaperProto$GetImagesInCollectionRequest) newBuilder.instance, filteringLabelList);
        builder.url = "https://clients3.google.com/cast/chromecast/home/wallpaper/collection-images?rt=b";
        builder.requestMethod = 1;
        builder.requestBody = newBuilder.build();
        builder.callback = callback;
        builder.responseParser = ImaxWallpaperProto$GetImagesInCollectionResponse.parser();
        builder.headers.put("Accept", "application/x-protobuf");
        this.mRequester.addToRequestQueue(new ProtoRequest(builder));
    }

    public final void fetchNextImageInCollection(Context context, String str, String str2, final ServerFetcher$NextImageInCollectionCallback serverFetcher$NextImageInCollectionCallback) {
        ProtoRequest.Builder builder = new ProtoRequest.Builder();
        ProtoRequest.Callback<ImaxWallpaperProto$GetImageFromCollectionResponse> callback = new ProtoRequest.Callback<ImaxWallpaperProto$GetImageFromCollectionResponse>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropFetcher.3
            @Override // com.android.volley.Response.ErrorListener
            public final void onErrorResponse(VolleyError volleyError) {
                ServerFetcher$NextImageInCollectionCallback.this.onError(volleyError);
            }

            @Override // com.android.volley.Response.Listener
            public final void onResponse(Object obj) {
                ImaxWallpaperProto$GetImageFromCollectionResponse imaxWallpaperProto$GetImageFromCollectionResponse = (ImaxWallpaperProto$GetImageFromCollectionResponse) obj;
                ServerFetcher$NextImageInCollectionCallback.this.onSuccess(imaxWallpaperProto$GetImageFromCollectionResponse.getImage(), imaxWallpaperProto$GetImageFromCollectionResponse.getResumeToken());
            }
        };
        ImaxWallpaperProto$GetImageFromCollectionRequest.Builder newBuilder = ImaxWallpaperProto$GetImageFromCollectionRequest.newBuilder();
        newBuilder.copyOnWrite();
        ImaxWallpaperProto$GetImageFromCollectionRequest.m47$$Nest$maddCollectionIds((ImaxWallpaperProto$GetImageFromCollectionRequest) newBuilder.instance, str);
        if (str2 != null) {
            newBuilder.copyOnWrite();
            ImaxWallpaperProto$GetImageFromCollectionRequest.m49$$Nest$msetResumeToken((ImaxWallpaperProto$GetImageFromCollectionRequest) newBuilder.instance, str2);
        }
        String language = getLanguage();
        newBuilder.copyOnWrite();
        ImaxWallpaperProto$GetImageFromCollectionRequest.m48$$Nest$msetLanguage((ImaxWallpaperProto$GetImageFromCollectionRequest) newBuilder.instance, language);
        ArrayList filteringLabelList = getFilteringLabelList(context);
        newBuilder.copyOnWrite();
        ImaxWallpaperProto$GetImageFromCollectionRequest.m46$$Nest$maddAllFilteringLabel((ImaxWallpaperProto$GetImageFromCollectionRequest) newBuilder.instance, filteringLabelList);
        builder.url = "https://clients3.google.com/cast/chromecast/home/wallpaper/image?rt=b";
        builder.requestMethod = 1;
        builder.requestBody = newBuilder.build();
        builder.callback = callback;
        builder.responseParser = ImaxWallpaperProto$GetImageFromCollectionResponse.parser();
        builder.headers.put("Accept", "application/x-protobuf");
        ProtoRequest protoRequest = new ProtoRequest(builder);
        protoRequest.mRetryPolicy = new DefaultRetryPolicy(3, 2.0f);
        this.mRequester.addToRequestQueue(protoRequest);
    }

    public final ArrayList getFilteringLabelList(Context context) {
        Collection collection;
        ArrayList arrayList = new ArrayList();
        arrayList.add("update1");
        PackageManager packageManager = context.getPackageManager();
        if (packageManager.hasSystemFeature("com.google.android.feature.PIXEL_EXPERIENCE")) {
            arrayList.add("nexus");
        }
        if (packageManager.hasSystemFeature("com.google.android.feature.PIXEL_2017_EXPERIENCE")) {
            arrayList.add("pixel_2017");
        }
        arrayList.add(Build.MODEL);
        String str = Build.DEVICE;
        arrayList.add(str);
        String str2 = "android-sdk-" + Build.VERSION.SDK_INT;
        arrayList.add(str2);
        arrayList.add(str + "." + str2);
        ((DeviceConfigFilteringLabelProvider) this.mLabelProvider).getClass();
        try {
            final DeviceConfig.Properties properties = DeviceConfig.getProperties("wallpaper_content", new String[0]);
            collection = (Set) properties.getKeyset().stream().filter(new Predicate() { // from class: com.google.android.apps.wallpaper.module.DeviceConfigFilteringLabelProvider$$ExternalSyntheticLambda0
                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    return properties.getBoolean((String) obj, false);
                }
            }).collect(Collectors.toSet());
        } catch (Exception e) {
            Log.w("DeviceConfigFiltering", "Couldn't access DeviceConfig properties", e);
            collection = Sets.newHashSetWithExpectedSize(1);
            Collections.addAll(collection, "notargeting");
        }
        arrayList.addAll(collection);
        return arrayList;
    }

    public BackdropFetcher(WallpaperRequester wallpaperRequester, DeviceConfigFilteringLabelProvider deviceConfigFilteringLabelProvider) {
        this.mRequester = wallpaperRequester;
        this.mLabelProvider = deviceConfigFilteringLabelProvider;
    }

    public static String getLanguage() {
        String language = Locale.getDefault().getLanguage();
        String country = Locale.getDefault().getCountry();
        if (!country.isEmpty()) {
            return AbstractResolvableFuture$$ExternalSyntheticOutline0.m(language, "-", country);
        }
        return language;
    }
}
