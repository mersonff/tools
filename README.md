# Tools APP

## Stack
- Rails 7
- PostgreSQL
- RSpec
- Bulma
- Vue 3
- Pinia

## Usando
Cria os bancos de dados:
```
rails db:create
rails db:create RAILS_ENV=test
```

Instalando as dependências
```
bundle install
yarn install
```

No terminal, na pasta raiz do projeto rode o seguinte comando
```
foreman start -f Procfile.dev
```

## Testes

No terminal
```
rspec
```