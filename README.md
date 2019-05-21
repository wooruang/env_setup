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
<img src="https://www.djangoproject.com/m/img/logos/django-logo-negative.svg" width="300"/>

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

## Setup Node with Yarn

### Install yarn
```shell
$ bash node/install_yarn.sh 
```

## Setup Vuejs
<img src="https://vuejs.org/images/logo.png" width="100"/>

### Install vue-cli
```shell
$ bash vue/install_vue-cli.sh 
```

## Setup Electron
<img src="https://camo.githubusercontent.com/627c774e3070482b180c3abd858ef2145d46303b/68747470733a2f2f656c656374726f6e6a732e6f72672f696d616765732f656c656374726f6e2d6c6f676f2e737667" width="300"/>

### Setup Electron-vue
<img src="https://simulatedgreg.gitbooks.io/electron-vue/content/images/logo.png" width="300"/>

```shell
$ bash electron/start_electron-vue_project.sh {PROJECT_NAME}

# Example.
$ bash electron/start_electron-vue_project.sh ttt
Info: yarn is already installed.
- Installing vue-cil ..
yarn global v1.16.0
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Installed "vue-cli@2.9.6" with binaries:
      - vue
      - vue-init
      - vue-list
Done in 0.71s.
- Done installing vue-cil ..
- Creating a electron-vue project(ttt) ...

? Target directory exists. Continue? Yes
? Application Name ttt
? Application Id com.example.yourapp
? Application Version 0.0.1
? Project description An electron-vue project
? Use Sass / Scss? Yes
? Select which Vue plugins to install (Press <space> to select, <a> to toggle all, <i> to invert selection)axios, vue-electron, vue-router, vuex, vuex-electron
? Use linting with ESLint? Yes
? Which ESLint config would you like to use? Standard
? Set up unit testing with Karma + Mocha? Yes
? Set up end-to-end testing with Spectron + Mocha? Yes
? What build tool would you like to use? builder
? author wooruang <wooruang@gmail.com>

   vue-cli · Generated "ttt".

---

All set. Welcome to your new electron-vue project!

Make sure to check out the documentation for this boilerplate at
https://simulatedgreg.gitbooks.io/electron-vue/content/.

Next Steps:

  $ cd ttt
  $ yarn (or `npm install`)
  $ yarn run dev (or `npm run dev`)

- Done Creating a electron-vue project(ttt) ...
```
