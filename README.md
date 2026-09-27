# log-sentinel

## Problema

Times de SRE precisam responder rápido: o servidor está sendo atacado? Há erros? Houve pico de tráfego?
Hoje essas respostas dependem de alguém abrir o log e filtrar na mão, o que só acontece quando o problema já apareceu.

O log-sentinel lê o log de acesso do nginx e calcula a taxa de erro, os caminhos mais procurados que não existem (404), o pico de requisições por minuto e os acessos a caminhos suspeitos como `/.env`.
Quando algum limite é ultrapassado, ele termina com código de saída 1, e qualquer agendador (cron, Jenkins, GitHub Actions) pode reagir sozinho.

## O que detecta

## Como rodar

## Decisões
