# KOO self-snapshot for replacement

## Role

KOO / КООРДИНАТОР coordinates project task routing, WIP discipline, verified transitions, recovery gates and addressable delivery. KOO does not silently substitute publication for delivery or task assignment for execution.

## Trigger

Current chat shows chat-fatigue: execution in the mobile application may remain hanging while the same work completes in browser. OPERATOR explicitly ordered canonical replacement initiation.

This is planned preservation, not an emergency recovery from total loss.

## Current writer

Authoritative writer before replacement:
`entities/koordinator/current/KOO__replacement-current-writer-v05.md`
commit `1439c16fc38917692724ca9ec57e68de031fc495`.

## Current queue boundary

Latest KOO queue:
`entities/koordinator/current/KOO__active-queue-r34.md`
commit `8ce084124833a0e80b9b3bde08942f468ea4036b`.

Two active slots at snapshot boundary:
1. SIS clean OpenAI runtime staging
   - task `d9e54c4f5255c09b80a6de3e4e3ad83cb7219ba1`
   - inbox `9dde15662a125a88b1cb10bc108310827a852cfb`
2. SHD Telegram live-ingest preparation verify
   - task `846f9cf3aec6e6d67b4dd0d331dcd8d55e468fd8`
   - inbox `f5332fe222dfcf8fa8e4688f8d2183a0b925e237`

Replacement must fresh-reconcile terminal results newer than this snapshot before resuming anything.

## Important verified foundations

- SIS replacement writer r0.2 PASS:
  `22dca6070748b270ff26d53c5d36ed482941cefb`
  current writer commit `3ca813a7addb711eb8bf2e017b39517268fa31f0`.
- File/Artifact Service final independent PASS:
  `a95ef7308a7a2e2f86c6e021c7f2a4c2f9438232`.
- Clean four-model OpenAI package independent PASS:
  `8f45438bd7171d1d1a382af144c1e0571377ec08`.
- Telegram discussion transport PASS:
  `09b6fdfd04da84533185b11b0861b2220b72dfb3`.
- Telegram semantic synthetic independent PASS:
  `756a0d20791d3fa224d6cb8492df41e9dff3a5d8`.
- KOD Telegram live-ingest preparation PASS:
  `00d6e00efc3d4e8d0fc420cf73cedb52fdd79265`.
- ARH shard host selection PASS:
  `7f846d3d36a2497ef81346b19acf054d2d9339ce`.
  Primary mazhor, fallback burzh, erefia deferred pending approved Git surface.

## Secret boundary

No API keys, passwords, Telegram bot token values, private keys, usable secret URIs or credential contents belong in replacement recovery.

Known operational tail only:
temporary decrypted Telegram credential file was previously observed on burzh at `/tmp/telegram_bot_token`, mode 0600. Its contents are not part of this package. Cleanup/rotation is separate work.
