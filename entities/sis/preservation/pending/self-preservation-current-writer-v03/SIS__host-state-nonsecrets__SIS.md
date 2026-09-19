# SIS — host/runtime non-secret state v03

status: `self_preservation_candidate`
scope: `non-secret operational evidence only`
project_time: omitted; trusted project-time source not used

## Authorized Remote Desktop Commander devices

Fresh preservation readback showed three online devices:

### mazhor
- device id: `830038a0-232b-4d83-b52d-0e9973126165`;
- device name: `p552203.kvmvps`;
- app version: `0.2.50`.

### burzh
- device id: `dd09a197-f716-4dd6-80bb-7f8e5d8260ff`;
- device name: `ruvds-xnqc6`;
- app version: `0.2.48`.

### erefia
- device id: `c55d5659-f2c8-416d-8b40-9bac8c80c30d`;
- device name: `ruvds-ygo0w`;
- app version: `0.2.50`.

All three were observed online during preservation preparation.

## Known execution identities

Burzh and erefia bounded benchmark execution:
- user `pev5691`, uid 1000;
- membership includes `sudo`.

Mazhor bounded pilot:
- user `shd`, uid 1000;
- historical host-state includes `sudo`.

These are not permanent least-privilege preservation/shard identities.

## Mazhor preservation locator

Verified locator:
`/data/wellbeing-lab/backups/shd-pre-reinit-v01`.

SIS checksum/readback PASS and independent ARH readback exist. Do not infer wider filesystem authority from this locator.

## OpenAI host runtime

Burzh runtime:
`/home/pev5691/openai-d0-runtime-r01`.

Last SIS-verified deployed policy before preservation allowed:
- `gpt-5.6-luna`;
- `gpt-5.6-terra`;
- `gpt-5.6-sol`.

A newer KOD clean four-model package including Astra exists in GitHub but has not been independently reverified/deployed by SIS in this snapshot.

No OpenAI key is persisted by the D0 runtime; the completed Luna call used hidden TTY entry and post-call hygiene passed.

## Telegram credential boundary

Persistent encrypted Telegram bot credential exists outside GitHub/project artifacts under the Burzh system credential contour.

A temporary decrypted working file still exists at:
`/tmp/telegram_bot_token`.

Fresh metadata at preservation preparation:
- size 46 bytes;
- mode `0600`;
- file owned for the existing working principal.

SIS did not read its value during preservation.

This temporary decrypted credential is explicitly excluded from the recovery package and must not be copied into a replacement chat/file. Cleanup or rotation is a separate authorized security action; this package does not perform destructive cleanup.

## Stale cwd behavior on Burzh

Remote Desktop Commander commands may inherit a deleted/stale cwd and print:
`getcwd: cannot access parent directories`.

Use absolute paths or `cd /tmp`. This warning alone is not host failure.

## Secret boundary

No password, token, API key, private key, credential content, QR code or usable access URI is included here.

---
КТО: SIS / СИСАДМИН
ДЛЯ ЧЕГО: preserve non-secret host facts needed for safe replacement
СТАТУС: `self_preservation_candidate_host_state_v03`
