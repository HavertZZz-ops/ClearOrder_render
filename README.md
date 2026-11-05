# ClearOrder

Nosso PI

## Sobre o projeto

Sistema de gestao academica (quartos, cronograma, tarefas, vistorias, chamados, gamificacao e relatorios) desenvolvido em Django.

## Estrutura

```
CleanOrder/
├── config/            <- raiz do projeto Django
│   ├── manage.py
│   ├── config/        <- pacote de settings/urls/wsgi/asgi
│   ├── ClearOrder/    <- app principal
│   └── media/         <- arquivos enviados (fotos de perfil, chamados)
├── requirements.txt   <- dependencias Python
├── venv/              <- ambiente virtual
├── jarvis.bat         <- script para subir o servidor
├── active.bat         <- script alternativo para subir o servidor
└── README.md
```

## Como rodar

1. Criar/atualizar o ambiente virtual:

```bash
python -m venv venv
venv\Scripts\activate      # Windows
pip install -r requirements.txt
```

2. Aplicar migrations:

```bash
python manage.py migrate
```

3. Iniciar o servidor:

```bash
python manage.py runserver
```

Ou pelo script `jarvis.bat` / `active.bat` na raiz do projeto.

## Acesso

- Servidor: http://localhost:8000/
- Admin: http://localhost:8000/admin/

## Banco de dados

PostgreSQL (local). Configurado em `config/config/settings.py`.
