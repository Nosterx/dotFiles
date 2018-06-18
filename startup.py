from IPython.core.magic import register_line_magic


@register_line_magic
def ecsl(self):
    import os
    os.environ['SIMPLE_SETTINGS'] = 'countryside.settings.local'
    return "export ['SIMPLE_SETTINGS'] = countryside.settings.local"

@register_line_magic
def ets(self):
    import os
    os.environ['SIMPLE_SETTINGS'] = 'tests.settings'
    return "export ['SIMPLE_SETTINGS'] = tests.settings"

@register_line_magic
def ecssl(self):
    import os
    os.environ['SIMPLE_SETTINGS'] = 'countryside_search.settings.local'
    return "export ['SIMPLE_SETTINGS'] = countryside_search.settings.local"

@register_line_magic
def ec(self):
    import os
    os.environ['CONSUL_HTTP_ADDR'] = "consul.dev.cian.ru:8500"
    return "export ['CONSUL_HTTP_ADDR'] = consul.dev.cian.ru:8500"
