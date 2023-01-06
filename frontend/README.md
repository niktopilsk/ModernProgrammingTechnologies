
## TradeOffer | Frontend

Сделано с использованием React

## Установка

```bash
$ npm install
```

## Настройка

Вы можете создать файл `.env` и указать в нем адрес сервера

```dotenv
SERVER_ORIGIN=http://localhost:3001
```

Если вы хотите использовать [Redux Devtools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd?hl=ru), то нужно перевести приложение в режим разработки

```dotenv
NODE_ENV=development
```

При запуске в докере, переменные среды надо указать в `docker-compose.yml`

## Запуск

```bash
# production build
$ npm run build

# development build
$ npm run dev

# watch mode
$ npm run watch
```

