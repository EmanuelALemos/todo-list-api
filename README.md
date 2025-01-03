# Todo List API - Ruby on Rails

#### Este projeto é uma API para gerenciar um Todo List com Ruby on Rails. Ele permite criar, editar, listar e excluir Quadros, colunas e tarefas. A interface é inspirada no Github Projects. O frontend foi desenvolvido separadamente para interagir com esta API.

### Funcionalidades
  - Boards: Gerenciar quadros, criar, editar, excluir e filtar com pesquisa (Boards).
  - Columns: Organizar as tarefas em colunas dentro de cada Board.
  - Tasks: Criar, editar e excluir tarefas dentro de uma coluna, e mover tasks entre colunas.

### Tecnologias
  - Backend: Ruby on Rails
  - Banco de Dados: PostgreSQL

### Pré-requisitos
  Antes de rodar o projeto localmente, você precisa ter instalado:
  - [Ruby](https://www.ruby-lang.org/pt/)
  - [Rails](https://rubyonrails.org/)
  - [PostgresSql](https://www.postgresql.org/download/)

### Instalação
  - Clone o repositório:
    `git clone https://github.com/EmanuelALemos/todo-list-api.git`
    `cd todo-list-api`
  - Variáveis de Ambiente:
      - Crie um arquivo .env na raiz do projeto.
      - Copie o conteúdo de .env.example e ajuste conforme necessário.
      - Substitua your_password_here pela senha real do seu banco de dados.
  - Instale as dependências do projeto:
    `bundle install`
  - Configure o banco de dados:
    `rails db:create`
    `rails db:migrate`
  - Inicie o servidor:
    `rails server`
A API estará disponível em `http://localhost:3000`

### Endpoints da API
  - ####  Boards:
      - GET /boards : Lista todos os boards.
      - GET /boards/:id : lista o board do id passado .
      - POST /boards : cria um novo board.
      - PUT /boards/:id : atualiza um board existente.
      - DELETE /boards/:id : exclui um board  e suas respectivas entidades associadas (columns e tasks).
  - #### Columns:
      - GET /boards/:board_id/columns : lista todas as colunas associadas a um board.
      - GET /boards/:board_id/columns/:id : lista uma coluna específica.
      - POST /boards/:board_id/columns : cria uma nova coluna associada a um board.
      - PUT /boards/:board_id/columns/:id : atualiza uma coluna específica.
      - DELETE /boards/:board_id/columns/:id : exclui uma coluna específica e suas repectivas entidades associadas (tasks).
  - #### Tasks:
      - GET /boards/:board_id/columns/:column_id/tasks : lista todas as tasks de uma coluna.
      - GET /boards/:board_id/columns/:column_id/tasks/:id : lista uma task específica.
      - POST /boards/:board_id/columns/:column_id/tasks: cria uma nova task associada a uma coluna.
      - PUT /boards/:board_id/columns/:column_id/tasks/:id : exclui uma task específica.
      - PATCH /boards/:board_id/columns/:column_id/tasks/:id/move : muda a referência da coluna que a task está associada.
      - DELETE /boards/:board_id/columns/:column_id/tasks/:id : exclui uma task específica.

     

