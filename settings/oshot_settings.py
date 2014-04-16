import os.path
from {{ pillar['username'] }}.settings import *

DEBUG = {{ pillar["debug"] }}
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': '{{ pillar["dbengine"] }}',
        'NAME': '{{ pillar["dbname"] }}',
        'USER': '{{ pillar["dbuser"] }}',
        'PASSWORD': '{{ pillar["dbpassword"] }}',
        'HOST': '{{ pillar["dbhost"] }}',
        'PORT': '{{ pillar["dbport"] }}',
    }
}

TIME_ZONE = 'Israel'
USE_I18N = True
USE_L10N = True
LANGUAGE_CODE = 'he'
USE_TZ = True
PROJECT_ROOT = os.path.dirname(os.path.realpath(__file__))
MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'media')

# Resource URLs
if os.environ.get('AWS_ACCESS_KEY_ID', False):
    from .s3 import *
else:
    STATIC_PATH = os.path.join(PROJECT_ROOT,'static')
    STATIC_URL = '/static/'
    STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.StaticFilesStorage'

DEBUG_TOOLBAR_CONFIG = {
        'INTERCEPT_REDIRECTS': False,
}

# Resource directories

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}
