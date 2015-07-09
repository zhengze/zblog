from django.db import models

class Classify(models.Model):
    name = models.CharField(max_length=20)
    def __unicode__(self):
        return self.name

class Tag(models.Model):
    name = models.CharField(max_length=20)
    def __unicode__(self):
        return self.name
    
class Article(models.Model):
    title = models.CharField(max_length=50)
    content = models.TextField()
    created_time = models.DateTimeField()
    classify = models.ForeignKey(Classify)
    tag = models.ForeignKey(Tag)
    hits = models.IntegerField(max_length=1, default=0)
    
    class Meta:
        ordering = ['-created_time']
    def __unicode__(self):
        return self.title

class PhotoClassify(models.Model):
    name = models.CharField(max_length=50)
    def __unicode__(self):
        return self.name    

class Photo(models.Model):
    photo = models.ImageField(upload_to='images/%Y/%m/%d')
    description = models.CharField(max_length=255, null=True)
    photo_classify = models.ForeignKey(PhotoClassify)
    def __unicode__(self):
        return self.description


