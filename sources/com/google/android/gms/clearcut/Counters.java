package com.google.android.gms.clearcut;

import android.os.SystemClock;
import android.util.Log;
import com.android.wallpaper.util.LaunchUtils;
import com.google.android.gms.clearcut.ClearcutLogger;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import com.google.android.gms.common.api.internal.zzdh;
import com.google.android.gms.common.util.Clock;
import com.google.android.gms.common.util.zzh;
import com.google.android.gms.internal.zzgsy;
import com.google.android.gms.internal.zzgsz;
import com.google.android.gms.internal.zzgta;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* loaded from: classes.dex */
public final class Counters {
    public static final Charset zza = Charset.forName("UTF-8");
    public static final zzp zzs = new zzp();
    public final String zzc;
    public final int zzd;
    public final Clock zze;
    public LogEventModifier zzf;
    public long zzk;
    public final ClearcutLogger zzl;
    public final ReentrantReadWriteLock zzm = new ReentrantReadWriteLock();
    public TreeMap zzn = new TreeMap();
    public Integer zzp = null;
    public TreeMap<byte[], Integer> zzq = new TreeMap<>(zzs);

    /* loaded from: classes.dex */
    public abstract class AbstractCounter {
        public Map<Integer, Map<Long, long[]>> zza;
        public final String zzb;
        public int zzc;
        public final Object zze;

        public AbstractCounter(Counters counters, AbstractCounter abstractCounter) {
            this(abstractCounter.zzb);
            synchronized (abstractCounter.zze) {
                this.zzc = abstractCounter.zzc;
                Map<Integer, Map<Long, long[]>> map = this.zza;
                this.zza = abstractCounter.zza;
                abstractCounter.zza = map;
                abstractCounter.zzc = 0;
            }
        }

        public final void incrementBase(long j) {
            boolean z;
            Counters.this.zzm.readLock().lock();
            try {
                if (Counters.this.zzp == null) {
                    z = true;
                } else {
                    zzb(j);
                    z = false;
                }
                if (z) {
                    Lock writeLock = Counters.this.zzm.writeLock();
                    writeLock.lock();
                    try {
                        Counters counters = Counters.this;
                        counters.getClass();
                        Integer num = counters.zzq.get(null);
                        if (num == null) {
                            num = Integer.valueOf(counters.zzq.size());
                            counters.zzq.put(null, num);
                        }
                        counters.zzp = num;
                        Counters.this.zzm.readLock().lock();
                        writeLock.unlock();
                        writeLock = Counters.this.zzm.readLock();
                        zzb(j);
                    } finally {
                        writeLock.unlock();
                    }
                }
                Counters.this.getClass();
            } finally {
                Counters.this.zzm.readLock().unlock();
            }
        }

        public final String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("AbstractCounter");
            sb.append("(");
            sb.append(this.zzb);
            sb.append(")[");
            synchronized (this.zze) {
                for (Map.Entry<Integer, Map<Long, long[]>> entry : this.zza.entrySet()) {
                    sb.append(entry.getKey());
                    sb.append(" -> [");
                    for (Map.Entry<Long, long[]> entry2 : entry.getValue().entrySet()) {
                        sb.append(entry2.getKey());
                        sb.append(" = ");
                        sb.append(entry2.getValue()[0]);
                        sb.append(", ");
                    }
                    sb.append("], ");
                }
            }
            sb.append("]");
            return sb.toString();
        }

