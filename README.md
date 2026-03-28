# the-kitchen-sink
Lol, a complete frank-app to showcase all the things!

## Documentation 

First, I will start with documentation!

Let's discuss our basic app: in honor of tax season, let's build a quick tax burden calculator!

### The basic idea
We will use an Agile development methodology to create, enhance, and deploy our app.

### The basic architecture
We want a cloud based microservices app with a simple UI, authentication, and a database of users to calculate a person's tax burden.

> Our first version of the app will only calculate the tax burden from the person's gross income (not adjusted), using the standard deduction, and only for unmarried people.  In future sprints we will add more features, but this will get us started!

### The basic process
We begin with our Gherkin user stories.  We then move to architecting goals, structure, and tech with ArchiMate.  

We then proceed to develop a Proof of Concept system with our preferred tech stack.

Once our PoC is ready, we create our technical documentation and design using ArchiMate (general design) and UML (communication diagrams, user stories, etc.).

We then verify our assumptions about our algorithms, protocols, and architecture using TLA+ and Rocq.

Finally, we implement our backend microservices code in Erlang/Cowboy, our frontend code in React, and our database in PostgreSQL.  For extra performance we will use Mnesia and synchronize to PostgreSQL eventually.

### The basic tech
Our tech stack will be based on PostgreSQL.  Erlang for the middle tier, with Cowboy as our REST API logic layer.  On the frontend we will use React and .NET MVC.  

### The constraints
We will develop a secure, observable, and extensible set of microservices.  

**Observability** will involve using the OpenTelemetry protocol in our code.  

**Security** will be based on the OWASP to 10 guidelines in general and the DISA STIGs specifically.

**Extensibility** will be achieved by implementing everything as a microservice such that we can always reuse our logic from anywhere.