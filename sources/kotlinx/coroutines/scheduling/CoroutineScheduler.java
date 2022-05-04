package kotlinx.coroutines.scheduling;

import androidx.recyclerview.widget.RecyclerView;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.locks.LockSupport;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import kotlinx.atomicfu.AtomicBoolean;
import kotlinx.atomicfu.AtomicInt;
import kotlinx.atomicfu.AtomicLong;
import kotlinx.atomicfu.InterceptorKt;
import kotlinx.atomicfu.TraceBase;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.DebugStringsKt;
import kotlinx.coroutines.internal.Symbol;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: CoroutineScheduler.kt */
/* loaded from: classes.dex */
public final class CoroutineScheduler implements Executor, Closeable {
    @NotNull
    public static final Symbol NOT_IN_STACK = new Symbol("NOT_IN_STACK");
    @NotNull
    public final AtomicBoolean _isTerminated;
    @NotNull
    public final AtomicLong controlState;
    public final int corePoolSize;
    @NotNull
    public final GlobalQueue globalBlockingQueue;
    @NotNull
    public final GlobalQueue globalCpuQueue;
    public final long idleWorkerKeepAliveNs;
    public final int maxPoolSize;
    @NotNull
    public final AtomicLong parkedWorkersStack;
    @NotNull
    public final String schedulerName;
    @NotNull
    public final AtomicReferenceArray<Worker> workers;

    /* compiled from: CoroutineScheduler.kt */
    /* loaded from: classes.dex */
    public final class Worker extends Thread {
        public volatile int indexInArray;
        @NotNull
        public final WorkQueue localQueue;
        public boolean mayHaveLocalTasks;
        public long minDelayUntilStealableTaskNs;
        @Nullable
        public volatile Object nextParkedWorker;
        public int rngState;
        @NotNull
        public WorkerState state;
        public long terminationDeadline;
        public final /* synthetic */ CoroutineScheduler this$0;
        @NotNull
        public final AtomicInt workerCtl;

        public Worker() {
            throw null;
        }

        public Worker(CoroutineScheduler this$0, int i) {
            Intrinsics.checkNotNullParameter(this$0, "this$0");
            this.this$0 = this$0;
            this.this$0 = this$0;
            setDaemon(true);
            this.localQueue = new WorkQueue();
            this.state = WorkerState.DORMANT;
            this.workerCtl = new AtomicInt();
            this.nextParkedWorker = CoroutineScheduler.NOT_IN_STACK;
            this.rngState = Random.Default.nextInt();
            setIndexInArray(i);
        }

        public final Task pollGlobalQueues() {
            if (nextInt(2) == 0) {
                Task task = (Task) this.this$0.globalCpuQueue.removeFirstOrNull();
                if (task == null) {
                    return (Task) this.this$0.globalBlockingQueue.removeFirstOrNull();
                }
                return task;
            }
            Task task2 = (Task) this.this$0.globalBlockingQueue.removeFirstOrNull();
            if (task2 == null) {
                return (Task) this.this$0.globalCpuQueue.removeFirstOrNull();
            }
            return task2;
        }

