from django.db import models

class Classify(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name

class Tag(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name
    
class Article(models.Model):
    title = models.CharField(max_length=50)
    content = models.TextField()
    created_time = models.DateTimeField(auto_now=True)
    classify = models.ForeignKey(Classify)
    tag = models.ForeignKey(Tag)
    hits = models.IntegerField(default=0)

    class Meta:
        ordering = ['-created_time']
    def __str__(self):
        return self.title

class Album(models.Model):
    name = models.CharField(max_length=50)
    cover = models.ImageField(upload_to='images/covers/%Y/%m/%d', null=True, blank=True)

    def __str__(self):
        return self.name    

class Photo(models.Model):
    photo = models.ImageField(upload_to='images/%Y/%m/%d')
    description = models.CharField(max_length=255, null=True)
    created_time = models.DateTimeField(auto_now=True, null=True)
    album = models.ForeignKey(Album)

    class Meta:
        ordering = ['-created_time']
    def __str__(self):
        return self.description

class Music(models.Model):
    title =  models.CharField(max_length=50)
    mp3 = models.FileField(upload_to='music/%Y/%m/%d')
    created_time = models.DateTimeField(auto_now=True, null=True)

    class Meta:
        ordering = ['-created_time']
    def __str__(self):
        return self.title
