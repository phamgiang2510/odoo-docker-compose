# INSTRUCTIONS

## 1. Install Docker

See [Docker Desktop](https://docs.docker.com/desktop/)

## 2. Choose the right docker-compose file

- `docker-compose.yml` - with Nginx
- `docker-compose-no-nginx.yml` - without Nginx

If you don't want to use Nginx, delete the file `docker-compose.yml` and rename the file `docker-compose-no-nginx.yml` to `docker-compose.yml`. Skip the next section of configuring Nginx.

## 3. Configure Nginx

If you use HTTPS, do following steps:

1. Open `docker-compose.yml`, comment the line with the mark `# HTTP` and uncomment the line with the mark `# HTTPS`.
2. Put your SSL certificate files in the `ssl` folder, with exact names `server.crt` and `server.key`.

Otherwise, you can go to the next section.

## 4. Configure PostgreSQL

Open `config/postgresql.conf` and change the parameters to your needs. You can use [PGTune](https://pgtune.leopard.in.ua/) to quickly generate the parameters.

## 5. Configure Odoo

1. Clone or download the Viindoo source code from [Viindoo](https://github.com/Viindoo/odoo) and put or extract it directly inside the `odoo` folder.
2. Put your custom Odoo modules in the `extra-addons` folder.
3. Open `config/odoo.conf` and change the parameters to your needs, except `addons_path`, `db_host`, `db_password`, `db_port`, `db_user`, `gevent_port` and `http_port` must be kept as they are.
4. If you don't use proxy, remember to delete or comment the line of `proxy_mode = True` in `config/odoo.conf`.

## 6. Run system

```bash
docker-compose up -d
```

## 7. Other commands

- Stop system
  ```bash
  docker-compose down
  ```
- Restart system
  ```bash
  docker-compose restart
  ```
- Remove system
  ```bash
  docker-compose down -v
  ```
