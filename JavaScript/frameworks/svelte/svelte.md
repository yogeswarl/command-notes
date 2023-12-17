
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


## HTML Tags
``` html
<script>
	let string = `this string contains some <strong>HTML!!!</strong>`;
</script>

<p>{@html string}</p>
<!-- this string contains some HTML!!! -->
```
## Assigning Variables to on click event handlers.
``` html 
<script>
	let count = 0;
  $: doubled = count * 2;  // This is a reactive statement 
	function increment() {
		count += 1;
	}
</script>

<button on:click={increment}>
	Clicked {count}
	{count === 1 ? 'time' : 'times'}
</button>
```

## Reactive statements
``` html
<script>
	let count = 0;
	$: if (count >=10){ // This is a reactive statement 
		alert(`count is dangerously high!`);
		count = 0;
	}  
	function increment() {
		count += 1;
	}
</script>
```

## Update Arrays and Objects
- updates an array by adding a new item to the end
``` html
<script>
	let numbers = [1, 2, 3, 4];

	function addNumber() {
		numbers = [...numbers, numbers.length + 1];
	}

	$: sum = numbers.reduce((total, currentNumber) => total + currentNumber, 0);
</script>

<p>{numbers.join(' + ')} = {sum}</p>

<button on:click={addNumber}>
	Add a number
</button>
```

- updates an object by adding a new property

``` html
<script>
	let todos = [
		{ id: 1, text: 'Learn Svelte' },
		{ id: 2, text: 'Build something awesome' },
		{ id: 3, text: 'Deploy it' }
	];

	function addTodo() {
		todos = todos.concat({
			id: todos.length + 1,
			text: `New todo ${todos.length + 1}`
		});
	}
	function addNumbers() {
		numbers= [...numbers, numbers.length + 1];
	}
</script>

<button on:click={addTodo}>
	Add a todo
</button>
<ul>
	{#each todos as todo}
		<li>{todo.text}</li>
	{/each}
</ul>
```

## Declaring Props
``` html
<!-- Nested.svelte -->
<script>
	export let name;
</script>

<p>Hello {name}!</p>

<!-- App.svelte -->
<script>
	import Nested from './Nested.svelte';
</script>

<Nested name="world" />
```