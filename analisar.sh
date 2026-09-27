#!/usr/bin/env bash
# analisar.sh — analisa um access.log do nginx e alerta quando limites são ultrapassados.
#
# Códigos de saída:
#   0 = tudo dentro do limite
#   1 = alerta (algum limite ultrapassado)
#   2 = erro de uso (argumento faltando, arquivo inválido)

set -euo pipefail

err() {
  echo "[ERRO] $*" >&2
}

uso() {
  echo "Uso: $(basename "$0") <arquivo_de_log>" >&2
}

if [[ $# -ne 1 ]]; then
  err "esperado 1 argumento, recebido $#"
  uso
  exit 2
fi

log="$1"

if [[ -d "$log" ]]; then
  err "é um diretório, não um arquivo: $log"
  exit 2
fi

if [[ ! -f "$log" ]]; then
  err "arquivo não encontrado: $log"
  exit 2
fi

if [[ ! -r "$log" ]]; then
  err "sem permissão de leitura: $log"
  exit 2
fi

echo "== Requisições por status =="
awk '{print $9}' "$log" | sort | uniq -c | sort -rn

