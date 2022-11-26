<h1 align="center">Astro × Tauri × Tailwind CSS Template</h1>

## ⚙️ Setup

```zsh
$ git clone https://github.com/ogty/astro-tauri-template <project-name>
$ cd <project-name>
$ npm install
$ npm run astro add <framework-name>
$ npm run build # Run to eliminate dist file errors
$ npm run dev
```

## 🤖 Use tauri command

```zsh
$ npm install @tauri-apps/api
```

**`src-tauri/src/main.rs`**

```rs
// ...

fn main() {
  tauri::Builder::default()
    .invoke_handler(tauri::generate_handler![
      hello,
    ])
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}

#[tauri::command]
fn hello() {
  println!("Hello from Rust!");
}
```

**`src/components/atoms/Call.svelte`**

```svelte
<script lang="ts">
  import { invoke } from '@tauri-apps/api';

  invoke('hello');
</script>
```

**`src/pages/index.astro`**

```astro
---
import Call from '@atoms/Call.svelte';
import Layout from '@layouts/Layout.astro';
---

<Layout title="Astro × Tailwind CSS Template">
  <Call client:only />
</Layout>
```

> **Note**<br />
> The `.astro` file will probably not call the tauri command.<br />
> You can call it if it is a svelte file, but in that case you must specify `cliend:only`. `client:load` will not work!

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