        /* JADX WARN: Removed duplicated region for block: B:17:0x0037  */
        /* JADX WARN: Removed duplicated region for block: B:36:0x0077  */
        @org.jetbrains.annotations.Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final kotlinx.coroutines.scheduling.Task findTask(boolean r11) {
            /*
                r10 = this;
                kotlinx.coroutines.scheduling.CoroutineScheduler$WorkerState r0 = kotlinx.coroutines.scheduling.CoroutineScheduler.WorkerState.CPU_ACQUIRED
                kotlinx.coroutines.scheduling.CoroutineScheduler$WorkerState r1 = r10.state
                r2 = 0
                r3 = 1
                if (r1 != r0) goto L9
                goto L31
            L9:
                kotlinx.coroutines.scheduling.CoroutineScheduler r1 = r10.this$0
                kotlinx.atomicfu.AtomicLong r4 = r1.controlState
            Ld:
                long r5 = r4.value
                r7 = 9223367638808264704(0x7ffffc0000000000, double:NaN)
                long r7 = r7 & r5
                r9 = 42
                long r7 = r7 >> r9
                int r7 = (int) r7
                if (r7 != 0) goto L1d
                r1 = r2
                goto L2d
            L1d:
                r7 = 4398046511104(0x40000000000, double:2.1729236899484E-311)
                long r7 = r5 - r7
                kotlinx.atomicfu.AtomicLong r9 = r1.controlState
                boolean r5 = r9.compareAndSet(r5, r7)
                if (r5 == 0) goto Ld
                r1 = r3
            L2d:
                if (r1 == 0) goto L33
                r10.state = r0
            L31:
                r0 = r3
                goto L34
            L33:
                r0 = r2
            L34:
                r1 = 0
                if (r0 == 0) goto L77
                if (r11 == 0) goto L6c
                kotlinx.coroutines.scheduling.CoroutineScheduler r11 = r10.this$0
                int r11 = r11.corePoolSize
                int r11 = r11 * 2
                int r11 = r10.nextInt(r11)
                if (r11 != 0) goto L46
                goto L47
            L46:
                r3 = r2
            L47:
                if (r3 == 0) goto L4f
                kotlinx.coroutines.scheduling.Task r11 = r10.pollGlobalQueues()
                if (r11 != 0) goto L76
            L4f:
                kotlinx.coroutines.scheduling.WorkQueue r11 = r10.localQueue
                kotlinx.atomicfu.AtomicRef<kotlinx.coroutines.scheduling.Task> r0 = r11.lastScheduledTask
                java.lang.Object r0 = r0.getAndSet(r1)
                kotlinx.coroutines.scheduling.Task r0 = (kotlinx.coroutines.scheduling.Task) r0
                if (r0 != 0) goto L60
                kotlinx.coroutines.scheduling.Task r11 = r11.pollBuffer()
                goto L61
            L60:
                r11 = r0
            L61:
                if (r11 != 0) goto L76
                if (r3 != 0) goto L72
                kotlinx.coroutines.scheduling.Task r11 = r10.pollGlobalQueues()
                if (r11 != 0) goto L76
                goto L72
            L6c:
                kotlinx.coroutines.scheduling.Task r11 = r10.pollGlobalQueues()
                if (r11 != 0) goto L76
            L72:
                kotlinx.coroutines.scheduling.Task r11 = r10.trySteal(r2)
            L76:
                return r11
            L77:
                if (r11 == 0) goto L97
                kotlinx.coroutines.scheduling.WorkQueue r11 = r10.localQueue
                kotlinx.atomicfu.AtomicRef<kotlinx.coroutines.scheduling.Task> r0 = r11.lastScheduledTask
                java.lang.Object r0 = r0.getAndSet(r1)
                kotlinx.coroutines.scheduling.Task r0 = (kotlinx.coroutines.scheduling.Task) r0
                if (r0 != 0) goto L89
                kotlinx.coroutines.scheduling.Task r0 = r11.pollBuffer()
            L89:
                if (r0 != 0) goto La2
                kotlinx.coroutines.scheduling.CoroutineScheduler r11 = r10.this$0
                kotlinx.coroutines.scheduling.GlobalQueue r11 = r11.globalBlockingQueue
                java.lang.Object r11 = r11.removeFirstOrNull()
                r0 = r11
                kotlinx.coroutines.scheduling.Task r0 = (kotlinx.coroutines.scheduling.Task) r0
                goto La2
            L97:
                kotlinx.coroutines.scheduling.CoroutineScheduler r11 = r10.this$0
                kotlinx.coroutines.scheduling.GlobalQueue r11 = r11.globalBlockingQueue
                java.lang.Object r11 = r11.removeFirstOrNull()
                r0 = r11
                kotlinx.coroutines.scheduling.Task r0 = (kotlinx.coroutines.scheduling.Task) r0
            La2:
                if (r0 != 0) goto La8
                kotlinx.coroutines.scheduling.Task r0 = r10.trySteal(r3)
            La8:
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.scheduling.CoroutineScheduler.Worker.findTask(boolean):kotlinx.coroutines.scheduling.Task");
        }

        public final int nextInt(int i) {
            int i2 = this.rngState;
            int i3 = i2 ^ (i2 << 13);
            int i4 = i3 ^ (i3 >> 17);
            int i5 = i4 ^ (i4 << 5);
            this.rngState = i5;
            int i6 = i - 1;
            if ((i6 & i) == 0) {
                return i6 & i5;
            }
            return (Integer.MAX_VALUE & i5) % i;
        }

        /* JADX WARN: Code restructure failed: missing block: B:13:0x0027, code lost:
            r18.minDelayUntilStealableTaskNs = 0;
            r0 = kotlinx.coroutines.scheduling.CoroutineScheduler.WorkerState.BLOCKING;
            r4 = r6.taskContext.getTaskMode();
            r18.terminationDeadline = 0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:14:0x0035, code lost:
            if (r18.state != r2) goto L16;
         */
        /* JADX WARN: Code restructure failed: missing block: B:15:0x0037, code lost:
            r5 = kotlinx.coroutines.DebugKt.DEBUG;
            r18.state = r0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:16:0x003b, code lost:
            if (r4 != 0) goto L17;
         */
        /* JADX WARN: Code restructure failed: missing block: B:18:0x0042, code lost:
            if (tryReleaseCpu(r0) == false) goto L24;
         */
        /* JADX WARN: Code restructure failed: missing block: B:19:0x0044, code lost:
            r0 = r18.this$0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:20:0x004a, code lost:
            if (r0.tryUnpark() == false) goto L21;
         */
        /* JADX WARN: Code restructure failed: missing block: B:22:0x0055, code lost:
            if (r0.tryCreateWorker(r0.controlState.value) == false) goto L23;
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:0x0058, code lost:
            r0.tryUnpark();
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x005b, code lost:
            r18.this$0.getClass();
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x0060, code lost:
            r6.run();
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x0064, code lost:
            r0 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:29:0x0071, code lost:
            if (r4 == 0) goto L117;
         */
        /* JADX WARN: Code restructure failed: missing block: B:30:0x0074, code lost:
            r18.this$0.controlState.addAndGet(-2097152);
         */
        /* JADX WARN: Code restructure failed: missing block: B:31:0x007d, code lost:
            if (r18.state != r3) goto L114;
         */
        /* JADX WARN: Code restructure failed: missing block: B:32:0x007f, code lost:
            r0 = kotlinx.coroutines.DebugKt.DEBUG;
            r18.state = kotlinx.coroutines.scheduling.CoroutineScheduler.WorkerState.DORMANT;
         */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void run() {
            /*
                Method dump skipped, instructions count: 465
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.scheduling.CoroutineScheduler.Worker.run():void");
        }

        public final void setIndexInArray(int i) {
            String str;
            StringBuilder sb = new StringBuilder();
            sb.append(this.this$0.schedulerName);
            sb.append("-worker-");
            if (i == 0) {
                str = "TERMINATED";
            } else {
                str = String.valueOf(i);
            }
            sb.append(str);
            setName(sb.toString());
            this.indexInArray = i;
        }

        public final boolean tryReleaseCpu(@NotNull WorkerState workerState) {
            boolean z;
            WorkerState workerState2 = this.state;
            if (workerState2 == WorkerState.CPU_ACQUIRED) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                this.this$0.controlState.addAndGet(4398046511104L);
            }
            if (workerState2 != workerState) {
                this.state = workerState;
            }
            return z;
        }

        public final Task trySteal(boolean z) {
            long j;
            boolean z2;
            boolean z3 = DebugKt.DEBUG;
            int i = (int) (this.this$0.controlState.value & 2097151);
            if (i < 2) {
                return null;
            }
            int nextInt = nextInt(i);
            CoroutineScheduler coroutineScheduler = this.this$0;
            int i2 = 0;
            long j2 = RecyclerView.FOREVER_NS;
            while (i2 < i) {
                i2++;
                nextInt++;
                if (nextInt > i) {
                    nextInt = 1;
                }
                Worker worker = coroutineScheduler.workers.get(nextInt);
                if (worker != null && worker != this) {
                    boolean z4 = DebugKt.DEBUG;
                    if (z) {
                        WorkQueue workQueue = this.localQueue;
                        WorkQueue victim = worker.localQueue;
                        workQueue.getClass();
                        Intrinsics.checkNotNullParameter(victim, "victim");
                        int i3 = victim.producerIndex.value;
                        AtomicReferenceArray<Task> atomicReferenceArray = victim.buffer;
                        for (int i4 = victim.consumerIndex.value; i4 != i3; i4++) {
                            int i5 = i4 & 127;
                            if (victim.blockingTasksInBuffer.value == 0) {
                                break;
                            }
                            Task task = atomicReferenceArray.get(i5);
                            if (task != null) {
                                if (task.taskContext.getTaskMode() == 1) {
                                    z2 = true;
                                } else {
                                    z2 = false;
                                }
                                if (z2 && atomicReferenceArray.compareAndSet(i5, task, null)) {
                                    victim.blockingTasksInBuffer.decrementAndGet();
                                    workQueue.add(task, false);
                                    j = -1;
                                    break;
                                }
                            }
                        }
                        j = workQueue.tryStealLastScheduled(victim, true);
                    } else {
                        WorkQueue workQueue2 = this.localQueue;
                        WorkQueue victim2 = worker.localQueue;
                        workQueue2.getClass();
                        Intrinsics.checkNotNullParameter(victim2, "victim");
                        Task pollBuffer = victim2.pollBuffer();
                        if (pollBuffer != null) {
                            workQueue2.add(pollBuffer, false);
                            j = -1;
                        } else {
                            j = workQueue2.tryStealLastScheduled(victim2, false);
                        }
                    }
                    if (j == -1) {
                        WorkQueue workQueue3 = this.localQueue;
                        Task andSet = workQueue3.lastScheduledTask.getAndSet(null);
                        if (andSet == null) {
                            return workQueue3.pollBuffer();
                        }
                        return andSet;
                    } else if (j > 0) {
                        j2 = Math.min(j2, j);
                    }
                }
            }
            if (j2 == RecyclerView.FOREVER_NS) {
                j2 = 0;
            }
            this.minDelayUntilStealableTaskNs = j2;
            return null;
        }
    }

    /* compiled from: CoroutineScheduler.kt */
    /* loaded from: classes.dex */
    public enum WorkerState {
        CPU_ACQUIRED,
        BLOCKING,
        PARKING,
        DORMANT,
        TERMINATED
    }

    public CoroutineScheduler(int i, int i2, long j, @NotNull String schedulerName) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        Intrinsics.checkNotNullParameter(schedulerName, "schedulerName");
        this.corePoolSize = i;
        this.maxPoolSize = i2;
        this.idleWorkerKeepAliveNs = j;
        this.schedulerName = schedulerName;
        if (i >= 1) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            if (i2 >= i) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                if (i2 <= 2097150) {
                    z3 = true;
                } else {
                    z3 = false;
                }
                if (z3) {
                    if (j > 0) {
                        z4 = true;
                    } else {
                        z4 = false;
                    }
                    if (z4) {
                        this.globalCpuQueue = new GlobalQueue();
                        this.globalBlockingQueue = new GlobalQueue();
                        this.parkedWorkersStack = new AtomicLong(0L);
                        this.workers = new AtomicReferenceArray<>(i2 + 1);
                        this.controlState = new AtomicLong(i << 42);
                        this._isTerminated = new AtomicBoolean(false);
                        return;
                    }
                    throw new IllegalArgumentException(("Idle worker keep alive time " + j + " must be positive").toString());
                }
                throw new IllegalArgumentException(("Max pool size " + i2 + " should not exceed maximal supported number of threads 2097150").toString());
            }
            throw new IllegalArgumentException(("Max pool size " + i2 + " should be greater than or equals to core pool size " + i).toString());
        }
        throw new IllegalArgumentException(("Core pool size " + i + " should be at least 1").toString());
    }

