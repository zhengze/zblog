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
    def __unicode__(self):
        return self.title
    class Meta:
        ordering = ['-created_time']
        
    
