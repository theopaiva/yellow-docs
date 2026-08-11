# Yellow Docs — Mintlify (migrated from GitBook)

Full migration of docs.yellow.pro from GitBook to Mintlify. All 72 pages converted
from the GitBook `llms-full` export, with real content — no placeholders.

## What's converted
- 71 published pages + 1 hidden internal page (`_internal/media-checklist`, `hidden: true`)
- GitBook → Mintlify blocks:
  - `{% hint %}` → `<Info>` / `<Warning>` / `<Tip>` / `<Note>`
  - `{% stepper %}/{% step %}` → `<Steps>/<Step>`
  - `{% tabs %}/{% tab %}` → `<Tabs>/<Tab>`
  - `{% expand %}` → `<Accordion>`
  - card tables → `<CardGroup>/<Card>`
  - `<figure>` → `<Frame>` with captions
  - buttons, content-refs, and internal `/pages/<id>` links resolved to real slugs
- All 72 files validated against the MDX 3 compiler (0 errors)

## IMPORTANT — images (one manual step)
Image references point to `/images/<id>`. The 40 image files themselves are NOT in
this zip — GitBook stores them behind per-space asset IDs that can't be pulled
without access to the space. To restore them:

1. Open the GitBook space → each page's **Library** tab shows its uploaded assets.
2. Download each asset and save it into `images/<id>` (keep the exact ID as the
   filename; add the real extension, e.g. `images/1zE77szaQK2CetxqxmSV.png` — then
   update that page's link to match, or keep extension-less if Mintlify serves it).
3. `ASSETS_MANIFEST.txt` lists every asset ID, its alt text, and the page it's on,
   so you know exactly what each one is.

Alternatively, if you can reach the live GitBook assets, `download-assets.sh` attempts
to fetch them automatically (URL patterns may need adjusting for your space).

Until the images are added, pages render fully with broken image placeholders only
where screenshots go — all text, tables, code, and structure are intact.

## Publish
1. Create a GitHub repo and upload everything in this folder to the repo root.
2. dashboard.mintlify.com → Settings → GitHub App → install on that repo.
3. Git Settings → point to the repo + branch.
4. Auto-builds on push. Open the live site.

Local preview: `npm i -g mint` then `mint dev` in this folder.
