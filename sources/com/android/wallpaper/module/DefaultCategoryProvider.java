package com.android.wallpaper.module;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import androidx.cardview.R$style;
import com.android.volley.VolleyError;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.network.ServerFetcher$ResultsCallback;
import com.google.android.apps.common.volley.request.ProtoRequest;
import com.google.android.apps.wallpaper.backdrop.BackdropFetcher;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Collection;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetCollectionsRequest;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$GetCollectionsResponse;
import com.google.protobuf.Internal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class DefaultCategoryProvider implements CategoryProvider {
    public static List<Category> sSystemCategories;
    public final Context mAppContext;
    public boolean mFetchedCategories;
    public Locale mLocale;
    public NetworkStatusNotifier mNetworkStatusNotifier;
    public ArrayList<Category> mCategories = new ArrayList<>();
    public int mNetworkStatus = -1;

    /* loaded from: classes.dex */
    public static class FetchCategoriesTask extends AsyncTask<Void, Category, Void> {
        public static final /* synthetic */ int $r8$clinit = 0;
        public final Context mAppContext;
        public PartnerProvider mPartnerProvider;
        public CategoryReceiver mReceiver;

        @Override // android.os.AsyncTask
        public final void onPostExecute(Void r1) {
            this.mReceiver.doneFetchingCategories();
        }

        @Override // android.os.AsyncTask
        public final void onProgressUpdate(Category[] categoryArr) {
            Category[] categoryArr2 = categoryArr;
            super.onProgressUpdate(categoryArr2);
            for (Category category : categoryArr2) {
                if (category != null) {
                    this.mReceiver.onCategoryReceived(category);
                }
            }
        }

        public FetchCategoriesTask(CategoryReceiver categoryReceiver, Context context) {
            this.mReceiver = categoryReceiver;
            this.mAppContext = context.getApplicationContext();
        }
    }

    public final Category getCategory(String str) {
        for (int i = 0; i < this.mCategories.size(); i++) {
            Category category = this.mCategories.get(i);
            if (category.mCollectionId.equals(str)) {
                return category;
            }
        }
        return null;
    }

    /* JADX WARN: Type inference failed for: r3v0, types: [com.android.wallpaper.model.CategoryReceiver, com.google.android.apps.wallpaper.module.WallpaperCategoryProvider$1] */
    /* JADX WARN: Type inference failed for: r7v5, types: [com.google.android.apps.wallpaper.backdrop.BackdropCategory$1] */
    public final void fetchCategories(final CategoryReceiver categoryReceiver, boolean z) {
        if (z || !this.mFetchedCategories) {
            if (z) {
                this.mCategories.clear();
                this.mFetchedCategories = false;
            }
            this.mNetworkStatus = ((DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier).getNetworkStatus();
            this.mLocale = this.mAppContext.getResources().getConfiguration().getLocales().get(0);
            final WallpaperCategoryProvider wallpaperCategoryProvider = (WallpaperCategoryProvider) this;
            final int[] iArr = {0};
            final ?? r3 = new CategoryReceiver() { // from class: com.google.android.apps.wallpaper.module.WallpaperCategoryProvider.1
                @Override // com.android.wallpaper.model.CategoryReceiver
                public final void doneFetchingCategories() {
                    int[] iArr2 = iArr;
                    int i = iArr2[0] + 1;
                    iArr2[0] = i;
                    if (i == 2) {
                        categoryReceiver.doneFetchingCategories();
                    }
                    WallpaperCategoryProvider.this.mFetchedCategories = true;
                }

                @Override // com.android.wallpaper.model.CategoryReceiver
                public final void onCategoryReceived(Category category) {
                    categoryReceiver.onCategoryReceived(category);
                    int indexOf = WallpaperCategoryProvider.this.mCategories.indexOf(category);
                    if (indexOf >= 0) {
                        WallpaperCategoryProvider.this.mCategories.set(indexOf, category);
                    } else {
                        WallpaperCategoryProvider.this.mCategories.add(category);
                    }
                }
            };
            new WallpaperCategoryProvider.GoogleFetchCategoriesTask(r3, wallpaperCategoryProvider.mAppContext, z).execute(new Void[0]);
            final Context context = wallpaperCategoryProvider.mAppContext;
            Injector injector = R$style.getInjector();
            if (((DefaultNetworkStatusNotifier) injector.getNetworkStatusNotifier(context)).getNetworkStatus() == 0) {
                r3.doneFetchingCategories();
                return;
            }
            BackdropFetcher serverFetcher = ((GoogleWallpapersInjector) injector).getServerFetcher(context);
            final ?? r7 = new ServerFetcher$ResultsCallback<ImaxWallpaperProto$Collection>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropCategory.1
                public final /* synthetic */ int val$priority = 201;

                @Override // com.android.wallpaper.network.ServerFetcher$ResultsCallback
                public final void onError(VolleyError volleyError) {
                    Log.e("BackdropCategory", "Unable to fetch Backdrop wallpaper categories", volleyError);
                    r3.doneFetchingCategories();
                }

                @Override // com.android.wallpaper.network.ServerFetcher$ResultsCallback
                public final void onSuccess(Internal.ProtobufList protobufList) {
                    Iterator<E> it = protobufList.iterator();
                    while (it.hasNext()) {
                        BackdropCategory backdropCategory = new BackdropCategory((ImaxWallpaperProto$Collection) it.next(), this.val$priority);
                        r3.onCategoryReceived(backdropCategory);
                        backdropCategory.fetchWallpapers(context, null, false);
                    }
                    r3.doneFetchingCategories();
                }
            };
            serverFetcher.getClass();
            ProtoRequest.Builder builder = new ProtoRequest.Builder();
            ProtoRequest.Callback<ImaxWallpaperProto$GetCollectionsResponse> callback = new ProtoRequest.Callback<ImaxWallpaperProto$GetCollectionsResponse>() { // from class: com.google.android.apps.wallpaper.backdrop.BackdropFetcher.1
                @Override // com.android.volley.Response.ErrorListener
                public final void onErrorResponse(VolleyError volleyError) {
                    r7.onError(volleyError);
                }

                @Override // com.android.volley.Response.Listener
                public final void onResponse(Object obj) {
                    r7.onSuccess(((ImaxWallpaperProto$GetCollectionsResponse) obj).getCollectionsList());
                }
            };
            ImaxWallpaperProto$GetCollectionsRequest.Builder newBuilder = ImaxWallpaperProto$GetCollectionsRequest.newBuilder();
            String language = BackdropFetcher.getLanguage();
            newBuilder.copyOnWrite();
            ImaxWallpaperProto$GetCollectionsRequest.m43$$Nest$msetLanguage((ImaxWallpaperProto$GetCollectionsRequest) newBuilder.instance, language);
            ArrayList filteringLabelList = serverFetcher.getFilteringLabelList(context);
            newBuilder.copyOnWrite();
            ImaxWallpaperProto$GetCollectionsRequest.m42$$Nest$maddAllFilteringLabel((ImaxWallpaperProto$GetCollectionsRequest) newBuilder.instance, filteringLabelList);
            builder.url = "https://clients3.google.com/cast/chromecast/home/wallpaper/collections?rt=b";
            builder.requestMethod = 1;
            builder.requestBody = newBuilder.build();
            builder.callback = callback;
            builder.responseParser = ImaxWallpaperProto$GetCollectionsResponse.parser();
            builder.headers.put("Accept", "application/x-protobuf");
            serverFetcher.mRequester.addToRequestQueue(new ProtoRequest(builder));
            return;
        }
        Iterator<Category> it = this.mCategories.iterator();
        while (it.hasNext()) {
            categoryReceiver.onCategoryReceived(it.next());
        }
        categoryReceiver.doneFetchingCategories();
    }

    public DefaultCategoryProvider(Context context) {
        this.mAppContext = context.getApplicationContext();
        this.mNetworkStatusNotifier = R$style.getInjector().getNetworkStatusNotifier(context);
    }
}
