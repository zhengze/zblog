# Create your views here.
from django.http import HttpResponse
from django.template.loader import get_template
from django.template import Context
import datetime

def index(request):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>"%now
    t = get_template("index.html")
    html = t.render(Context({'current_time':now}))
    return HttpResponse("index.html")

def hello(request):
    return HttpResponse("hello world, index")

