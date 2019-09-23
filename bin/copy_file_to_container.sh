#!/bin/bash

# eg copy_file_from_contailer ./web.tar.gz nginx /www/

docker cp $1 $2:$3
