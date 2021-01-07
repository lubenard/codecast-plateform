<script>
    import { onMount } from 'svelte';
    import { getCookie } from '../utils.svelte'
    
    let navbar;

    let leftMenu;
    let leftMenuStatus = true;
    let leftMenuIcon = "./media/clear-white.svg";

	onMount(() => {
		var sticky = navbar.offsetTop;
		console.log(navbar);
		
		window.onscroll = function() { handleScroll() };
        
        function handleScroll() {
            console.log("I am scrolling");
	  	    if (window.pageYOffset >= sticky) {
                console.log("I am adding attribute");
    		    navbar.classList.add("sticky");
  		    } else {
                console.log("I am removing attribute");
    		    navbar.classList.remove("sticky");
              }
        }
    });

    function manageLeftMenu() {
        if (leftMenuStatus) {
            leftMenuStatus = false;
            leftMenuIcon = "./media/menu-white.svg";
            leftMenu.style.width = "0";
        } else {
            leftMenuStatus = true;
            leftMenuIcon = "./media/clear-white.svg";
            leftMenu.style.width = "15%";
        }
    }
</script>

<style>
ul {
    margin: 0;
    padding: 0;
    height: 100%;
    overflow: auto;
    top: 80px;
}
	
li a {
    display: block;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
}

#left-menu {
  width: 15%;
  height: 100%;
  position: fixed;
  left:0;
  margin-top: 50px;
  background-color: #161313;

  -webkit-transition: width 0.5s;
  -moz-transition: width 0.5s;
  -o-transition: width 0.5s;
  transition: width 0.5s;
}
	
header {
    background-color: #161313;
    left:0;
    position: fixed;
    top: 0;
    width: 100%;
    height: 7%;
}

#search-container {
    float: left;
}

#searchbar {
    border: 1px solid #444141;
    background-color: #302929;
    color: white;
    width: 500px;
    height: 40px;
}

header #search-container button {
    float: right;
    font-size: 17px;
    border: none;
    cursor: pointer;
}

#right-container {
    margin-top: 10px;
    float: right;
    width: 50%;
}

#header_menu {
    margin-top: 10px;
    width: 45px;
    float: left;
}

#header_text {
    display: inline;
    vertical-align: middle;
    color: white;
    text-decoration: none;
    font-size: xx-large;
}

.sticky {
    position: fixed;
    top: 0;
    width: 100%;
}

#searchbar-button {
    background-repeat : no-repeat;
    width: 45px;
    background-color: black;
}

.dropbtn {
  cursor: pointer;
}

.dp {
  position: relative;
  display: inline-block;
}

.dp-content {
  display: none;
  position: absolute;
  background-color: grey;
  min-width: 125px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dp-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dp-content a:hover {background-color: #f1f1f1}

.dp:hover .dp-content {
  display: block;
}

.dp:hover {
  background-color: grey;
}

:global(#content) {
        left: 18%;
        top: 10%;
        right: 2%;
        bottom: 0;
        overflow: auto;
        position: fixed;
}
</style>

<header id="navbar" ref="header" bind:this={navbar}>
    <img src={leftMenuIcon} alt="./media/menu-white.svg" on:click={manageLeftMenu}/>  
    <a id="header_text" href="/">Acceuil</a>
    <div id="right-container">
        <div id="search-container">
            <form action="">
                <input id="searchbar" type="text" placeholder="Search.." name="search">
                <button id="searchbar-button" type="submit">
                    <img src="./media/search-white.svg" alt="./media/search-white.svg" />
                </button>
            </form>
        </div>
        <div id="userAccount">
            {#if getCookie("Auth")}
                <div class="dp">
                    <button class="dropbtn waves-effect waves-light btn">My account</button>
                    <div class="dp-content">
                        <a href="/myaccount">My account</a>
                        <a href="/logout">Logout</a>
                    </div>
                </div>
            {:else}
                <a class="waves-effect waves-light btn" id="login-button" href="/login">Connection</a>
            {/if}
        </div>
    </div>
</header>

<div id="left-menu" bind:this={leftMenu}>
    <ul>
      <li><a class="active" href="/discover">Découvrir</a></li>
      <li><a href="/trends">Tendances</a></li>
      <li><a href="/playlists">Playlists</a></li>
      <li><a href="/about">A propos</a></li>
    </ul>
</div>