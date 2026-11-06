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

## Deploy (Railway)

- URL: https://clearorderrender-production.up.railway.app
- Start command do servico web:

```bash
sh -c "cd config && export PYTHONPATH=/app/config && python manage.py migrate && python manage.py collectstatic --noinput && gunicorn config.wsgi:application"
```

- Variavel obrigatoria: `DATABASE_URL` -> `${{ Postgres.DATABASE_PRIVATE_URL }}`

## Cron job: gerar cronograma automaticamente

O comando e idempotente: pode rodar todos os dias sem duplicar tarefas.

Crie um servico separado no Railway (Cron Job) com:

- Start command:

```bash
sh -c "cd config && export PYTHONPATH=/app/config && python manage.py gerar_cronograma"
```

- Cron schedule (o Railway usa UTC): `0 3 * * *` = 00:00 no horario de Brasilia
- Variavel: `DATABASE_URL` -> `${{ Postgres.DATABASE_PRIVATE_URL }}`
- Sem dominio publico e sem healthcheck

Comportamento: na primeira execucao da semana (segunda 00:00) cria o
cronograma e volta os quartos para `Pendente`; nas demais execucoes apenas
confere, sem duplicar tarefas.

## Simulador de data (Demo Day)

- `POST /monitor/simular-data/` avanca a data da sessao em +1 dia.
- `POST /monitor/resetar-data/` restaura a data real do sistema (botao
  "Hoje" na topbar do monitor).
