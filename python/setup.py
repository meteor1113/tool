#!/usr/bin/env python

from distutils.core import setup
import py2exe


options = {"py2exe":
               {"compressed" : 1,
                "optimize" : 2,
                "bundle_files" :1
                }
           }
setup(
    version = "0.1",
    description = "some tools",
    name = "python",
    options = options,
    zipfile = None,
    console = ["convert2unix.py", "getrawhttp.py", "inet_addr.py",
               "inet_ntoa.py", "tab2space.py"]
    )
