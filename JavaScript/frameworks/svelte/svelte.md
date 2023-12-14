
# Svelte Basics 
[Tutorial Walkthrough From official Website](https://learn.svelte.dev/tutorial/welcome-to-svelte)
## Creating a Svelte App
### Install Svelte
```bash
npm install svelte
```
## Basic Svelte Template
```html
<script>
  let name = 'world!';
</script>
<!-- Name becomes a dynamic attribute -->
<h1>Hello {name}!</h1>
<!-- Hello world! -->
```

## Adding styles to a component
``` html
<style>
  h1 {
    color: purple;
  }
</style>
<h1> This is a Heading </h1>
```

## Nested Components
---
- App.svelte
``` html
<script>
  import Nested from './Nested.svelte';
</script>
<Nested />
```
- Nested.svelte
``` html
<h1>This is a Nested Component </h1>
```
**Note**: Component names are always capitalized in Svelte to distinguish them from regular HTML elements.<br/>Any styles in App.svelte will not be leaked to Nested.svelte, and vice versa. This is because each component is compiled in isolation, not in the context of its parent component.
