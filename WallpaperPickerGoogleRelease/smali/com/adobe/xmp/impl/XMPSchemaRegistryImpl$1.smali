.class public Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/xmp/properties/XMPAliasInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/AliasOptions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic val$actualNS:Ljava/lang/String;

.field public final synthetic val$actualPrefix:Ljava/lang/String;

.field public final synthetic val$actualProp:Ljava/lang/String;

.field public final synthetic val$aliasOpts:Lcom/adobe/xmp/options/AliasOptions;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/AliasOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$actualNS",
            "val$actualPrefix",
            "val$actualProp",
            "val$aliasOpts"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualNS:Ljava/lang/String;

    iput-object p2, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualPrefix:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualProp:Ljava/lang/String;

    iput-object p4, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$aliasOpts:Lcom/adobe/xmp/options/AliasOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAliasForm()Lcom/adobe/xmp/options/AliasOptions;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$aliasOpts:Lcom/adobe/xmp/options/AliasOptions;

    return-object p0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualNS:Ljava/lang/String;

    return-object p0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualPrefix:Ljava/lang/String;

    return-object p0
.end method

.method public getPropName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualProp:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualPrefix:Ljava/lang/String;

    iget-object v1, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualProp:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$actualNS:Ljava/lang/String;

    .line 2
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPSchemaRegistryImpl$1;->val$aliasOpts:Lcom/adobe/xmp/options/AliasOptions;

    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0xe

    invoke-static {v0, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v1, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v3

    const-string v3, " NS("

    invoke-static {v4, v0, v1, v3, v2}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "), FORM ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
