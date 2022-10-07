<h1 align="center">Astro × Tailwind CSS Template</h1>

## 📷 Icon Component Creation

Icons in [Bootstrap Icons](https://icons.getbootstrap.com/) can be easily converted to icon components.

```zsh
$ make icon icon=1-circle
```

The `OneCircle.astro` file will be created in `src/components/icons` after executing the above command.

If you want to set the `size` props for the icon component, use `size=true`.

```zsh
$ make icon icon=1-circle size=true
```

This command will generate the following file.

**`src/components/icons/OneCircle.astro`**

```astro
---
export interface Props {
  size: number;
}

const { size } = Astro.props;
---

<svg xmlns="http://www.w3.org/2000/svg" width={size} height={size} fill="currentColor" class="bi bi-1-circle" viewBox="0 0 16 16">
  <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM9.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z"/>
</svg>
```

> **Note**  
> Component extensions and paths can be changed by rewriting `COMPONENT_EXTENSION` and `ICON_PATH` in the Makefile.

## 🗑 Remove modules that have not been called

Unused components can be identified and removed by executing the following commands.

Rewrite `IGNORE_DIRS` and `IGNORE_FILES` in `tools/unused` for any directories or files you do not want to include.

```zsh
$ make unused
```

### Target extensions

The target files are written in `TARGET_EXTENSIONS` and by default the following extensions are covered.

<div align="center">

  <img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/react.svg" width="12%" /><img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/react_ts.svg" width="12%" /><img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/astro.svg" width="12%" /><img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/svelte.svg" width="12%" /><img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/main/icons/vue.svg" width="12%" />

</div>

- `.jsx`
- `.tsx`
- `.astro`
- `.svelte`
- `.vue`

## 🌳 Directory structure directly under src

```
src
├── assets
│   └── images
├── components
│   ├── atoms
│   ├── icons
│   ├── molecules
│   ├── organisms
│   └── templates
├── env.d.ts
├── layouts
│   └── Layout.astro
└── pages
    └── index.astro
```
