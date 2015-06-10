#!/usr/bin/env python
import os
import sys

if __name__ == "__main__":
    ENV_DEV = True
    if ENV_DEV:
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "zblogsite.settings.dev")
    else:
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "zblogsite.settings.prod")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
