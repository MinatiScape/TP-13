package kotlinx.coroutines;

import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public abstract class EventLoopImplPlatform extends EventLoop {
    @NotNull
    public abstract Thread getThread();

    /* JADX WARN: Removed duplicated region for block: B:37:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0082  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void reschedule(long r13, @org.jetbrains.annotations.NotNull kotlinx.coroutines.EventLoopImplBase.DelayedTask r15) {
        /*
            r12 = this;
            boolean r12 = kotlinx.coroutines.DebugKt.DEBUG
            kotlinx.coroutines.DefaultExecutor r12 = kotlinx.coroutines.DefaultExecutor.INSTANCE
            java.util.Objects.requireNonNull(r12)
            boolean r0 = r12.isCompleted
            r1 = 0
            r2 = 2
            r3 = 1
            r4 = 0
            if (r0 == 0) goto L10
            goto L3e
        L10:
            java.lang.Object r0 = r12._delayed
            kotlinx.coroutines.EventLoopImplBase$DelayedTaskQueue r0 = (kotlinx.coroutines.EventLoopImplBase.DelayedTaskQueue) r0
            if (r0 == 0) goto L17
            goto L27
        L17:
            java.util.concurrent.atomic.AtomicReferenceFieldUpdater r0 = kotlinx.coroutines.EventLoopImplBase._delayed$FU
            kotlinx.coroutines.EventLoopImplBase$DelayedTaskQueue r5 = new kotlinx.coroutines.EventLoopImplBase$DelayedTaskQueue
            r5.<init>(r13)
            r0.compareAndSet(r12, r4, r5)
            java.lang.Object r0 = r12._delayed
            if (r0 == 0) goto Lae
            kotlinx.coroutines.EventLoopImplBase$DelayedTaskQueue r0 = (kotlinx.coroutines.EventLoopImplBase.DelayedTaskQueue) r0
        L27:
            monitor-enter(r15)
            java.lang.Object r5 = r15._heap     // Catch: java.lang.Throwable -> Lab
            kotlinx.coroutines.internal.Symbol r6 = kotlinx.coroutines.EventLoop_commonKt.DISPOSED_TASK     // Catch: java.lang.Throwable -> Lab
            if (r5 != r6) goto L31
            monitor-exit(r15)
            r0 = r2
            goto L6b
        L31:
            monitor-enter(r0)     // Catch: java.lang.Throwable -> Lab
            kotlinx.coroutines.internal.ThreadSafeHeapNode r5 = r0.firstImpl()     // Catch: java.lang.Throwable -> La8
            kotlinx.coroutines.EventLoopImplBase$DelayedTask r5 = (kotlinx.coroutines.EventLoopImplBase.DelayedTask) r5     // Catch: java.lang.Throwable -> La8
            boolean r6 = r12.isCompleted     // Catch: java.lang.Throwable -> La8
            if (r6 == 0) goto L40
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            monitor-exit(r15)
        L3e:
            r0 = r3
            goto L6b
        L40:
            r6 = 0
            if (r5 != 0) goto L47
            r0.timeNow = r13     // Catch: java.lang.Throwable -> La8
            goto L5a
        L47:
            long r8 = r5.nanoTime     // Catch: java.lang.Throwable -> La8
            long r10 = r8 - r13
            int r5 = (r10 > r6 ? 1 : (r10 == r6 ? 0 : -1))
            if (r5 < 0) goto L50
            r8 = r13
        L50:
            long r10 = r0.timeNow     // Catch: java.lang.Throwable -> La8
            long r10 = r8 - r10
            int r5 = (r10 > r6 ? 1 : (r10 == r6 ? 0 : -1))
            if (r5 <= 0) goto L5a
            r0.timeNow = r8     // Catch: java.lang.Throwable -> La8
        L5a:
            long r8 = r15.nanoTime     // Catch: java.lang.Throwable -> La8
            long r10 = r0.timeNow     // Catch: java.lang.Throwable -> La8
            long r8 = r8 - r10
            int r5 = (r8 > r6 ? 1 : (r8 == r6 ? 0 : -1))
            if (r5 >= 0) goto L65
            r15.nanoTime = r10     // Catch: java.lang.Throwable -> La8
        L65:
            r0.addImpl(r15)     // Catch: java.lang.Throwable -> La8
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            monitor-exit(r15)
            r0 = r1
        L6b:
            if (r0 == 0) goto L82
            if (r0 == r3) goto L7e
            if (r0 != r2) goto L72
            goto La7
        L72:
            java.lang.String r12 = "unexpected result"
            java.lang.IllegalStateException r13 = new java.lang.IllegalStateException
            java.lang.String r12 = r12.toString()
            r13.<init>(r12)
            throw r13
        L7e:
            r12.reschedule(r13, r15)
            goto La7
        L82:
            java.lang.Object r13 = r12._delayed
            kotlinx.coroutines.EventLoopImplBase$DelayedTaskQueue r13 = (kotlinx.coroutines.EventLoopImplBase.DelayedTaskQueue) r13
            if (r13 == 0) goto L95
            monitor-enter(r13)
            kotlinx.coroutines.internal.ThreadSafeHeapNode r14 = r13.firstImpl()     // Catch: java.lang.Throwable -> L92
            monitor-exit(r13)
            r4 = r14
            kotlinx.coroutines.EventLoopImplBase$DelayedTask r4 = (kotlinx.coroutines.EventLoopImplBase.DelayedTask) r4
            goto L95
        L92:
            r12 = move-exception
            monitor-exit(r13)
            throw r12
        L95:
            if (r4 != r15) goto L98
            r1 = r3
        L98:
            if (r1 == 0) goto La7
            java.lang.Thread r12 = r12.getThread()
            java.lang.Thread r13 = java.lang.Thread.currentThread()
            if (r13 == r12) goto La7
            java.util.concurrent.locks.LockSupport.unpark(r12)
        La7:
            return
        La8:
            r12 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            throw r12     // Catch: java.lang.Throwable -> Lab
        Lab:
            r12 = move-exception
            monitor-exit(r15)
            throw r12
        Lae:
            kotlin.jvm.internal.Intrinsics.throwNpe()
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.EventLoopImplPlatform.reschedule(long, kotlinx.coroutines.EventLoopImplBase$DelayedTask):void");
    }
}
