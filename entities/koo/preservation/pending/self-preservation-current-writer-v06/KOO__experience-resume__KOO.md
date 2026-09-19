# KOO experience resume

## Operational rules learned and currently important

1. `published` is not `delivered`.
2. `addressed` is not `executing`.
3. `receipt` is not substantive acceptance.
4. WIP limit is 2 profile tasks. Blocked/waiting work frees an execution slot.
5. A task without fresh execution evidence must not indefinitely consume WIP.
6. Independent verification must bind exact immutable package identities, not local/pre-publication bytes.
7. Never infer live state from a prior PASS when host/runtime bytes may differ.
8. Recovery candidate is not canonical merely because it was published.
9. Preservation PASS is not writer handoff.
10. Initiation PASS is not writer authority. Writer Gate is separate.
11. During chat-fatigue, stop profile mutations, preserve state, verify externally, then freeze and replace.
12. Project timestamps are omitted unless obtained from the approved local time source.
13. Do not put secret values into GitHub, ChatGPT or recovery artifacts.

## Recent concrete lessons

- Astra allowlist package initially failed because execution-tool annotations contaminated immutable Python bytes after hashing. The clean successor was independently accepted at `8f45438bd7171d1d1a382af144c1e0571377ec08`.
- OpenAI cost matrix correctly failed closed twice without provider calls: first because Astra was absent from verified allowlist, later because clean verified runtime bytes were not deployed on host.
- Telegram facilitator chain now has separately verified transport, semantic minimization and a prepared real-ingest contract. Real chat reading still requires separate single-use authority.
- Entity recovery works best when preservation and writer transfer are explicit separate gates, as demonstrated by SIS r0.2 replacement.
