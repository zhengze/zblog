
from apps.zblog.models import (Article, 
    Category, 
    Tag,
    Album,
    Photo,
    Music
)
from rest_framework import serializers

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('name',)


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ('name',)


class ArticleSerializer(serializers.ModelSerializer):
    category_name = CategorySerializer(source='category', read_only=True)
    tag_names = TagSerializer(source='tags', many=True, read_only=True)
    class Meta:
        model = Article
        fields = ('title', 'content', 'hits', 'created_time', 'updated_time', 'category_name', 'tag_names')


class AlbumSerializer(serializers.ModelSerializer):
    class Meta:
        model = Album
        fields = '__all__'


class PhotoSerializer(serializers.ModelSerializer):
    albums = AlbumSerializer(source='photo', read_only=True) 
    class Meta:
        model = Photo
        fields = ('photo', 'description', 'albums', 'created_time')

class MusicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Music
        fields = '__all__'

