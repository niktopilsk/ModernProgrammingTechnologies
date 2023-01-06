<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

## TradeOffer | Backend

Сделано с использованием NestJS

## Установка

```bash
$ npm install
```

## Настройка

Нужно передать переменную среды `JWT_SECRET_TOKEN`. Удобно сделать это, создав файл `.env` и написав в него следующее:

```dotenv
JWT_SECRET_TOKEN=your_secret_token_here
```

Помимо этого рекомендуется настроить CORS. Для этого укажите регулярным выражением источники, с которых можно будет отправлять запросы на сайт

```dotenv
CORS_ORIGIN_REGEX="http([s])?:\/\/localhost:3002"
```

Без указания данного параметра `Access-Control-Allow-Origin` будет равен `*`, т.е. сервер будет принимать запросы с любого источника

При запуске через докер все эти настройки надо произвести в файлах его конфигурации, а не через `.env` файл

## Запуск

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```
