# env_setup
Automate development environment setting.

# How to setup

## Setup Pyenv

### Install pyenv (Only will install Pyenv.)
```shell
$ bash pyenv/pyenv_install.sh
```

### Install python with pyenv (Will install Pyenv and Python)
```shell
$ bash pyenv/install_python.sh {PYTHON_VERSION}

# example
$ bash pyenv/install_python.sh 3.7.0
```

### Install virtualenv with pyenv (Will install Pyenv, Python and virtualenv) 
```shell
$ bash pyenv/make_new_virtualenv.sh {PYTHON_VERSION} {VIRTUALENV_NAME}

# example
$ bash pyenv/make_new_virtualenv.sh 3.7.0 test-env
```

## Setup Django

### Install Django (If Pyenv, python and virtualenv are not exist, It will install them.)
```shell
$ bash django/django_install.sh {PYTHON_VERSION} {VIRTUALENV_NAME}

# example
$ bash django/django_install.sh 3.7.0 test-env
```

### Strat Django Project and App (If Pyenv, python, virtualenv and a package of Django are not exist, It will install them.)
```shell
$ bash django/start_django_project.sh {PYTHON_VERSION} {VIRTUALENV_NAME} {PROJECT NAME} {APP NAME}

# example
$ bash django/start_django_project.sh 3.7.0 test-env test_proj test_app
```