# My Company App
This repository contains MyCompany App written in python programming language using flask framework of web development.

## Prerequisites
Below prerequisites must be fulfilled for successful execution of code. Assumption is that you are using linux operating system.

### Software Requirement
Resources in this repository are meant for use with Python 3.x (check the version using `python --version`) and pip3 (check the version using `pip3 --version`). If you don't have the compatible version, download it from official python repository.

- [python3](https://www.python.org/downloads/) >= 3.9.2
- [pip3](https://pypi.org/project/pip/) >= 20.3.4

If the above version check command does not show the pip3 version, make sure that pip3 is installed correctly using the below command for ubuntu os.
```
    sudo apt-get -y install python3-pip
```

If pip3 is installed but not working, upgrade to the latest version using the following command: 
```
    python3 -m pip install --upgrade pip
```

### Bootstrap Virtual Environment
We will need to create a virtual environment (using python's default package "venv") and install all the dependencies
```
python3 -m venv mycompany-app-venv # on Windows, use "python -m venv venv" instead
source mycompany-app-venv/bin/activate # on Windows, use "venv\Scripts\activate" instead
pip install -r requirements.txt
```

**Note:**
1. Once activated, the virtual environment bin directory will be added at the beginning of the $PATH variable. Also your shell prompt will change and it will show the name of the virtual environment you are currently using. In our case that is, `mycompany-app-venv`. Once you are done with your work, to deactivate the environment, simply type `deactivate` and you will return to your normal shell.

2. Within the virtual environment, you can use the command `pip` instead of `pip3` and `python` instead of `python3`.

### Prerequisite Installation
After activating the virtual environemnt, use the following command to installed the required packages mentioned in the requirements file under the activated virtual environment.
```
    pip install -r requirements.txt
```

## Execution
To start the web server, execute the below command
    python run.py