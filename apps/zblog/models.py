from django.db import models


class Classify(models.Model):
    name = models.CharField(max_length=20)

    class Meta:
        verbose_name_plural = verbose_name = u'分类'

    def __str__(self):
        return self.name


class Tag(models.Model):
    name = models.CharField(max_length=20, verbose_name=u"标签")

    class Meta:
        verbose_name_plural = verbose_name = u'标签'

    def __str__(self):
        return self.name


class Article(models.Model):
    title = models.CharField(max_length=50, verbose_name=u"标题")
    content = models.TextField(verbose_name=u"正文", blank=True)
    created_time = models.DateTimeField(auto_now_add=True, verbose_name=u"创建时间")
    updated_time = models.DateTimeField(auto_now=True, verbose_name=u"修改时间")
    classify = models.ForeignKey(Classify, verbose_name=u"分类", on_delete=models.CASCADE)
    #tag = models.ManyToManyField(Tag, related_name="article")
    tags = models.ManyToManyField(Tag, related_name="articles", blank=True, verbose_name=u"标签")
    hits = models.IntegerField(default=0, verbose_name=u"浏览量")

    class Meta:
        ordering = ['-created_time']
        verbose_name_plural = verbose_name = u'文章'

    def __str__(self):
        return self.title


class Album(models.Model):
    name = models.CharField(max_length=50)
    cover = models.ImageField(upload_to='images/covers/%Y/%m/%d', blank=True)
    created_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = verbose_name = u'封面'

    def __str__(self):
        return self.name    


class Photo(models.Model):
    photo = models.ImageField(upload_to='images/%Y/%m/%d')
    description = models.CharField(max_length=255, null=True)
    created_time = models.DateTimeField(auto_now_add=True)
    album = models.ForeignKey(Album)

    class Meta:
        ordering = ['-created_time']
        verbose_name_plural = verbose_name = u'相册'

    def __str__(self):
        return self.description


class Music(models.Model):
    title =  models.CharField(max_length=50)
    mp3 = models.FileField(upload_to='music/%Y/%m/%d')
    created_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_time']
        verbose_name_plural = verbose_name = u'音乐'

    def __str__(self):
        return self.title
