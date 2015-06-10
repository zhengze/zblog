from django.conf.urls import patterns, include, url
import os
import settings
from zblog.views import *

urlpatterns = patterns('',
    url(r'^$', index),    
    url('^hello/$', hello),     
)
