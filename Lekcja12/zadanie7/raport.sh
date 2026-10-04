#!/bin/bash
metoda="bash"
while getopts ":m:" opcja; do
  case "$opcja" in
    m) metoda="$OPTARG" ;;
    :) echo "brak wartości przy -$OPTARG" >&2; exit 2 ;;
    \?) echo "nieznana opcja -$OPTARG" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))
plik="${1:-/home/mateuszg/raport-csv/sprzedaz.csv}"

wypisz() {
  sort
}

if [[ "$metoda" == "bash" ]]; then
  declare -A suma liczba
  while IFS=, read -r data region kwota; do
    suma[$region]=$(( ${suma[$region]:-0} + kwota ))
    liczba[$region]=$(( ${liczba[$region]:-0} + 1 ))
  done < <(tail -n +2 "$plik")
  for region in "${!suma[@]}"; do
    printf "%s %d %.2f\n" "$region" "${suma[$region]}" \
      "$(awk -v s="${suma[$region]}" -v n="${liczba[$region]}" 'BEGIN { printf "%.2f", s / n }')"
  done | wypisz
elif [[ "$metoda" == "awk" ]]; then
  awk -F, 'NR > 1 { suma[$2] += $3; liczba[$2]++ }
    END { for (r in suma) printf "%s %d %.2f\n", r, suma[r], suma[r] / liczba[r] }' \
    "$plik" | wypisz
else
  echo "metoda musi być bash albo awk" >&2
  exit 2
fi
