# django-compose-base

Docker-compose files to start a Django structure and start up any new project.

## How to Use

To start-up your Django structure, just execute:

```
$ docker-compose run web django-admin.py startproject <project_name> .
```

This will download the Docker images to create the composed containers and create the Django structure in the directory you executed the command.  After the docker-compose command completes, list the contents of your project:

```
 $ ls -l
 drwxr-xr-x 2 root   root   <project_name>
 -rw-rw-r-- 1 user   user   docker-compose.yml
 -rw-rw-r-- 1 user   user   Dockerfile
 -rwxr-xr-x 1 root   root   manage.py
 -rw-rw-r-- 1 user   user   requirements.txt
 ```
 
If you are running Docker on Linux, the files django-admin created are owned by root. This happens because the container runs as the root user. Change the ownership of the new files.

After that, edit the composeexample/settings.py file to configure Django to use PostgreSQL as database, by replacing the ```DATABASES = ...``` configuration with the following:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```

Save and close the file, then run the ```docker-compose up``` command from the top level directory for your project.

```
$ docker-compose up
djangosample_db_1 is up-to-date
Creating djangosample_web_1 ...
Creating djangosample_web_1 ... done
Attaching to djangosample_db_1, djangosample_web_1
db_1   | The files belonging to this database system will be owned by user "postgres".
db_1   | This user must also own the server process.
db_1   |
db_1   | The database cluster will be initialized with locale "en_US.utf8".
db_1   | The default database encoding has accordingly been set to "UTF8".
db_1   | The default text search configuration will be set to "english".

. . .

web_1  | May 30, 2017 - 21:44:49
web_1  | Django version 1.11.1, using settings 'composeexample.settings'
web_1  | Starting development server at http://0.0.0.0:8000/
web_1  | Quit the server with CONTROL-C.
```

At this point, your Django application should be running at port 8000 on your Docker host. Go to http://localhost:8000 on a web browser to see the Django welcome page.
