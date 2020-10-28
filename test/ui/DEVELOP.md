# Developing UI Tests

A set of test scripts are used for manually testing the modelbuilder user interface. These scripts can be accessed by pointing a browser to the folder at `docs/ui-testing`. Note that the files must be acessed from a web server; current browser security features will not allow the pages to be accessed directly from the file system.

**Note that the UI tests are currently implemented in the `pages` branch, so be sure to checkout that branch before working on tests.**


## To populate the UI Tests web site:

* Tests specification files are located in the `specs` subdirectory. You can edit the current files or add new tests.
* Each specification is a YAML file containing `name` and `steps` fields. The `name` is a single string that is displayed in the web page, and `steps` is a list of dictionary objects making up the test sequence.
* Each step (dictionary object) must include a `title` field, which should be a short descriptive string.
* Each step must include an `action` field, a string describing the specific task(s) the user is to complete. Html markup can be used in this string.
* Each step may optionally include an `expect` field, a string describing what modelbuilder is expected to do in response to the action. Html markup can be used in this string.


## To run the tests locally

You must run a web server in order to view a local version of the test specs. To do this using python:

* Make sure you have python installed on the local machine.
* Open a terminal. On windows, use the Command Prompt.
* From the top-level folder, run `python -m http.server` to start the server. (Use Control-C to stop the server)
* Navigate a web browser to `localhost:8000` which should display the list of files and folders in the top directory.
* Click on the `docs` link to get to a page titled "ace3p-production". In that page, click the link labeled "ui-tesing" to get to the list of tests.


## To edit tests

As noted above, each test is specified as a yaml file in the `test/ui/specs` folder. After editing or adding test specifications, you must "compile" the tests, which simply generates json files that are written to the `docs/ui-testing/data` folder.

1\. Before editing or adding test spec files, first setup a python virtual environment as described in the next section.

2\. To **use** the virtual environment, run its activate script.

From Windows Command Prompt:

```
> cd test
> venv-pages\Scripts\activate
```

3\. After making changes, use the `compile_tests.py` script, which loads each yaml file in the `specs` folder and generates the corresponding json file in `docs/ui-testing/data`.

```
> python compile_tests.py
```

4\. Reload the browser page to see the changes. With some browsers, you might need to do a *hard* reload (`Control-R`) before the changes appear.


## To setup python virtual environment

1\. To begin development, first make sure that python is installed on your machine. Downloads are available from python.org if needed.

2\. Create the virtual environment for this project. From a terminal:

```
> cd test
> python -m venv venv-pages
```
3\.Activate the virtual environment from the windows prompt
```
> venv-pages\Scripts\activate

```
## Note that venv text appears in the command prompt 
4\. Install the python packages listed in the `requirements.txt` file:

```
> pip install -r requirements.txt
```
