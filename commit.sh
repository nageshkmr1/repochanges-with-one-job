#!/bin/bash
for i in `ls|grep clone`; do echo "--- Pushing $i"; cd $i; git commit -am 'version updated' && git push; cd ..; echo "--- Finished $i"; done
