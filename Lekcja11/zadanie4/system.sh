#!/bin/bash

pomoc() {
  printf 'Użycie: %s <polecenie>\n' "${0##*/}" >&2
  printf 'Dozwolone: dysk, pamiec, uptime, siec, wszystko\n' >&2
  printf 'Pomoc: -h albo --help\n' >&2
}

dysk() {
  printf '== dysk ==\n'
  df -h
}

pamiec() {
  printf '== pamiec ==\n'
  free -h
}

czas() {
  printf '== uptime ==\n'
  uptime
}

siec() {
  printf '== siec ==\n'
  ip -br addr
}

case "${1:-}" in
  dysk) dysk ;;
  pamiec) pamiec ;;
  uptime) czas ;;
  siec) siec ;;
  wszystko)
    dysk
    pamiec
    czas
    siec
    ;;
  -h|--help)
    pomoc
    exit 0
    ;;
  *)
    printf 'Nieznane polecenie: %s\n' "${1:-brak}" >&2
    pomoc
    exit 2
    ;;
esac
