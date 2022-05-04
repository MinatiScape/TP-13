package com.bumptech.glide;

import android.content.ComponentCallbacks2;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetFileDescriptor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.util.Log;
import androidx.appcompat.R$id;
import androidx.collection.ArrayMap;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.bumptech.glide.GlideBuilder;
import com.bumptech.glide.GlideExperiments;
import com.bumptech.glide.gifdecoder.GifDecoder;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.data.InputStreamRewinder;
import com.bumptech.glide.load.data.ParcelFileDescriptorRewinder;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPoolAdapter;
import com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool;
import com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool;
import com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory;
import com.bumptech.glide.load.engine.cache.LruResourceCache;
import com.bumptech.glide.load.engine.cache.MemoryCache;
import com.bumptech.glide.load.engine.cache.MemorySizeCalculator;
import com.bumptech.glide.load.engine.executor.GlideExecutor;
import com.bumptech.glide.load.model.AssetUriLoader;
import com.bumptech.glide.load.model.ByteArrayLoader;
import com.bumptech.glide.load.model.ByteBufferFileLoader;
import com.bumptech.glide.load.model.DataUrlLoader;
import com.bumptech.glide.load.model.FileLoader;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.load.model.MediaStoreFileLoader;
import com.bumptech.glide.load.model.ResourceLoader;
import com.bumptech.glide.load.model.StreamEncoder;
import com.bumptech.glide.load.model.StringLoader;
import com.bumptech.glide.load.model.UnitModelLoader;
import com.bumptech.glide.load.model.UriLoader;
import com.bumptech.glide.load.model.UrlUriLoader;
import com.bumptech.glide.load.model.stream.HttpGlideUrlLoader;
import com.bumptech.glide.load.model.stream.MediaStoreImageThumbLoader;
import com.bumptech.glide.load.model.stream.MediaStoreVideoThumbLoader;
import com.bumptech.glide.load.model.stream.QMediaStoreUriLoader;
import com.bumptech.glide.load.model.stream.UrlLoader;
import com.bumptech.glide.load.resource.bitmap.BitmapDrawableDecoder;
import com.bumptech.glide.load.resource.bitmap.BitmapDrawableEncoder;
import com.bumptech.glide.load.resource.bitmap.BitmapEncoder;
import com.bumptech.glide.load.resource.bitmap.ByteBufferBitmapDecoder;
import com.bumptech.glide.load.resource.bitmap.ByteBufferBitmapImageDecoderResourceDecoder;
import com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser;
import com.bumptech.glide.load.resource.bitmap.Downsampler;
import com.bumptech.glide.load.resource.bitmap.ExifInterfaceImageHeaderParser;
import com.bumptech.glide.load.resource.bitmap.HardwareConfigState;
import com.bumptech.glide.load.resource.bitmap.InputStreamBitmapImageDecoderResourceDecoder;
import com.bumptech.glide.load.resource.bitmap.ParcelFileDescriptorBitmapDecoder;
import com.bumptech.glide.load.resource.bitmap.ResourceBitmapDecoder;
import com.bumptech.glide.load.resource.bitmap.StreamBitmapDecoder;
import com.bumptech.glide.load.resource.bitmap.UnitBitmapDecoder;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import com.bumptech.glide.load.resource.bytes.ByteBufferRewinder;
import com.bumptech.glide.load.resource.drawable.ResourceDrawableDecoder;
import com.bumptech.glide.load.resource.drawable.UnitDrawableDecoder;
import com.bumptech.glide.load.resource.file.FileDecoder;
import com.bumptech.glide.load.resource.gif.ByteBufferGifDecoder;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.gif.GifFrameResourceDecoder;
import com.bumptech.glide.load.resource.gif.StreamGifDecoder;
import com.bumptech.glide.load.resource.transcode.BitmapBytesTranscoder;
import com.bumptech.glide.load.resource.transcode.BitmapDrawableTranscoder;
import com.bumptech.glide.load.resource.transcode.DrawableBytesTranscoder;
import com.bumptech.glide.manager.ConnectivityMonitorFactory;
import com.bumptech.glide.manager.DefaultConnectivityMonitorFactory;
import com.bumptech.glide.manager.RequestManagerRetriever;
import com.bumptech.glide.module.GlideModule;
import com.bumptech.glide.module.ManifestParser;
import com.bumptech.glide.provider.EncoderRegistry;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.Util;
import com.google.android.gms.common.util.zzh;
import java.io.File;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class Glide implements ComponentCallbacks2 {
    public static volatile Glide glide;
    public static volatile boolean isInitializing;
    public final ArrayPool arrayPool;
    public final BitmapPool bitmapPool;
    public final ConnectivityMonitorFactory connectivityMonitorFactory;
    public final RequestOptionsFactory defaultRequestOptionsFactory;
    public final Engine engine;
    public final GlideContext glideContext;
    public final MemoryCache memoryCache;
    public final Registry registry;
    public final RequestManagerRetriever requestManagerRetriever;
    public final ArrayList managers = new ArrayList();
    public MemoryCategory memoryCategory = MemoryCategory.NORMAL;

    /* loaded from: classes.dex */
    public interface RequestOptionsFactory {
        RequestOptions build();
    }

    @Deprecated
    public static synchronized void init(Glide glide2) {
        synchronized (Glide.class) {
            if (glide != null) {
                tearDown();
            }
            glide = glide2;
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
    }

    public Glide(Context context, Engine engine, MemoryCache memoryCache, BitmapPool bitmapPool, ArrayPool arrayPool, RequestManagerRetriever requestManagerRetriever, ConnectivityMonitorFactory connectivityMonitorFactory, int i, RequestOptionsFactory requestOptionsFactory, ArrayMap arrayMap, List list, GlideExperiments glideExperiments) {
        ResourceDecoder resourceDecoder;
        ResourceDecoder resourceDecoder2;
        this.engine = engine;
        this.bitmapPool = bitmapPool;
        this.arrayPool = arrayPool;
        this.memoryCache = memoryCache;
        this.requestManagerRetriever = requestManagerRetriever;
        this.connectivityMonitorFactory = connectivityMonitorFactory;
        this.defaultRequestOptionsFactory = requestOptionsFactory;
        Resources resources = context.getResources();
        Registry registry = new Registry();
        this.registry = registry;
        DefaultImageHeaderParser defaultImageHeaderParser = new DefaultImageHeaderParser();
        StreamEncoder streamEncoder = registry.imageHeaderParserRegistry;
        synchronized (streamEncoder) {
            ((List) streamEncoder.byteArrayPool).add(defaultImageHeaderParser);
        }
        ExifInterfaceImageHeaderParser exifInterfaceImageHeaderParser = new ExifInterfaceImageHeaderParser();
        StreamEncoder streamEncoder2 = registry.imageHeaderParserRegistry;
        synchronized (streamEncoder2) {
            ((List) streamEncoder2.byteArrayPool).add(exifInterfaceImageHeaderParser);
        }
        List<ImageHeaderParser> imageHeaderParsers = registry.getImageHeaderParsers();
        ByteBufferGifDecoder byteBufferGifDecoder = new ByteBufferGifDecoder(context, imageHeaderParsers, bitmapPool, arrayPool, ByteBufferGifDecoder.PARSER_POOL, ByteBufferGifDecoder.GIF_DECODER_FACTORY);
        VideoDecoder videoDecoder = new VideoDecoder(bitmapPool, new VideoDecoder.ParcelFileDescriptorInitializer());
        Downsampler downsampler = new Downsampler(registry.getImageHeaderParsers(), resources.getDisplayMetrics(), bitmapPool, arrayPool);
        if (glideExperiments.experiments.containsKey(GlideBuilder.EnableImageDecoderForBitmaps.class)) {
            resourceDecoder2 = new InputStreamBitmapImageDecoderResourceDecoder();
            resourceDecoder = new ByteBufferBitmapImageDecoderResourceDecoder();
        } else {
            resourceDecoder = new ByteBufferBitmapDecoder(downsampler);
            resourceDecoder2 = new StreamBitmapDecoder(downsampler, arrayPool);
        }
        ResourceDrawableDecoder resourceDrawableDecoder = new ResourceDrawableDecoder(context);
        ResourceLoader.StreamFactory streamFactory = new ResourceLoader.StreamFactory(resources);
        ResourceLoader.UriFactory uriFactory = new ResourceLoader.UriFactory(resources);
        ResourceLoader.FileDescriptorFactory fileDescriptorFactory = new ResourceLoader.FileDescriptorFactory(resources);
        ResourceLoader.AssetFileDescriptorFactory assetFileDescriptorFactory = new ResourceLoader.AssetFileDescriptorFactory(resources);
        BitmapEncoder bitmapEncoder = new BitmapEncoder(arrayPool);
        BitmapBytesTranscoder bitmapBytesTranscoder = new BitmapBytesTranscoder();
        zzh zzhVar = new zzh();
        ContentResolver contentResolver = context.getContentResolver();
        R$id r$id = new R$id();
        EncoderRegistry encoderRegistry = registry.encoderRegistry;
        synchronized (encoderRegistry) {
            encoderRegistry.encoders.add(new EncoderRegistry.Entry(ByteBuffer.class, r$id));
        }
        StreamEncoder streamEncoder3 = new StreamEncoder(arrayPool);
        EncoderRegistry encoderRegistry2 = registry.encoderRegistry;
        synchronized (encoderRegistry2) {
            encoderRegistry2.encoders.add(new EncoderRegistry.Entry(InputStream.class, streamEncoder3));
        }
        registry.append("Bitmap", ByteBuffer.class, Bitmap.class, resourceDecoder);
        registry.append("Bitmap", InputStream.class, Bitmap.class, resourceDecoder2);
        registry.append("Bitmap", ParcelFileDescriptor.class, Bitmap.class, new ParcelFileDescriptorBitmapDecoder(downsampler));
        registry.append("Bitmap", ParcelFileDescriptor.class, Bitmap.class, videoDecoder);
        registry.append("Bitmap", AssetFileDescriptor.class, Bitmap.class, new VideoDecoder(bitmapPool, new VideoDecoder.AssetFileDescriptorInitializer()));
        UnitModelLoader.Factory<?> factory = UnitModelLoader.Factory.FACTORY;
        registry.append(Bitmap.class, Bitmap.class, factory);
        registry.append("Bitmap", Bitmap.class, Bitmap.class, new UnitBitmapDecoder());
        registry.append(Bitmap.class, bitmapEncoder);
        registry.append("BitmapDrawable", ByteBuffer.class, BitmapDrawable.class, new BitmapDrawableDecoder(resources, resourceDecoder));
        registry.append("BitmapDrawable", InputStream.class, BitmapDrawable.class, new BitmapDrawableDecoder(resources, resourceDecoder2));
        registry.append("BitmapDrawable", ParcelFileDescriptor.class, BitmapDrawable.class, new BitmapDrawableDecoder(resources, videoDecoder));
        registry.append(BitmapDrawable.class, new BitmapDrawableEncoder(bitmapPool, bitmapEncoder));
        registry.append("Gif", InputStream.class, GifDrawable.class, new StreamGifDecoder(imageHeaderParsers, byteBufferGifDecoder, arrayPool));
        registry.append("Gif", ByteBuffer.class, GifDrawable.class, byteBufferGifDecoder);
        registry.append(GifDrawable.class, new androidx.transition.R$id());
        registry.append(GifDecoder.class, GifDecoder.class, factory);
        registry.append("Bitmap", GifDecoder.class, Bitmap.class, new GifFrameResourceDecoder(bitmapPool));
        registry.append("legacy_append", Uri.class, Drawable.class, resourceDrawableDecoder);
        registry.append("legacy_append", Uri.class, Bitmap.class, new ResourceBitmapDecoder(resourceDrawableDecoder, bitmapPool));
        registry.register(new ByteBufferRewinder.Factory());
        registry.append(File.class, ByteBuffer.class, new ByteBufferFileLoader.Factory());
        registry.append(File.class, InputStream.class, new FileLoader.StreamFactory());
        registry.append("legacy_append", File.class, File.class, new FileDecoder());
        registry.append(File.class, ParcelFileDescriptor.class, new FileLoader.FileDescriptorFactory());
        registry.append(File.class, File.class, factory);
        registry.register(new InputStreamRewinder.Factory(arrayPool));
        registry.register(new ParcelFileDescriptorRewinder.Factory());
        Class cls = Integer.TYPE;
        registry.append(cls, InputStream.class, streamFactory);
        registry.append(cls, ParcelFileDescriptor.class, fileDescriptorFactory);
        registry.append(Integer.class, InputStream.class, streamFactory);
        registry.append(Integer.class, ParcelFileDescriptor.class, fileDescriptorFactory);
        registry.append(Integer.class, Uri.class, uriFactory);
        registry.append(cls, AssetFileDescriptor.class, assetFileDescriptorFactory);
        registry.append(Integer.class, AssetFileDescriptor.class, assetFileDescriptorFactory);
        registry.append(cls, Uri.class, uriFactory);
        registry.append(String.class, InputStream.class, new DataUrlLoader.StreamFactory());
        registry.append(Uri.class, InputStream.class, new DataUrlLoader.StreamFactory());
        registry.append(String.class, InputStream.class, new StringLoader.StreamFactory());
        registry.append(String.class, ParcelFileDescriptor.class, new StringLoader.FileDescriptorFactory());
        registry.append(String.class, AssetFileDescriptor.class, new StringLoader.AssetFileDescriptorFactory());
        registry.append(Uri.class, InputStream.class, new AssetUriLoader.StreamFactory(context.getAssets()));
        registry.append(Uri.class, ParcelFileDescriptor.class, new AssetUriLoader.FileDescriptorFactory(context.getAssets()));
        registry.append(Uri.class, InputStream.class, new MediaStoreImageThumbLoader.Factory(context));
        registry.append(Uri.class, InputStream.class, new MediaStoreVideoThumbLoader.Factory(context));
        registry.append(Uri.class, InputStream.class, new QMediaStoreUriLoader.InputStreamFactory(context));
        registry.append(Uri.class, ParcelFileDescriptor.class, new QMediaStoreUriLoader.FileDescriptorFactory(context));
        registry.append(Uri.class, InputStream.class, new UriLoader.StreamFactory(contentResolver));
        registry.append(Uri.class, ParcelFileDescriptor.class, new UriLoader.FileDescriptorFactory(contentResolver));
        registry.append(Uri.class, AssetFileDescriptor.class, new UriLoader.AssetFileDescriptorFactory(contentResolver));
        registry.append(Uri.class, InputStream.class, new UrlUriLoader.StreamFactory());
        registry.append(URL.class, InputStream.class, new UrlLoader.StreamFactory());
        registry.append(Uri.class, File.class, new MediaStoreFileLoader.Factory(context));
        registry.append(GlideUrl.class, InputStream.class, new HttpGlideUrlLoader.Factory());
        registry.append(byte[].class, ByteBuffer.class, new ByteArrayLoader.ByteBufferFactory());
        registry.append(byte[].class, InputStream.class, new ByteArrayLoader.StreamFactory());
        registry.append(Uri.class, Uri.class, factory);
        registry.append(Drawable.class, Drawable.class, factory);
        registry.append("legacy_append", Drawable.class, Drawable.class, new UnitDrawableDecoder());
        registry.register(Bitmap.class, BitmapDrawable.class, new BitmapDrawableTranscoder(resources));
        registry.register(Bitmap.class, byte[].class, bitmapBytesTranscoder);
        registry.register(Drawable.class, byte[].class, new DrawableBytesTranscoder(bitmapPool, bitmapBytesTranscoder, zzhVar));
        registry.register(GifDrawable.class, byte[].class, zzhVar);
        VideoDecoder videoDecoder2 = new VideoDecoder(bitmapPool, new VideoDecoder.ByteBufferInitializer());
        registry.append("legacy_append", ByteBuffer.class, Bitmap.class, videoDecoder2);
        registry.append("legacy_append", ByteBuffer.class, BitmapDrawable.class, new BitmapDrawableDecoder(resources, videoDecoder2));
        this.glideContext = new GlideContext(context, arrayPool, registry, new androidx.savedstate.R$id(), requestOptionsFactory, arrayMap, list, engine, glideExperiments, i);
    }

    public static Glide get(Context context) {
        if (glide == null) {
            GeneratedAppGlideModule annotationGeneratedGlideModules = getAnnotationGeneratedGlideModules(context.getApplicationContext());
            synchronized (Glide.class) {
                if (glide == null) {
                    if (!isInitializing) {
                        isInitializing = true;
                        initializeGlide(context, new GlideBuilder(), annotationGeneratedGlideModules);
                        isInitializing = false;
                    } else {
                        throw new IllegalStateException("You cannot call Glide.get() in registerComponents(), use the provided Glide instance instead");
                    }
                }
            }
        }
        return glide;
    }

    public static GeneratedAppGlideModule getAnnotationGeneratedGlideModules(Context context) {
        try {
            return (GeneratedAppGlideModule) Class.forName("com.bumptech.glide.GeneratedAppGlideModuleImpl").getDeclaredConstructor(Context.class).newInstance(context.getApplicationContext());
        } catch (ClassNotFoundException unused) {
            if (Log.isLoggable("Glide", 5)) {
                Log.w("Glide", "Failed to find GeneratedAppGlideModule. You should include an annotationProcessor compile dependency on com.github.bumptech.glide:compiler in your application and a @GlideModule annotated AppGlideModule implementation or LibraryGlideModules will be silently ignored");
            }
            return null;
        } catch (IllegalAccessException e) {
            throw new IllegalStateException("GeneratedAppGlideModuleImpl is implemented incorrectly. If you've manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation.", e);
        } catch (InstantiationException e2) {
            throw new IllegalStateException("GeneratedAppGlideModuleImpl is implemented incorrectly. If you've manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation.", e2);
        } catch (NoSuchMethodException e3) {
            throw new IllegalStateException("GeneratedAppGlideModuleImpl is implemented incorrectly. If you've manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation.", e3);
        } catch (InvocationTargetException e4) {
            throw new IllegalStateException("GeneratedAppGlideModuleImpl is implemented incorrectly. If you've manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation.", e4);
        }
    }

    public static RequestManagerRetriever getRetriever(Context context) {
        if (context != null) {
            return get(context).requestManagerRetriever;
        }
        throw new NullPointerException("You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed).");
    }

    public static void initializeGlide(Context context, GlideBuilder glideBuilder, GeneratedAppGlideModule generatedAppGlideModule) {
        int i;
        Context applicationContext = context.getApplicationContext();
        Collections.emptyList();
        if (Log.isLoggable("ManifestParser", 3)) {
            Log.d("ManifestParser", "Loading Glide modules");
        }
        ArrayList arrayList = new ArrayList();
        try {
            ApplicationInfo applicationInfo = applicationContext.getPackageManager().getApplicationInfo(applicationContext.getPackageName(), 128);
            if (applicationInfo.metaData != null) {
                if (Log.isLoggable("ManifestParser", 2)) {
                    Log.v("ManifestParser", "Got app info metadata: " + applicationInfo.metaData);
                }
                for (String str : applicationInfo.metaData.keySet()) {
                    if ("GlideModule".equals(applicationInfo.metaData.get(str))) {
                        arrayList.add(ManifestParser.parseModule(str));
                        if (Log.isLoggable("ManifestParser", 3)) {
                            Log.d("ManifestParser", "Loaded Glide module: " + str);
                        }
                    }
                }
                if (Log.isLoggable("ManifestParser", 3)) {
                    Log.d("ManifestParser", "Finished loading Glide modules");
                }
            } else if (Log.isLoggable("ManifestParser", 3)) {
                Log.d("ManifestParser", "Got null app info metadata");
            }
            if (generatedAppGlideModule != null && !generatedAppGlideModule.getExcludedModuleClasses().isEmpty()) {
                Set<Class<?>> excludedModuleClasses = generatedAppGlideModule.getExcludedModuleClasses();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    GlideModule glideModule = (GlideModule) it.next();
                    if (excludedModuleClasses.contains(glideModule.getClass())) {
                        if (Log.isLoggable("Glide", 3)) {
                            Log.d("Glide", "AppGlideModule excludes manifest GlideModule: " + glideModule);
                        }
                        it.remove();
                    }
                }
            }
            if (Log.isLoggable("Glide", 3)) {
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Discovered GlideModule from manifest: ");
                    m.append(((GlideModule) it2.next()).getClass());
                    Log.d("Glide", m.toString());
                }
            }
            glideBuilder.requestManagerFactory = null;
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                ((GlideModule) it3.next()).applyOptions(applicationContext, glideBuilder);
            }
            if (glideBuilder.sourceExecutor == null) {
                if (GlideExecutor.bestThreadCount == 0) {
                    GlideExecutor.bestThreadCount = Math.min(4, Runtime.getRuntime().availableProcessors());
                }
                int i2 = GlideExecutor.bestThreadCount;
                if (!TextUtils.isEmpty("source")) {
                    glideBuilder.sourceExecutor = new GlideExecutor(new ThreadPoolExecutor(i2, i2, 0L, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new GlideExecutor.DefaultThreadFactory("source", false)));
                } else {
                    throw new IllegalArgumentException("Name must be non-null and non-empty, but given: source");
                }
            }
            if (glideBuilder.diskCacheExecutor == null) {
                int i3 = GlideExecutor.bestThreadCount;
                if (!TextUtils.isEmpty("disk-cache")) {
                    glideBuilder.diskCacheExecutor = new GlideExecutor(new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new GlideExecutor.DefaultThreadFactory("disk-cache", true)));
                } else {
                    throw new IllegalArgumentException("Name must be non-null and non-empty, but given: disk-cache");
                }
            }
            if (glideBuilder.animationExecutor == null) {
                if (GlideExecutor.bestThreadCount == 0) {
                    GlideExecutor.bestThreadCount = Math.min(4, Runtime.getRuntime().availableProcessors());
                }
                if (GlideExecutor.bestThreadCount >= 4) {
                    i = 2;
                } else {
                    i = 1;
                }
                if (!TextUtils.isEmpty("animation")) {
                    glideBuilder.animationExecutor = new GlideExecutor(new ThreadPoolExecutor(i, i, 0L, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new GlideExecutor.DefaultThreadFactory("animation", true)));
                } else {
                    throw new IllegalArgumentException("Name must be non-null and non-empty, but given: animation");
                }
            }
            if (glideBuilder.memorySizeCalculator == null) {
                glideBuilder.memorySizeCalculator = new MemorySizeCalculator(new MemorySizeCalculator.Builder(applicationContext));
            }
            if (glideBuilder.connectivityMonitorFactory == null) {
                glideBuilder.connectivityMonitorFactory = new DefaultConnectivityMonitorFactory();
            }
            if (glideBuilder.bitmapPool == null) {
                int i4 = glideBuilder.memorySizeCalculator.bitmapPoolSize;
                if (i4 > 0) {
                    glideBuilder.bitmapPool = new LruBitmapPool(i4);
                } else {
                    glideBuilder.bitmapPool = new BitmapPoolAdapter();
                }
            }
            if (glideBuilder.arrayPool == null) {
                glideBuilder.arrayPool = new LruArrayPool(glideBuilder.memorySizeCalculator.arrayPoolSize);
            }
            if (glideBuilder.memoryCache == null) {
                glideBuilder.memoryCache = new LruResourceCache(glideBuilder.memorySizeCalculator.memoryCacheSize);
            }
            if (glideBuilder.diskCacheFactory == null) {
                glideBuilder.diskCacheFactory = new InternalCacheDiskCacheFactory(applicationContext, 262144000L);
            }
            if (glideBuilder.engine == null) {
                glideBuilder.engine = new Engine(glideBuilder.memoryCache, glideBuilder.diskCacheFactory, glideBuilder.diskCacheExecutor, glideBuilder.sourceExecutor, new GlideExecutor(new ThreadPoolExecutor(0, Integer.MAX_VALUE, GlideExecutor.KEEP_ALIVE_TIME_MS, TimeUnit.MILLISECONDS, new SynchronousQueue(), new GlideExecutor.DefaultThreadFactory("source-unlimited", false))), glideBuilder.animationExecutor, null, null, null, null, null, null, false);
            }
            List<RequestListener<Object>> list = glideBuilder.defaultRequestListeners;
            if (list == null) {
                glideBuilder.defaultRequestListeners = Collections.emptyList();
            } else {
                glideBuilder.defaultRequestListeners = Collections.unmodifiableList(list);
            }
            GlideExperiments.Builder builder = glideBuilder.glideExperimentsBuilder;
            builder.getClass();
            Glide glide2 = new Glide(applicationContext, glideBuilder.engine, glideBuilder.memoryCache, glideBuilder.bitmapPool, glideBuilder.arrayPool, new RequestManagerRetriever(glideBuilder.requestManagerFactory), glideBuilder.connectivityMonitorFactory, glideBuilder.logLevel, glideBuilder.defaultRequestOptionsFactory, glideBuilder.defaultTransitionOptions, glideBuilder.defaultRequestListeners, new GlideExperiments(builder));
            Iterator it4 = arrayList.iterator();
            while (it4.hasNext()) {
                GlideModule glideModule2 = (GlideModule) it4.next();
                try {
                    glideModule2.registerComponents(glide2.registry);
                } catch (AbstractMethodError e) {
                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Attempting to register a Glide v3 module. If you see this, you or one of your dependencies may be including Glide v3 even though you're using Glide v4. You'll need to find and remove (or update) the offending dependency. The v3 module name is: ");
                    m2.append(glideModule2.getClass().getName());
                    throw new IllegalStateException(m2.toString(), e);
                }
            }
            applicationContext.registerComponentCallbacks(glide2);
            glide = glide2;
        } catch (PackageManager.NameNotFoundException e2) {
            throw new RuntimeException("Unable to find metadata to parse GlideModules", e2);
        }
    }

    public static void tearDown() {
        synchronized (Glide.class) {
            if (glide != null) {
                glide.glideContext.getBaseContext().getApplicationContext().unregisterComponentCallbacks(glide);
                glide.engine.shutdown();
            }
            glide = null;
        }
    }

    public final void unregisterRequestManager(RequestManager requestManager) {
        synchronized (this.managers) {
            if (this.managers.contains(requestManager)) {
                this.managers.remove(requestManager);
            } else {
                throw new IllegalStateException("Cannot unregister not yet registered manager");
            }
        }
    }

    public static void enableHardwareBitmaps() {
        HardwareConfigState hardwareConfigState = HardwareConfigState.getInstance();
        hardwareConfigState.getClass();
        Util.assertMainThread();
        hardwareConfigState.isHardwareConfigAllowedByAppState.set(true);
    }

    public static RequestManager with(Context context) {
        return getRetriever(context).get(context);
    }

    public final void clearMemory() {
        Util.assertMainThread();
        ((LruCache) this.memoryCache).trimToSize(0L);
        this.bitmapPool.clearMemory();
        this.arrayPool.clearMemory();
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i) {
        long j;
        Util.assertMainThread();
        synchronized (this.managers) {
            Iterator it = this.managers.iterator();
            while (it.hasNext()) {
                ((RequestManager) it.next()).getClass();
            }
        }
        LruResourceCache lruResourceCache = (LruResourceCache) this.memoryCache;
        if (i >= 40) {
            lruResourceCache.trimToSize(0L);
        } else if (i >= 20 || i == 15) {
            synchronized (lruResourceCache) {
                j = lruResourceCache.maxSize;
            }
            lruResourceCache.trimToSize(j / 2);
        } else {
            lruResourceCache.getClass();
        }
        this.bitmapPool.trimMemory(i);
        this.arrayPool.trimMemory(i);
    }

    public final void setMemoryCategory(MemoryCategory memoryCategory) {
        Util.assertMainThread();
        MemoryCache memoryCache = this.memoryCache;
        float multiplier = memoryCategory.getMultiplier();
        LruCache lruCache = (LruCache) memoryCache;
        synchronized (lruCache) {
            if (multiplier >= HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                long round = Math.round(((float) lruCache.initialMaxSize) * multiplier);
                lruCache.maxSize = round;
                lruCache.trimToSize(round);
            } else {
                throw new IllegalArgumentException("Multiplier must be >= 0");
            }
        }
        this.bitmapPool.setSizeMultiplier(memoryCategory.getMultiplier());
        this.memoryCategory = memoryCategory;
    }

    public static void init(Context context, GlideBuilder glideBuilder) {
        GeneratedAppGlideModule annotationGeneratedGlideModules = getAnnotationGeneratedGlideModules(context);
        synchronized (Glide.class) {
            if (glide != null) {
                tearDown();
            }
            initializeGlide(context, glideBuilder, annotationGeneratedGlideModules);
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        clearMemory();
    }
}
