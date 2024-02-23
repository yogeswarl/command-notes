
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

## Spread props
``` html
<!-- Nested.svelte -->
<script>
	export let name;
	export let age;
</script>

<p>Hello {name}!</p>
<p>You are {age} years old.</p>

<!-- App.svelte -->
<script>
	import Nested from './Nested.svelte';
	const props = {
		name: 'world',
		age: 42
	};
</script>

<Nested {...props} />
```

## conditional Blocks
``` html
<script>
	let count = 0;

	function increment() {
		count += 1;
	}
</script>

<button on:click={increment}>
	Clicked {count}
	{count === 1 ? 'time' : 'times'}
</button>

{#if count > 10}
	<p>{count} is greater than 10</p>
{/if}

<!-- If else statements -->
{#if count > 10}
	<p>{count} is greater than 10</p>
{:else}
<p>{count} is between 0 and 10</p>
{/if}

<!-- If else if statements -->
{#if count > 10}
	<p>{count} is greater than 10</p>
{:else if count < 5}
	<p>{count} is less than 5 </p>
{:else}
	<p>{count} is between 0 and 10</p>
{/if}
```

# Each blocks
``` html
<script>
	const colors = ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'];
	let selected = colors[0];
</script>

<h1 style="color: {selected}">Pick a colour</h1>

<div>
	{#each colors as color, i}
	<button
		aria-current={selected === color}
		aria-label={color}
		style="background: {color}"
		on:click={() => selected = color}
	>{i + 1}</button>
	{/each}
</div>

<style>
	h1 {
		transition: color 0.2s;
	}

	div {
		display: grid;
		grid-template-columns: repeat(7, 1fr);
		grid-gap: 5px;
		max-width: 400px;
	}

	button {
		aspect-ratio: 1;
		border-radius: 50%;
		background: var(--color, #fff);
		transform: translate(-2px,-2px);
		filter: drop-shadow(2px 2px 3px rgba(0,0,0,0.2));
		transition: all 0.1s;
	}

	button[aria-current="true"] {
		transform: none;
		filter: none;
		box-shadow: inset 3px 3px 4px rgba(0,0,0,0.2);
	}
</style>

<!-- Creates different colors from the colors array  -->
```

## Keyed each blocks
``` html
<script>
	const todos = [
		{ id: 1, text: 'Learn Svelte' },
		{ id: 2, text: 'Build something awesome' },
		{ id: 3, text: 'Deploy it' }
	];
</script>

<ul>
	{#each todos as todo (todo.id)}
		<li>{todo.text}</li>
	{/each}
</ul>
```

## Await blocks
``` html
<script>
	let promise = null;

	function handleClick() {
		promise = fetch('https://jsonplaceholder.typicode.com/todos/1')
			.then(r => r.json());
	}
</script>

<button on:click={handleClick}>
	Click to fetch
</button>

{#await promise}
	<p>...waiting</p>
{:then value}
	<p>The value is {value.title}</p>
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
```

## DOM events
``` html
<script>
	let m = { x: 0, y: 0 };

	function handleMove(event) {
		m.x = event.clientX;
		m.y = event.clientY;
	}
</script>

<div on:pointermove={handleMove}>
	The pointer is at {m.x} x {m.y}
</div>
<!-- Writing the svelte function inline -->
<div on:pointermove = {(e)=> {
	m= {x : clientX, y : clientY}
	}}>

<style>
	div {
		position: fixed;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		padding: 1rem;
	}
</style>

```

## Event Modifiers
``` html
<script>
	let count = 0;

	function handleClick() {
		count += 1;
	}
</script>

<button on:click|once={handleClick}>
	Clicked {count} {count === 1 ? 'time' : 'times'}
</button>
```

