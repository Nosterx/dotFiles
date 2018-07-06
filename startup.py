from IPython.core.magic import register_line_magic
from subprocess import call
import os


os.environ['PYMSSQL_BUILD_WITH_BUNDLED_FREETDS'] = '1'
os.environ['CONSUL_HTTP_ADDR'] = "consul.dev.cian.ru:8500"
os.environ['RABBITMQ_CONNECTION_STRING'] = 'amqp://test:test@192.168.16.22:5672//'
"""

CDN_USER: str = 'countryside'
CDN_PASSWORD = '2LibGuRUQ4'
CDN_BASE_URL = 'http://countryside.dev3.cian.ru/images'
"""


@register_line_magic
def ecsl(self):
    os.environ['SIMPLE_SETTINGS'] = 'countryside.settings.local'
    return "export ['SIMPLE_SETTINGS'] = countryside.settings.local"


@register_line_magic
def ets(self):
    os.environ['SIMPLE_SETTINGS'] = 'tests.settings'
    return "export ['SIMPLE_SETTINGS'] = tests.settings"


@register_line_magic
def ecssl(self):
    os.environ['SIMPLE_SETTINGS'] = 'countryside_search.settings.local'
    return "export ['SIMPLE_SETTINGS'] = countryside_search.settings.local"


@register_line_magic
def runc(self):
    print(ecsl(self))
    call(['countryside', 'serve'])


@register_line_magic
def runcs(self):
    print(ecssl(self))
    call(['countryside-search', 'serve'])


@register_line_magic
def rtest(self):
    print(ets(self))
    call('pytest')


@register_line_magic
def rtox(self):
    print(ets(self))
    call('tox')
