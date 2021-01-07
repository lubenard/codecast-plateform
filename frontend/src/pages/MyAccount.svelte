<script>
    import { onMount } from "svelte";
    import Menus from './Menus.svelte';
    import { getCookie } from '../utils.svelte';

    const headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + getCookie("Auth"),
    }
    let json = null;

    function saveChanges() {
        
    }


    onMount(async () => {
        const res = await fetch('http://192.168.99.102:8055/users/me', {headers});
        json = await res.json();
        console.log(json);

        if (json && json.errors) {
            window.location = "/login";
        }

        //Initialise the Materialize Collapsibles.
        // https://materializecss.com/collapsible.html
        var elems = document.querySelectorAll('.collapsible');
        M.Collapsible.init(elems, null);
    });
</script>

<style>
    #theme-menu-content label {
        margin: auto;
    }
</style>

<Menus/>

<div id="content">

    {#if json != null && json.data != null}
        <h4>Hello, {json.data.first_name}</h4>
    {:else}
        <h4>Hello, John Doe</h4>
    {/if}
    
    <ul class="collapsible">
        <li>
            <div class="collapsible-header"><i class="material-icons">filter_drama</i>My Uploaded videos</div>
            <div class="collapsible-body"><span>All of my videos</span></div>
        </li>
    <li>
        <div class="collapsible-header"><i class="material-icons">settings</i>My settings</div>
        <div class="collapsible-body">

            <a class="waves-effect waves-light btn blue darken-3">Save my changes</a>

            <div id="theme-menu">
                <h4>Theme</h4>
                <div id="theme-menu-content">
                    <label>
                        <input class="with-gap" name="theme" type="radio" />
                        <span>Light</span>
                    </label>
                    <label>
                        <input class="with-gap" name="theme" type="radio" checked />
                        <span>Dark</span>
                    </label>
                </div>
            </div> 
        
            <br/><br/>
            <div id="email-menu">
                <h4>Change my Email</h4>
                
                <div id="email-menu-content">
                    <label for="new_email"></label>
                    <input placeholder="My new email" id="new_email" type="text" class="validate">
                </div> 
            </div>
        
            <br/><br/>
            <div id="password-menu">
                <h4>Change my password</h4>
                
                <div id="password-menu-content">
                    <input placeholder="My old password" id="old_password" type="text" class="validate">
                    <label for="new_password"></label>
                    <input placeholder="My new password" id="new_password" type="text" class="validate">
                    <label for="confirm_new_password"></label>
                    <input placeholder="Confirm my new password" id="confirm_new_password" type="text" class="validate">
                </div> 
            </div>

            <br><br>

            <a class="waves-effect waves-light btn blue darken-3">Save my changes</a>

            <br><br>

            <a class="waves-effect waves-light btn-large red">Delete my account</a>
      </div>
    </li>
  </ul>
</div>