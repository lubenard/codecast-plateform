<script>
    let email = "";
    let password = "";
    let isLoading = false;
    let isSuccess = false;
    let errors = {};
    let result = null;
    let pseudo;
    let password_confirm;
  
    // Force header and body content-type
    const headers = {
      "Content-type": "application/json"
      };

    async function handleSubmit() {
      errors = {};
      if (pseudo.length === 0) {
          errors.pseudo = "Field should not be empty";
      }
      if (email.length === 0) {
        errors.email = "Field should not be empty";
      }
      if (password.length === 0) {
        errors.password = "Field should not be empty";
      }
      if (password != password_confirm) {
        errors.password = "password does not match";
      }

      if (Object.keys(errors).length === 0) {
        isLoading = true;
        const res = await fetch('http://192.168.99.102:8055/users', {
                method: 'POST',
                headers,
                body: JSON.stringify({
                    first_name: pseudo,
                    email,
                    password
                })
        })
  
        //console.log(await res);
        const resp = await res;
        console.log(resp);

        /*const json = await res.json();
        console.log(json);*/
        if (res.statusText == "OK") {
          isSuccess = true;
          isLoading = false;
        } else {
          errors.server = "There is an error during user creation"; //json.errors[0].message;
          isLoading = false;
        }
      }
    }
  </script>
  
  <style>
    #form {
      background: #fff;
      padding: 50px;
      width: 250px;
      height: 550px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      box-shadow: 0px 20px 14px 8px rgba(0, 0, 0, 0.58);
    }
    label {
      margin: 10px 0;
      align-self: flex-start;
      font-weight: 500;
    }
    input {
      border: none;
      border-bottom: 1px solid #ccc;
      margin-bottom: 20px;
      transition: all 300ms ease-in-out;
      width: 100%;
    }
    input:focus {
      outline: 0;
      border-bottom: 1px solid #666;
    }
    button {
      margin-top: 20px;
      background: black;
      color: white;
      padding: 10px 0;
      width: 200px;
      border-radius: 25px;
      text-transform: uppercase;
      font-weight: bold;
      cursor: pointer;
      transition: all 300ms ease-in-out;
    }
    button:hover {
      transform: translateY(-2.5px);
      box-shadow: 0px 1px 10px 0px rgba(0, 0, 0, 0.58);
    }
    h1 {
      margin: 10px 20px 30px 20px;
      font-size: 40px;
    }
    .errors {
      list-style-type: none;
      padding: 10px;
      margin: 0;
      border: 2px solid #be6283;
      color: #be6283;
      background: rgba(190, 98, 131, 0.3);
    }
    .success {
      font-size: 24px;
      text-align: center;
    }
  </style>
  
  <div id="form">
    {#if isSuccess}
      <div class="success">
        🔓
        <br />
        Your account has been created, please check your mail !
      </div>
    {:else}
      <h1>👤</h1>
  
      <label>Pseudo</label> 
      <input name="text" placeholder="JeanDu45" bind:value={pseudo} />

      <label>Email</label>
      <input name="email" placeholder="name@example.com" bind:value={email} />
  
      <label>Password</label>
      <input name="password" type="password" bind:value={password} />

      <label>Confirm your password</label>
      <input name="password_confirm" type="password" bind:value={password_confirm} />

      <button on:click={handleSubmit}>
        {#if isLoading}Creating account...{:else}Create my account 🔒{/if}
      </button>
  
      <p>You already have a account ?</p>
      <a href="/login">Login here</a>
  
      {#if Object.keys(errors).length > 0}
        <ul class="errors">
          {#each Object.keys(errors) as field}
            <li>{field}: {errors[field]}</li>
          {/each}
        </ul>
      {/if}
    {/if}
  </div>