from django.db import models

class Article(models.Model):
	title = models.CharField(max_length=50)
	content = models.CharField(max_length=255)

class Classify(models.Model):
	name = models.CharField(max_length=20)
	def __unicode__(self):
		return self.name

