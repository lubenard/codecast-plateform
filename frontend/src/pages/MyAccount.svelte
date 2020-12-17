<script>
    import { onMount } from "svelte";
    import Menus from './Menus.svelte';
    import Utils from '../utils.js';

    const headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer " + Utils.getCookie("Auth"),
    }
    let json = null;

    onMount(async () => {
        const res = await fetch('http://192.168.99.102:8055/users/me', {headers});
        json = await res.json();
        console.log(json);
    });
</script>

<style>
    #theme-menu-content label {
        margin: auto;
    }
</style>

<Menus/>

<div id="content">
   <ul class="collection with-header">

    {#if json != null && json.data != null}
        <li class="collection-header"><h4>Hello, {json.data.first_name}</h4></li>
    {:else}
        <li class="collection-header"><h4>Hello, John Doe</h4></li>
    {/if}
        <li class="collection-item"><div>My uploaded videos<a href="#!" class="secondary-content"><i class="material-icons">cloud_uploaded</i></a></div></li>
        <li class="collection-item"><div>My settings<a href="/settings" class="secondary-content"><i class="material-icons">settings</i></a></div></li>
    </ul>


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
        <h4>Email</h4>
        
        <div id="email-menu-content">
            <label for="new_email"></label>
            <input placeholder="My new email" id="new_email" type="text" class="validate">
        </div> 
    </div>

    <br/><br/>
    <div id="password-menu">
        <h4>Password</h4>
        
        <div id="password-menu-content">
            <label for="new_password"></label>
            <input placeholder="My new password" id="new_password" type="text" class="validate">
            <label for="confirm_new_password"></label>
            <input placeholder="Confirm my new password" id="confirm_new_password" type="text" class="validate">
        </div> 
    </div>
    
    <a class="waves-effect waves-light btn-large red">Delete my account</a>

</div>