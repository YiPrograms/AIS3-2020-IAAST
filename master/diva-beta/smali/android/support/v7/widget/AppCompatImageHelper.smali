.class Landroid/support/v7/widget/AppCompatImageHelper;
.super Ljava/lang/Object;
.source "AppCompatImageHelper.java"


# static fields
.field private static final VIEW_ATTRS:[I


# instance fields
.field private final mTintManager:Landroid/support/v7/internal/widget/TintManager;

.field private final mView:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 30
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x1010119

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/AppCompatImageHelper;->VIEW_ATTRS:[I

    return-void
.end method

.method constructor <init>(Landroid/widget/ImageView;Landroid/support/v7/internal/widget/TintManager;)V
    .locals 0
    .param p1, "view"    # Landroid/widget/ImageView;
    .param p2, "tintManager"    # Landroid/support/v7/internal/widget/TintManager;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mView:Landroid/widget/ImageView;

    .line 37
    iput-object p2, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 38
    return-void
.end method


# virtual methods
.method loadFromAttributes(Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I

    .prologue
    const/4 v3, 0x0

    .line 41
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/support/v7/widget/AppCompatImageHelper;->VIEW_ATTRS:[I

    invoke-static {v1, p1, v2, p2, v3}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 44
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mView:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :cond_0
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 50
    return-void

    .line 48
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    throw v1
.end method

.method setImageResource(I)V
    .locals 2
    .param p1, "resId"    # I

    .prologue
    .line 53
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mView:Landroid/widget/ImageView;

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatImageHelper;->mView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method
