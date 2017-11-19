# ZBLOG
django编写的博客例子


## 1.工具和库说明
* django1.11
* boostrap3.2.0
* jquery1.11
* mysql5.7.17
* docker1.13.1
* docker-compose1.16.1

## 2.install docker and docker-compose
```bash
sudo apt-get install -y docker
sudo pip install docker-compose
```
## 3.docker build
`sudo docker-compose build`

## 4.start service
`sudo docker-compose up -d`

## 5.database migrate
```bash
sudo docker-compose run web python manage.py runserver makemigrations zblog
sudo docker-compose run web python manage.py runserver migrate
```

## 6.create superuser
`sudo docker-compose run web python manage.py createsuperuser`

## 7.collect static files
`sudo docker-compose run web python manage.py collectstatic`

## 8.add one article user admin
 page admin, add Article