- preventDefault — calls event.preventDefault() before running the handler. Useful for client-side form handling, for example.
- stopPropagation — calls event.stopPropagation(), preventing the event reaching the next element
- passive — improves scrolling performance on touch/wheel events (Svelte will add it automatically where it's safe to do so)
- nonpassive — explicitly set passive: false
- capture — fires the handler during the capture phase instead of the bubbling phase
- once — remove the handler after the first time it runs
- self — only trigger handler if event.target is the element itself
- trusted — only trigger handler if event.isTrusted is true, meaning the event was triggered by a user action rather than because some JavaScript called element.dispatchEvent(...)


## Component Event Dispatching
``` html
<!-- App.svelte -->
<script>
	import Inner from './Inner.svelte';

	function handleMessage(event) {
		alert(event.detail.text);
	}
</script>

<Inner on:message={handleMessage} />

<!-- Inner.svelte -->
<script>
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

	function sayHello() {
		dispatch('message', {
			text: 'Hello!'
		});
	}
	<button on:click={sayHello}>
	Click to say hello
	</button>
</script>
```

## Event Forwarding
``` html
<!-- App.svelte -->
<script>
	import Outer from './Outer.svelte';

	function handleMessage(event) {
		alert(event.detail.text);
	}
</script>

<Outer on:message={handleMessage} />


<!-- Inner.svelte -->
<script>
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

	function sayHello() {
		dispatch('message', {
			text: 'Hello!'
		});
	}
</script>

<button on:click={sayHello}>
	Click to say hello
</button>


<!-- Outer.svelte -->
<script>
	import Inner from './Inner.svelte';
</script>

<Inner on:message />

```

## Binding
``` html
<script>
	let name = 'world';
	let a = 1;
	let yes = false;
</script>

<input bind:value={name}>
<p>Hello {name.toUpperCase()}!</p>
<!--  svelte takes care of handling numerics and texts when you bind -->
<label>
	<input type="number" bind:value={a} min="0" max="10" />
	<input type="range" bind:value={a} min="0" max="10" />
</label>


<!--  example with a checkbox -->
<label>
	<input type="checkbox" bind:checked={yes} />
	Yes! Send me regular email spam
</label>

{#if yes}
	<p>
		Thank you. We will bombard your inbox and sell
		your personal details.
	</p>
{:else}
	<p>
		You must opt in to continue. If you're not
		paying, you're the product.
	</p>
{/if}

<button disabled={!yes}>Subscribe</button>


<!-- Binding to select -->
<select
	bind:value={selected}
	on:change={() => answer = ''}
>

<!-- Binding groups to segrated multiple values of checkbox and radio -->
	{#each ['cookies and cream', 'mint choc chip', 'raspberry ripple'] as flavour}
		<label>
			<input type="checkbox" name="flavours" value={flavour} bind:group={flavours}/>
			{flavour}
		</label>
	{/each}

<!-- Multiple Select -->
	<select multiple bind:value={flavours}>
		{#each ['cookies and cream', 'mint choc chip', 'raspberry ripple'] as flavour}
			<option>{flavour}</option>
		{/each}
	</select>

<!-- Text area binding -->
<textarea bind:value={value}></textarea> <!-- Places where value is same name and value are same, they can be used once like bind:value -->

```

## LifeCycle
- On Mount

``` html
<!-- App.Svelte -->
<script>
	import { onMount } from 'svelte';
	import { paint } from './gradient.js';

	onMount(() => {
		const canvas = document.querySelector('canvas');
		const context = canvas.getContext('2d');

		let frame = requestAnimationFrame(function loop(t) {
			frame = requestAnimationFrame(loop);
			paint(context, t);
		});

		return () => {
			cancelAnimationFrame(frame);
		};
	});
</script>

<canvas
	width={32}
	height={32}
/>

<style>
	canvas {
		position: fixed;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		background-color: #666;
		mask: url(./svelte-logo-mask.svg) 50% 50% no-repeat;
		mask-size: 60vmin;
		-webkit-mask: url(./svelte-logo-mask.svg) 50% 50% no-repeat;
		-webkit-mask-size: 60vmin;
	}
</style>
```
``` js
// gradient.js
export function paint(context, t) {
	const { width, height } = context.canvas;
	const imageData = context.getImageData(0, 0, width, height);

	for (let p = 0; p < imageData.data.length; p += 4) {
		const i = p / 4;
		const x = i % width;
		const y = (i / width) >>> 0;

		const red = 64 + (128 * x) / width + 64 * Math.sin(t / 1000);
		const green = 64 + (128 * y) / height + 64 * Math.cos(t / 1000);
		const blue = 128;

		imageData.data[p + 0] = red;
		imageData.data[p + 1] = green;
		imageData.data[p + 2] = blue;
		imageData.data[p + 3] = 255;
	}

	context.putImageData(imageData, 0, 0);
}
```
- beforeUpdate and afterUpdate
``` html
<script>
	import Eliza from 'elizabot';
	import {
		beforeUpdate,
		afterUpdate
	} from 'svelte';

	let div;
	let autoscroll = false;

	beforeUpdate(() => {
		if (div) {
			const scrollableDistance = div.scrollHeight - div.offsetHeight;
			autoscroll = div.scrollTop > scrollableDistance - 20;
		}
	});

	afterUpdate(() => {
		if (autoscroll) {
			div.scrollTo(0, div.scrollHeight);
		}
	});

	const eliza = new Eliza();
	const pause = (ms) => new Promise((fulfil) => setTimeout(fulfil, ms));

	const typing = { author: 'eliza', text: '...' };

	let comments = [];

	async function handleKeydown(event) {
		if (event.key === 'Enter' && event.target.value) {
			const comment = {
				author: 'user',
				text: event.target.value
			};

			const reply = {
				author: 'eliza',
				text: eliza.transform(comment.text)
			};

			event.target.value = '';
			comments = [...comments, comment];

			await pause(200 * (1 + Math.random()));
			comments = [...comments, typing];

			await pause(500 * (1 + Math.random()));
			comments = [...comments, reply].filter(comment => comment !== typing);
		}
	}
</script>

<div class="container">
	<div class="phone">
		<div class="chat" bind:this={div}>
			<header>
				<h1>Eliza</h1>

				<article class="eliza">
					<span>{eliza.getInitial()}</span>
				</article>
			</header>

			{#each comments as comment}
				<article class={comment.author}>
					<span>{comment.text}</span>
				</article>
			{/each}
		</div>

		<input on:keydown={handleKeydown} />
	</div>
</div>

<style>
	.container {
		display: grid;
		place-items: center;
		height: 100%;
	}

	.phone {
		display: flex;
		flex-direction: column;
		width: 100%;
		height: 100%;
	}

	header {
		display: flex;
		flex-direction: column;
		height: 100%;
		padding: 4em 0 0 0;
		box-sizing: border-box;
	}

	h1 {
		flex: 1;
		font-size: 1.4em;
		text-align: center;
	}

	.chat {
		height: 0;
		flex: 1 1 auto;
		padding: 0 1em;
		overflow-y: auto;
		scroll-behavior: smooth;
	}

	article {
		margin: 0 0 0.5em 0;
	}

	.user {
		text-align: right;
	}

	span {
		padding: 0.5em 1em;
		display: inline-block;
	}

	.eliza span {
		background-color: var(--bg-1);
		border-radius: 1em 1em 1em 0;
		color: var(--fg-1);
	}

	.user span {
		background-color: #0074d9;
		color: white;
		border-radius: 1em 1em 0 1em;
		word-break: break-all;
	}

	input {
		margin: 0.5em 1em 1em 1em;
	}

	@media (min-width: 400px) {
		.phone {
			background: var(--bg-2);
			position: relative;
			font-size: min(2.5vh, 1rem);
			width: auto;
			height: 36em;
			aspect-ratio: 9 / 16;
			border: 0.2em solid #222;
			border-radius: 1em;
			box-sizing: border-box;
			filter: drop-shadow(1px 1px 0px #222) drop-shadow(2px 2px 0px #222) drop-shadow(3px 3px 0px #222)
		}

		.phone::after {
			position: absolute;
			content: '';
			background: #222;
			width: 60%;
			height: 1em;
			left: 20%;
			top: 0;
			border-radius: 0 0 0.5em 0.5em
		}
	}

	@media (prefers-reduced-motion) {
		.chat {
			scroll-behavior: auto;
		}
	}
</style>
```