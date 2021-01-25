# Node.js & MongoDB development environment with Docker

Handy for MERN, MEAN and ApostropheCMS projects.

**Build** the container (just this once):

```
./build
```

**Start** the container (leave running in a terminal):

```
./run
```

Now open a shell and use it as you see fit:

```
./shell
```

Welcome to your shell. The `./shared` folder is shared with the
host machine's `./shared` folder wherever you cloned this repo, so you
can edit your project with vscode and other tools on your desktop.

The `./data/db` folder where you cloned this repo is where your
MongoDB database persists.

> Everything not in `./shared` or MongoDB goes away when you
> restart the container.

Included in the environment:

* Node.js 14.x is installed
* npm is installed
* mongodb is running on localhost
* git is installed
* imagemagick utilities are installed
* Build essentials are installed, for binary npm packages
* **Port 3000 is open and mapped to `localhost:3000`**, for testing your MEAN stack apps.

We use this environment to develop [ApostropheCMS sites](https://apostrophecms.com) on Ubuntu Linux, avoiding any surprising differences between Mac and Linux environments.

"Why does MongoDB run inside the container?" This makes it easier to run apps with their default settings and also ensures that the MongoDB CLI tools are available in the container. Remember, this is for **development,** so making people fuss with MongoDB URIs doesn't help.

TODO: while the shared volume is set to "delegated" for best performance, it's still quite slow to `npm install` inside `./shared`. Consider `unison`, `docker_sync`, and other possibilities. Ignoring `node_modules` altogether from file synchronization would probably be a significant win.
