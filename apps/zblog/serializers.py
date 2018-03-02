
from apps.zblog.models import Article, Category, Tag
from rest_framework import serializers

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('name')

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ('name')

class ArticleSerializer(serializers.ModelSerializer):
    category_name = CategorySerializer(source='category', read_only=True)
    tag_names = TagSerializer(source='tags', many=True, read_only=True)
    class Meta:
        model = Article
        fields = ('title', 'content', 'hits', 'created_time', 'updated_time', 'category_name', 'tag_names')