    @NotNull
    public static Task createTask(@NotNull Runnable block, @NotNull TaskContext taskContext) {
        Intrinsics.checkNotNullParameter(block, "block");
        Intrinsics.checkNotNullParameter(taskContext, "taskContext");
        TasksKt.schedulerTimeSource.getClass();
        long nanoTime = System.nanoTime();
        if (!(block instanceof Task)) {
            return new TaskImpl(block, nanoTime, taskContext);
        }
        Task task = (Task) block;
        task.submissionTime = nanoTime;
        task.taskContext = taskContext;
        return task;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0081 A[LOOP:0: B:20:0x0035->B:34:0x0081, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0083 A[EDGE_INSN: B:68:0x0083->B:35:0x0083 ?: BREAK  , SYNTHETIC] */
    @Override // java.io.Closeable, java.lang.AutoCloseable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void close() {
        /*
            Method dump skipped, instructions count: 254
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.scheduling.CoroutineScheduler.close():void");
    }

    public final int createNewWorker() {
        boolean z;
        boolean z2;
        synchronized (this.workers) {
            boolean z3 = false;
            if (this._isTerminated._value != 0) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                return -1;
            }
            long j = this.controlState.value;
            int i = (int) (j & 2097151);
            int i2 = i - ((int) ((j & 4398044413952L) >> 21));
            if (i2 < 0) {
                i2 = 0;
            }
            if (i2 >= this.corePoolSize) {
                return 0;
            }
            if (i >= this.maxPoolSize) {
                return 0;
            }
            int i3 = ((int) (this.controlState.value & 2097151)) + 1;
            if (i3 <= 0 || this.workers.get(i3) != null) {
                z2 = false;
            } else {
                z2 = true;
            }
            if (z2) {
                Worker worker = new Worker(this, i3);
                this.workers.set(i3, worker);
                AtomicLong atomicLong = this.controlState;
                atomicLong.getClass();
                int i4 = InterceptorKt.$r8$clinit;
                long incrementAndGet = AtomicLong.FU.incrementAndGet(atomicLong);
                TraceBase traceBase = atomicLong.trace;
                if (traceBase != TraceBase.None.INSTANCE) {
                    String stringPlus = Intrinsics.stringPlus("incAndGet():", Long.valueOf(incrementAndGet));
                    traceBase.getClass();
                    TraceBase.append(stringPlus);
                }
                if (i3 == ((int) (2097151 & incrementAndGet))) {
                    z3 = true;
                }
                if (z3) {
                    worker.start();
                    return i2 + 1;
                }
                throw new IllegalArgumentException("Failed requirement.".toString());
            }
            throw new IllegalArgumentException("Failed requirement.".toString());
        }
    }

    public final void dispatch(@NotNull Runnable block, @NotNull TaskContext taskContext, boolean z) {
        Worker worker;
        Task task;
        boolean z2;
        boolean z3;
        Intrinsics.checkNotNullParameter(block, "block");
        Intrinsics.checkNotNullParameter(taskContext, "taskContext");
        Task createTask = createTask(block, taskContext);
        Thread currentThread = Thread.currentThread();
        Worker worker2 = null;
        if (currentThread instanceof Worker) {
            worker = (Worker) currentThread;
        } else {
            worker = null;
        }
        if (worker != null && Intrinsics.areEqual(worker.this$0, this)) {
            worker2 = worker;
        }
        boolean z4 = true;
        if (worker2 == null || worker2.state == WorkerState.TERMINATED || (createTask.taskContext.getTaskMode() == 0 && worker2.state == WorkerState.BLOCKING)) {
            task = createTask;
        } else {
            worker2.mayHaveLocalTasks = true;
            task = worker2.localQueue.add(createTask, z);
        }
        if (task != null) {
            if (task.taskContext.getTaskMode() == 1) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                z3 = this.globalBlockingQueue.addLast(task);
            } else {
                z3 = this.globalCpuQueue.addLast(task);
            }
            if (!z3) {
                throw new RejectedExecutionException(Intrinsics.stringPlus(this.schedulerName, " was terminated"));
            }
        }
        if (!z || worker2 == null) {
            z4 = false;
        }
        if (createTask.taskContext.getTaskMode() != 0) {
            long addAndGet = this.controlState.addAndGet(2097152L);
            if (!z4 && !tryUnpark() && !tryCreateWorker(addAndGet)) {
                tryUnpark();
            }
        } else if (!z4 && !tryUnpark() && !tryCreateWorker(this.controlState.value)) {
            tryUnpark();
        }
    }

    @Override // java.util.concurrent.Executor
    public final void execute(@NotNull Runnable command) {
        Intrinsics.checkNotNullParameter(command, "command");
        dispatch(command, NonBlockingContext.INSTANCE, false);
    }

    public final void parkedWorkersStackTopUpdate(@NotNull Worker worker, int i, int i2) {
        Intrinsics.checkNotNullParameter(worker, "worker");
        AtomicLong atomicLong = this.parkedWorkersStack;
        while (true) {
            long j = atomicLong.value;
            int i3 = (int) (2097151 & j);
            long j2 = (2097152 + j) & (-2097152);
            if (i3 == i) {
                if (i2 == 0) {
                    Object obj = worker.nextParkedWorker;
                    while (true) {
                        if (obj == NOT_IN_STACK) {
                            i3 = -1;
                            break;
                        } else if (obj == null) {
                            i3 = 0;
                            break;
                        } else {
                            Worker worker2 = (Worker) obj;
                            int i4 = worker2.indexInArray;
                            if (i4 != 0) {
                                i3 = i4;
                                break;
                            }
                            obj = worker2.nextParkedWorker;
                        }
                    }
                } else {
                    i3 = i2;
                }
            }
            if (i3 >= 0 && this.parkedWorkersStack.compareAndSet(j, j2 | i3)) {
                return;
            }
        }
    }

    @NotNull
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        int length = this.workers.length();
        int i = 0;
        int i2 = 1;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        while (i2 < length) {
            int i7 = i2 + 1;
            Worker worker = this.workers.get(i2);
            if (worker != null) {
                WorkQueue workQueue = worker.localQueue;
                Task task = workQueue.lastScheduledTask.value;
                int bufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines = workQueue.getBufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines();
                if (task != null) {
                    bufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines++;
                }
                int ordinal = worker.state.ordinal();
                if (ordinal == 0) {
                    i++;
                    StringBuilder sb = new StringBuilder();
                    sb.append(bufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
                    sb.append('c');
                    arrayList.add(sb.toString());
                } else if (ordinal == 1) {
                    i3++;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(bufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
                    sb2.append('b');
                    arrayList.add(sb2.toString());
                } else if (ordinal == 2) {
                    i4++;
                } else if (ordinal == 3) {
                    i5++;
                    if (bufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines > 0) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(bufferSize$external__kotlinx_coroutines__android_common__kotlinx_coroutines);
                        sb3.append('d');
                        arrayList.add(sb3.toString());
                    }
                } else if (ordinal == 4) {
                    i6++;
                }
            }
            i2 = i7;
        }
        long j = this.controlState.value;
        return this.schedulerName + '@' + DebugStringsKt.getHexAddress(this) + "[Pool Size {core = " + this.corePoolSize + ", max = " + this.maxPoolSize + "}, Worker States {CPU = " + i + ", blocking = " + i3 + ", parked = " + i4 + ", dormant = " + i5 + ", terminated = " + i6 + "}, running workers queues = " + arrayList + ", global CPU queue size = " + this.globalCpuQueue.getSize() + ", global blocking queue size = " + this.globalBlockingQueue.getSize() + ", Control State {created workers= " + ((int) (2097151 & j)) + ", blocking tasks = " + ((int) ((4398044413952L & j) >> 21)) + ", CPUs acquired = " + (this.corePoolSize - ((int) ((j & 9223367638808264704L) >> 42))) + "}]";
    }

    public final boolean tryUnpark() {
        Worker worker;
        Symbol symbol;
        int i;
        do {
            AtomicLong atomicLong = this.parkedWorkersStack;
            while (true) {
                long j = atomicLong.value;
                worker = this.workers.get((int) (2097151 & j));
                if (worker == null) {
                    worker = null;
                    break;
                }
                long j2 = (2097152 + j) & (-2097152);
                Object obj = worker.nextParkedWorker;
                while (true) {
                    symbol = NOT_IN_STACK;
                    if (obj == symbol) {
                        i = -1;
                        break;
                    } else if (obj == null) {
                        i = 0;
                        break;
                    } else {
                        Worker worker2 = (Worker) obj;
                        i = worker2.indexInArray;
                        if (i != 0) {
                            break;
                        }
                        obj = worker2.nextParkedWorker;
                    }
                }
                if (i >= 0 && this.parkedWorkersStack.compareAndSet(j, j2 | i)) {
                    worker.nextParkedWorker = symbol;
                    break;
                }
            }
            if (worker == null) {
                return false;
            }
        } while (!worker.workerCtl.compareAndSet(-1, 0));
        LockSupport.unpark(worker);
        return true;
    }

    public final boolean tryCreateWorker(long j) {
        int i = ((int) (2097151 & j)) - ((int) ((j & 4398044413952L) >> 21));
        if (i < 0) {
            i = 0;
        }
        if (i < this.corePoolSize) {
            int createNewWorker = createNewWorker();
            if (createNewWorker == 1 && this.corePoolSize > 1) {
                createNewWorker();
            }
            if (createNewWorker > 0) {
                return true;
            }
        }
        return false;
    }
}
