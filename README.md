# ZBLOG
django编写的博客例子

## 工具和库说明
* django1.11
* boostrap3.2.0
* jquery1.11
* mysql5.7.17

## 搭建环境
* `sudo apt-get install -y docker`
* `sudo pip install docker-compose`
* `sudo docker-compose build`
* `sudo docker-compose up -d`
* `sudo docker-compose run web python manage.py runserver makemigrations zblog`
* `sudo docker-compose run web python manage.py runserver migrate`
* `sudo docker-compose run web python manage.py createsuperuser`
* page admin, add Article
