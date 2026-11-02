# Analiza Trivy — Ćwiczenie 7

## Tabela porównawcza

| Obraz          | HIGH (FixedVersion) | CRITICAL (FixedVersion) | Suma HIGH+CRITICAL (FixedVersion) |
|----------------|---------------------|-------------------------|-----------------------------------|
| nginx:dupa     | 2                   | 1                       | 3                                 |
| ubuntu:24.04   | 0                   | 0                       | 0                                 |
| nginx:1.20     | 143                 | 24                      | 167                               |

## Trzy decyzje (nginx:1.20)

1. **CVE-2021-22945** (CRITICAL, curl) — naprawiamy: dostępna poprawka.
2. **CVE-2022-32207** (CRITICAL, curl) — naprawiamy: dostępna poprawka.
3. **CVE-2026-53613** (HIGH, bsdutils) — akceptujemy z terminem: brak FixedVersion, monitorujemy.

## Kryterium
`trivy image --severity CRITICAL --ignore-unfixed --exit-code 1 nginx:dupa` → oczekiwany kod 0..


# Po Aktualizacji

## Tabela porównawcza

| Obraz          | HIGH (FixedVersion) | CRITICAL (FixedVersion) | Suma HIGH+CRITICAL (FixedVersion) |
|----------------|---------------------|-------------------------|-----------------------------------|
| nginx:dupa     | 2                   | 0                       | 2                                 |
| ubuntu:24.04   | 0                   | 0                       | 0                                 |
| nginx:1.20     | 143                 | 24                      | 167                               |

Uwaga: obraz nginx:dupa po aktualizacji brotli nie zawiera podatności CRITICAL. Kryterium spełnione
