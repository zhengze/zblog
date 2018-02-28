
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

# Serializers define the API representation.
class ArticleSerializer(serializers.ModelSerializer):
    categorys = CategorySerializer(many=True, read_only=True)
    tags = TagSerializer(many=True, read_only=True)
    class Meta:
        model = Article
        fields = ('title', 'content', 'hits', 'created_time', 'updated_time', 'categorys', 'tags')
