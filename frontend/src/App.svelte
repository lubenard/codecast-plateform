<script>
  import router from "page"
  
  // Include our Routes
  import Home from './pages/Home.svelte'
  import Login from './pages/LoginForm.svelte'
  import Register from './pages/Register.svelte'
  import MyAccount from './pages/MyAccount.svelte'
  import Record from './pages/Record.svelte'
  import Settings from './pages/Settings.svelte'
  import About from './pages/About.svelte'

  let page
  let params
  // Set up the pages to watch for
  router('/', () => page = Home)
  router('/login', () => page = Login)
  router('/register', () => page = Register)
  router('/myaccount', () => page = MyAccount)
  router('/record', () => page = Record)
  router('/settings', () => page = Settings)
  router('/about', () => page = About)
  // Set up the router to start and actively watch for changes
  router.start()
</script> 

<svelte:head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!--Yes, yes, it is google, but i have no choices..., this is related to materialize lib-->
    <!--See here: https://materializecss.com/icons.html  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</svelte:head>

<svelte:component this={page} params={params} />