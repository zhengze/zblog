import pymysql

DEBUG = True
if DEBUG:
    from .dev import *
else:
    from .prod import *

pymysql.install_as_MySQLdb()