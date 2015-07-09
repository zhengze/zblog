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
    hits = models.IntegerField(max_length=1,null =False, blank=False,default=0)
    
    class Meta:
        ordering = ['-created_time']
    def __unicode__(self):
        return self.title

class ImageClassify(models.Model):
    name = models.CharField(max_length=50)
    def __unicode__(self):
        return self.name    

class Image(models.Model):
    image = models.ImageField(upload_to='images')
    description = models.CharField(max_length=255)
    image_classify = models.ForeignKey(ImageClassify)
    def __unicode__(self):
        return self.description