        public final void zzb(long j) {
            String str;
            synchronized (this.zze) {
                Map<Long, long[]> map = this.zza.get(Counters.this.zzp);
                if (map == null) {
                    map = new HashMap<>();
                    this.zza.put(Counters.this.zzp, map);
                }
                int i = this.zzc;
                int i2 = Counters.this.zzd;
                if (i >= i2) {
                    if (i == i2) {
                        String valueOf = String.valueOf(this.zzb);
                        if (valueOf.length() != 0) {
                            str = "exceeded sample count in ".concat(valueOf);
                        } else {
                            str = new String("exceeded sample count in ");
                        }
                        Log.i("Counters", str);
                    }
                    return;
                }
                this.zzc = i + 1;
                long[] jArr = map.get(Long.valueOf(j));
                if (jArr == null) {
                    jArr = new long[]{0};
                    map.put(Long.valueOf(j), jArr);
                }
                jArr[0] = jArr[0] + 1;
                Counters.this.getClass();
            }
        }

        public AbstractCounter(String str) {
            int i = Counters.this.zzd;
            this.zza = new HashMap();
            this.zze = new Object();
            if (Counters.this.zzn.containsKey(str)) {
                String valueOf = String.valueOf(str);
                throw new IllegalStateException(valueOf.length() != 0 ? "counter/histogram already exists: ".concat(valueOf) : new String("counter/histogram already exists: "));
            }
            Counters.this.zzn.put(str, this);
            this.zzb = str;
        }
    }

    /* loaded from: classes.dex */
    public class Counter extends AbstractCounter {
        public Counter(Counters counters, String str) {
            super(str);
        }

        public Counter(Counters counters, Counter counter) {
            super(counters, counter);
        }
    }

    /* loaded from: classes.dex */
    public class IntegerHistogram extends AbstractCounter {
        public IntegerHistogram(Counters counters, String str) {
            super(str);
        }

        public final void increment(int i) {
            incrementBase(i);
        }

        public IntegerHistogram(Counters counters, IntegerHistogram integerHistogram) {
            super(counters, integerHistogram);
        }
    }

    /* loaded from: classes.dex */
    public interface LogEventModifier {
        ClearcutLogger.LogEventBuilder modify();
    }

    /* loaded from: classes.dex */
    public class zzb implements ClearcutLogger.MessageProducer {
        public final byte[] zza;
        public final Integer zzb;
        public final ArrayList<AbstractCounter> zzc;

        public final int hashCode() {
            return 1;
        }

        public zzb(byte[] bArr) {
            this.zza = bArr;
            Integer num = Counters.this.zzq.get(bArr);
            this.zzb = num;
            ArrayList<AbstractCounter> arrayList = new ArrayList<>(Counters.this.zzn.size());
            for (AbstractCounter abstractCounter : Counters.this.zzn.values()) {
                if (abstractCounter.zza.containsKey(num)) {
                    arrayList.add(abstractCounter);
                }
            }
            this.zzc = arrayList;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof zzb)) {
                return false;
            }
            return zza().equals(((zzb) obj).zza());
        }

        public final zzgta zza() {
            zzgta zzgtaVar = new zzgta();
            zzgtaVar.zza = Counters.this.zzk;
            byte[] bArr = this.zza;
            if (bArr != null) {
                zzgtaVar.zzc = bArr;
            }
            zzgtaVar.zzb = new zzgsz[this.zzc.size()];
            ArrayList<AbstractCounter> arrayList = this.zzc;
            int size = arrayList.size();
            int i = 0;
            int i2 = 0;
            while (i < size) {
                AbstractCounter abstractCounter = arrayList.get(i);
                i++;
                AbstractCounter abstractCounter2 = abstractCounter;
                zzgsz[] zzgszVarArr = zzgtaVar.zzb;
                Map<Long, long[]> map = abstractCounter2.zza.get(this.zzb);
                zzgsz zzgszVar = new zzgsz();
                String str = abstractCounter2.zzb;
                try {
                    MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                    messageDigest.update(str.getBytes(Counters.zza));
                    zzgszVar.zza = ByteBuffer.wrap(messageDigest.digest()).getLong();
                    zzgszVar.zzb = new zzgsy[map.size()];
                    int i3 = 0;
                    for (Map.Entry<Long, long[]> entry : map.entrySet()) {
                        zzgsy zzgsyVar = new zzgsy();
                        zzgsyVar.zza = entry.getKey().longValue();
                        zzgsyVar.zzb = entry.getValue()[0];
                        zzgszVar.zzb[i3] = zzgsyVar;
                        i3++;
                    }
                    zzgszVarArr[i2] = zzgszVar;
                    i2++;
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }
            }
            return zzgtaVar;
        }

        public final String toString() {
            return zza().toString();
        }
    }

    public final Counter getCounter(String str) {
        String str2;
        this.zzm.writeLock().lock();
        try {
            AbstractCounter abstractCounter = (AbstractCounter) this.zzn.get(str);
            if (abstractCounter == null) {
                this.zzm.writeLock().lock();
                Counter counter = new Counter(this, str);
                this.zzm.writeLock().unlock();
                return counter;
            }
            try {
                return (Counter) abstractCounter;
            } catch (ClassCastException unused) {
                String valueOf = String.valueOf(str);
                if (valueOf.length() != 0) {
                    str2 = "another type of counter exists with name: ".concat(valueOf);
                } else {
                    str2 = new String("another type of counter exists with name: ");
                }
                throw new IllegalArgumentException(str2);
            }
        } finally {
            this.zzm.writeLock().unlock();
        }
    }

    public final IntegerHistogram getIntegerHistogram(String str) {
        String str2;
        this.zzm.writeLock().lock();
        try {
            AbstractCounter abstractCounter = (AbstractCounter) this.zzn.get(str);
            if (abstractCounter == null) {
                this.zzm.writeLock().lock();
                IntegerHistogram integerHistogram = new IntegerHistogram(this, str);
                this.zzm.writeLock().unlock();
                return integerHistogram;
            }
            try {
                return (IntegerHistogram) abstractCounter;
            } catch (ClassCastException unused) {
                if (str.length() != 0) {
                    str2 = "another type of counter exists with name: ".concat(str);
                } else {
                    str2 = new String("another type of counter exists with name: ");
                }
                throw new IllegalArgumentException(str2);
            }
        } finally {
            this.zzm.writeLock().unlock();
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void logAllAsync() {
        LogEventModifier logEventModifier = this.zzf;
        this.zzm.writeLock().lock();
        try {
            Counters snapshotAndReset = snapshotAndReset();
            this.zzm.writeLock().unlock();
            Set<byte[]> keySet = snapshotAndReset.zzq.keySet();
            int size = keySet.size();
            ClearcutLogger.MessageProducer[] messageProducerArr = new ClearcutLogger.MessageProducer[size];
            int i = 0;
            for (byte[] bArr : keySet) {
                messageProducerArr[i] = new zzb(bArr);
                i++;
            }
            BasePendingResult basePendingResult = null;
            for (int i2 = 0; i2 < size; i2++) {
                ClearcutLogger.MessageProducer messageProducer = messageProducerArr[i2];
                ClearcutLogger clearcutLogger = snapshotAndReset.zzl;
                clearcutLogger.getClass();
                ClearcutLogger.LogEventBuilder logEventBuilder = new ClearcutLogger.LogEventBuilder(null, messageProducer);
                logEventBuilder.zzb = snapshotAndReset.zzc;
                if (logEventModifier != null) {
                    logEventBuilder = logEventModifier.modify();
                }
                basePendingResult = logEventBuilder.logAsync();
            }
            if (basePendingResult == null) {
                Status status = Status.zza;
                if (status != null) {
                    new zzdh().zza((zzdh) status);
                    return;
                }
                throw new NullPointerException("Result must not be null");
            }
        } catch (Throwable th) {
            this.zzm.writeLock().unlock();
            throw th;
        }
    }

    public final Counters snapshotAndReset() {
        Object obj;
        Counters counters = new Counters(this.zzl, this.zzc, this.zzd, this.zze);
        ReentrantReadWriteLock.WriteLock writeLock = this.zzm.writeLock();
        writeLock.lock();
        try {
            counters.zzp = this.zzp;
            counters.zzk = this.zzk;
            counters.zzf = this.zzf;
            counters.zzn = new TreeMap();
            for (Map.Entry entry : this.zzn.entrySet()) {
                TreeMap treeMap = counters.zzn;
                String str = (String) entry.getKey();
                AbstractCounter abstractCounter = (AbstractCounter) entry.getValue();
                if (abstractCounter instanceof Counter) {
                    obj = new Counter(counters, (Counter) abstractCounter);
                } else if (abstractCounter instanceof TimerHistogram) {
                    obj = new TimerHistogram(counters, (TimerHistogram) abstractCounter);
                } else if (abstractCounter instanceof IntegerHistogram) {
                    obj = new IntegerHistogram(counters, (IntegerHistogram) abstractCounter);
                } else if (abstractCounter instanceof LongHistogram) {
                    obj = new LongHistogram(counters, (LongHistogram) abstractCounter);
                } else if (abstractCounter instanceof BooleanHistogram) {
                    obj = new BooleanHistogram(counters, (BooleanHistogram) abstractCounter);
                } else {
                    String valueOf = String.valueOf(abstractCounter);
                    StringBuilder sb = new StringBuilder(valueOf.length() + 21);
                    sb.append("Unkown counter type: ");
                    sb.append(valueOf);
                    throw new IllegalArgumentException(sb.toString());
                }
                treeMap.put(str, obj);
            }
            TreeMap<byte[], Integer> treeMap2 = counters.zzq;
            counters.zzq = this.zzq;
            this.zzq = treeMap2;
            this.zzp = null;
            ((zzh) counters.zze).getClass();
            this.zzk = SystemClock.elapsedRealtime();
            return counters;
        } finally {
            writeLock.unlock();
        }
    }

    /* JADX WARN: Finally extract failed */
    public final String toString() {
        String str;
        StringBuilder sb = new StringBuilder();
        this.zzm.readLock().lock();
        try {
            sb.append("{");
            for (Map.Entry<byte[], Integer> entry : this.zzq.entrySet()) {
                if (entry.getKey() == null) {
                    str = "null";
                } else {
                    str = new String(entry.getKey());
                }
                sb.append(str);
                sb.append(", ");
            }
            sb.append("}\n");
            for (AbstractCounter abstractCounter : this.zzn.values()) {
                sb.append(abstractCounter.toString());
                sb.append("\n");
            }
            this.zzm.readLock().unlock();
            return sb.toString();
        } catch (Throwable th) {
            this.zzm.readLock().unlock();
            throw th;
        }
    }

    public Counters(ClearcutLogger clearcutLogger, String str, int i, Clock clock) {
        boolean z;
        LaunchUtils.zza(clearcutLogger);
        LaunchUtils.zza(str);
        if (i > 0) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            LaunchUtils.zza(clock);
            this.zzl = clearcutLogger;
            this.zzc = str;
            this.zzd = i;
            this.zze = clock;
            this.zzk = SystemClock.elapsedRealtime();
            return;
        }
        throw new IllegalArgumentException();
    }

    /* loaded from: classes.dex */
    public class BooleanHistogram extends AbstractCounter {
        public BooleanHistogram(Counters counters, BooleanHistogram booleanHistogram) {
            super(counters, booleanHistogram);
        }
    }

    /* loaded from: classes.dex */
    public class LongHistogram extends zza {
        public LongHistogram(Counters counters, LongHistogram longHistogram) {
            super(counters, longHistogram);
        }
    }

    /* loaded from: classes.dex */
    public class TimerHistogram extends zza {
        public TimerHistogram(Counters counters, TimerHistogram timerHistogram) {
            super(counters, timerHistogram);
        }
    }

    /* loaded from: classes.dex */
    public class zza extends AbstractCounter {
        public zza(Counters counters, zza zzaVar) {
            super(counters, zzaVar);
        }
    }
}
