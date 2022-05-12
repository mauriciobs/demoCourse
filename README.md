# Instalación

Para crear la base de datos y correr los seeds.

```ruby
# create the database
rails db:create

# run the migrations
rails db:migrate

# prepopulate the database with initial/default data
rails db:seed_fu
```
Para actualizar el cron del servidor

```ruby
whenever --update-crontab
```

# Información adicional

- La aplicación usa base de datos Mysql.
- El uso de cron jobs se utiliza la gema **whenever**
- Para la info dummy se usa la gema **faker**
- La inserción inicial de datos se usa **seed-fu**

# ReactJs

Para la consulta de usuario y edicion del nombre de usuario se usa Reactjs El cual esta sobre el folder **react-course/**.
Las peticiones se hacen a el API de rails, el cual hace la inserción y consulta de datos.

![alt text](https://github.com/mauriciobs/demoCourse/blob/main/screen.png)
