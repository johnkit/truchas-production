#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# echo $DIR
pyscript="${DIR}/test-pages/compile-tests.py"
specs_dir="${DIR}/test-specs"
static_dir="${DIR}/../docs/test-pages"

python ${pyscript} ${specs_dir} ${static_dir}
