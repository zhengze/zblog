from django.contrib import admin
from .models import * 


@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'content', 'created_time', 'classify', 'hits')
    exclude = ('hits', )
    list_filter = ('created_time', 'classify')
    search_fields = ['title', 'classify']


@admin.register(Photo)
class PhotoAdmin(admin.ModelAdmin):
    list_display = ('photo', 'album', 'description', 'created_time')
    list_filter = ('created_time', 'album')
    search_fields = ['album']


@admin.register(Music)
class MusicAdmin(admin.ModelAdmin):
    list_display = ('title', 'mp3', 'created_time')
    list_filter = ('created_time', )


@admin.register(Album)
class AlbumAdmin(admin.ModelAdmin):
    list_display = ('name', 'cover')


@admin.register(Classify)
class ClassifyAdmin(admin.ModelAdmin):
    list_display = ('name',)


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('name',)


