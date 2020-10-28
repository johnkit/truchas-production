"""Test spec compiler.

Simply loads all .yml files in "tests" directory and writes equivalent
json files to "public/data".
"""

import json
import os

import yaml


if __name__ == "__main__":
    source_dir = os.path.abspath(os.path.dirname(__file__))
    yml_dir = os.path.join(source_dir, 'specs')
    json_dir = os.path.join(source_dir, os.pardir, os.pardir, 'docs', 'ui-testing', 'data')
    test_names = list()

    # Read all yml spec files and render json equivalent
    for yml_file in os.listdir(yml_dir):
        base, ext = os.path.splitext(yml_file)
        if ext in ['.yml', '.yaml']:
            js = None
            yml_path = os.path.join(yml_dir, yml_file)
            with open(yml_path) as fyml:
                print('Reading {}'.format(yml_path))
                yml = yaml.safe_load(fyml)
                js = json.dumps(yml, indent=2, sort_keys=True)
            if not js:
                continue
            json_file = '{}.json'.format(base)
            json_path = os.path.join(json_dir, json_file)
            with open(json_path, 'w') as fjs:
                print('Writing {}'.format(json_path))
                fjs.write(js)
                fjs.write('\n')
                test_names.append(base)

    # Generate specfiles.js with list of json files
    test_names.sort()
    js_text = 'let testNames = ' + json.dumps(test_names, indent=2)
    #print(js_text)
    js_file = 'testNames.js'
    ui_testing_dir = os.path.join(source_dir, os.pardir, os.pardir, 'docs', 'ui-testing')
    js_path = os.path.join(ui_testing_dir, js_file)
    with open(js_path, 'w') as fjs:
        print('Writing', js_path)
        fjs.write(js_text)
        fjs.write('\n')
