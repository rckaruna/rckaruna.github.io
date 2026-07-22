# rckaruna.github.io

Personal site of Ruwan C. Karunanayaka — cricket analytics, design of experiments,
and statistical consulting. Built with [Quarto](https://quarto.org) and published on
GitHub Pages.

## Prerequisites

- [Quarto CLI](https://quarto.org/docs/get-started/) (1.4+)
- R, with the packages used by the home-page chart:
  ```r
  install.packages("ggplot2")
  ```

## Preview locally

From the project folder:

```bash
quarto preview
```

This opens the site in your browser and live-reloads as you edit. To do a one-off
full build:

```bash
quarto render
```

Rendered output lands in `docs/`.

## Project layout

```
_quarto.yml                 site config: navbar, theme, footer
theme.scss                  the visual identity (colors, type, layout)
index.qmd                   home page (consulting-led)
projects.qmd                apps + live worm embed + dgt package
research.qmd                publications, working papers, software
consulting.qmd              services + contact
teaching.qmd                courses
blog.qmd                    blog listing (auto-built from posts/)
posts/                      one folder per post (index.qmd inside each)
references.bib              BibTeX for citing your papers in posts
docs/                       built site (committed; GitHub Pages serves this)
```

## The worm widget

`widgets/worm.html` polls your gist for live matches and falls back to the
embedded preset matches otherwise. Regenerate presets with `make_presets.R`
in the Shiny app folder, then re-splice and replace the widget file.

## Publishing to GitHub Pages

### Option A — commit `docs/` (simplest, recommended)

1. Create a repo named **`rckaruna.github.io`** on GitHub.
2. Locally:
   ```bash
   git init
   git add .
   git commit -m "Initial site"
   git branch -M main
   git remote add origin https://github.com/rckaruna/rckaruna.github.io.git
   git push -u origin main
   ```
3. On GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a
   branch**, then choose **`main`** branch and **`/docs`** folder. Save.
4. Your site goes live at `https://rckaruna.github.io` within a minute or two.

Re-run `quarto render`, then commit and push, whenever you want to update the site.

### Option B — let GitHub build it (no committed `docs/`)

A workflow is included at `.github/workflows/publish.yml`. It renders on every push
and publishes to a `gh-pages` branch. If you use it, set **Pages → Source** to the
**`gh-pages`** branch, and uncomment the `/docs/` line in `.gitignore`. Note this
runs R on CI, so any chunk that needs your private data should stay cached via
Quarto's `freeze` (already enabled) — commit the `_freeze/` folder.

## Custom domain (optional)

If you register a domain (e.g. `rckaruna.ca`): add a file named `CNAME` in `docs/`
containing just the domain, point your DNS at GitHub Pages, and update `site-url`
in `_quarto.yml`.
