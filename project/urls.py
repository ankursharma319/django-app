from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin

import welcome.views

urlpatterns = [
    # Examples:
    # url(r'^$', 'project.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$', welcome.views.index, name='home'),
    url(r'^health$', welcome.views.health),
    url(r'^admin/', include(admin.site.urls)),
]

#url(r'^media/(?P<path>.*)$', serve, {	
#            'document_root': settings.MEDIA_ROOT,	
#            }),	


if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
