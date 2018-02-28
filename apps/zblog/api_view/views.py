from apps.zblog.models import Article
from rest_framework import viewsets
from apps.zblog.serializers import ArticleSerializer

# ViewSets define the view behavior.
class ArticleViewSet(viewsets.ModelViewSet):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
