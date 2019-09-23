#!/bin/bash

# eg copy_file_from_contailer nginx /www/web.tar.gz ./

docker cp $1:$2 $3
