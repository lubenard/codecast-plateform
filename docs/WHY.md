## What is codecast-plateform ?

Codecast-plateform is a plateform hosting records made by [generic-rrweb-recorder](https://telecom-paris.github.io/generic-rrweb-recorder/) and [codecast](https://codecast.wp.imt.fr/codecast-recorder/)

## What are the technologies used by codecast-plateform ?

Codecast-plateform use the following technologies:
    - Frontend: Svelte [svelte.dev](https://svelte.dev/)
    - Backend: Directus [directus.io](https://directus.io/)
    - Database: MariaDB [mariadb.org](https://mariadb.org)
    - Hosting: Docker [docker.com](https://www.docker.com/)
    - CI: Travis CI or Jenkins

## What is the mindset behind codecast-plateform ?

With this plateform, we wante to make a:
    - Instantiable plateform
    - Open source plateform
    - Community driven plateform
    - Coded with with technologies
    - Headless CMS plateform, for easier adaptation on other supports (mobile, etc...)

## What were our other tech options ?

To developp this app, we had multiple technologies choices (languages and frameworks are mixed):
    - Frontent: 
        - Raw HTML (Too old)
        - Angular (Too big for what we wanted to do)
        - VueJs (Was the choice, until we changed to Svelte)
        - React Native (Too slow)
        - Svelte ✅ (VueJs, but easier, and faster to developp with)

    - Backend:
        - Raw PHP (Too old, we wanted to use new technologies)
        - NodeJs (Too slow)
        - Golang (Was the choice, until we changed to Directus)
        - Java (Not adapted)
        - Python (with Flask)
        - Rust (Slower compared to Golang)
        - Directus (PHP Framework, headless CMS) ✅
        - Strapi (Node Framework, headless CMS, limited in possibility by the company)
    
    - Database:
        - Mysql (Great, but partially closed source)
        - Mariadb ✅ (Same as mysql, but completely open source)
        - PostresQL (Was great, but we prefered mariaDB for it's compatibility with mysql)
        - SqLite (Great for small databases, but not for huge db)
    
    We use docker to be able to: 
        - Scalablility made easier
        - Easier deployement on new servers
        - We can change components without having to redevelopp eveything