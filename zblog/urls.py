from django.conf.urls import patterns, include, url
import os
from zblog.views import *

urlpatterns = patterns('',
    url(r'^$', index),    
    url('^hello/$', hello),     
)
