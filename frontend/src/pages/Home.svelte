<script>
    import { onMount } from "svelte";
    import Menus from './Menus.svelte';
    import Utils from '../utils.js'

    let records = [];

    onMount(async () => {
        const res = await fetch('http://192.168.99.102:8080/_/items/replays?fields=*.*').then(async function(res) {
            console.log(res);
            const raw_res = await res.json().then(function(clean_res) {
                records = clean_res.data;
                console.log(records);
                //console.log(records.data);
            });
        });
    });
</script>

<style>
    
</style>

<Menus />
<div id="content">
    {#if records == undefined}
        <p>The server was unable to process the request, please try again later</p>
    {:else if records.error}
        <p>A error occured: {records.error.message}</p>
    {:else}
        {#each records as record}
            <ul>
                <li>{record.name} - {record.owner.first_name} - {record.views} views</li></ul>
        {:else}
            <!-- this block renders when users.length === 0 -->
            <p>Loading...</p>
        {/each}
    {/if}
    {#if Utils.getCookie("Auth")}
        <div class="fixed-action-btn">
            <a class="btn-floating btn-large red">
                <i class="large material-icons">
                    <img src="./media/publish-white.svg" alt="./media/publish-white.svg" />
                </i>
            </a>
        </div>
    {/if}    
</div>