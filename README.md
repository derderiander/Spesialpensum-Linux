# Spesialpensum Linux

**Problemstilling:** "Administrasjon og vedlikehold av Linux-baserte servere. Fokus vil være å simulere praktisk drift og administrasjon av Ubuntu-servere i små og mellomstore bedriftsmiljøer, med særlig vekt på lokal infrastruktur".

## Oppbygging

Jeg har laget tre servere som kjører som virtuelle maskiner (VMs) inne i en hovedmaskin:

- **GW (Gateway)**: Internett-fordeler og brannmur.
- **Infra**: Gir alle maskinene navn (DNS) og IP-adresser (DHCP).
- **File (Filserver)**: Her lagres alle filene. Lærere og elever har egne mapper med forskjellige rettigheter.

## Innhold i mappen

- `ansible/`: Ansible playbooks som installerer og konfigurerer serverne automatisk.
- `configs/`: Oppsettsfiler for nettverk, scripts for å opprette VM-ene, og lokale scripts (backup/overvåkning).

## Oppsett

For å bruke prosjektet:

1. Oppdater `ansible/hosts.ini` med riktige brukere/hoster og bruk SSH-nøkler (ssh-agent eller `--private-key`).
2. Gi sudo/become-passord ved kjøring (`--ask-become-pass`, `ANSIBLE_BECOME_PASS`), eller bruk Ansible Vault i et ignorert `group_vars/*/vault.yml`.
3. Hvis du vil sette Samba-passord, send det inn som variabel ved kjøring (se under).

## Slik kjører du prosjektet

For å sette opp filserveren og opprette brukere uten å lagre passord i klartekst:

```bash
ansible-playbook -i ansible/hosts.ini ansible/fileserver.yml --extra-vars "samba_password=DittHemmeligePassordHer"
```

## Verktøy som er brukt

- Linux Ubuntu
- Ansible
- KVM/QEMU
- Samba

##### Prosjektet var på ingen måte produksjonsklart, men heller vise forståelse. 
