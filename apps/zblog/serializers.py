
from rest_framework import serializers

# Serializers define the API representation.
class ArticleSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Article
        #fields = ('title', 'content', 'hits', 'created_time', 'updated_time', 'category', 'tags')
        fields = ('title', 'content', 'hits', 'created_time', 'updated_time')
