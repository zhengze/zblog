from django.contrib import admin
from .models import * 

class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'content', 'created_time', 'classify')

admin.site.register(Article, ArticleAdmin)
admin.site.register(Classify)
admin.site.register(Tag)
admin.site.register(Photo)
admin.site.register(Album)
