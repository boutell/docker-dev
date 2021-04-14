# Node.js & MongoDB development environment with Docker

Handy for MERN, MEAN and ApostropheCMS projects.

**Build** the container (just this once):

```
docker-compose build
```

**Start** the container (leave running in a terminal):

```
docker-compose up
```

Now open a shell:

```
docker-compose exec docker-dev bash
```

Welcome to your shell. This is where you will do all of the normal command
line things, like running `git clone`, `npm install`, `npm run dev`, etc.

**The `./projects` folder is shared with the host machine's `./projects` folder,**
which you'll see on the host as soon as you run `./up` for the first time.
**You need to `cd` to that folder first to do any work you want to keep.**

Thanks to the syncing you can edit code in `./projects` on your host
computer, with vscode for instance.

Changes are synced in both directions, so you can also edit code, touch
files and use git commands in the shell and those changes should stick
on the host computer.

The `./data/db` folder is where your MongoDB database persists, so do not
remove that folder.

> Everything not in `./projects` or stored in MongoDB goes away when you
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

## Shortcuts

The `./start`, `./up` and `./shell` scripts are handy shortcuts if you're on a MacOS or Linux host. For Windows you'll need to type the commands as shown above.

## Performance

Docker volumes are great for persistence, but they are very slow on Windows and MacOS hosts. To work around that, we
combine a Docker volume with the [unison](https://www.cis.upenn.edu/~bcpierce/unison/) utility. `unison` keeps your
code in sync without crippling the performance of `npm install`, `webpack`, etc.

Also, any folder named `node_modules` is **not synced**. This improves performance and there is no benefit to syncing them,
since your host OS and the Linux-powered container usually cannot use the same packages without a fresh install command.

