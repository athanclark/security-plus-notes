#! /bin/bash

ag "TODO" -G "*.md" ./Summary
ag "FIXME" -G ".md" ./Summary
