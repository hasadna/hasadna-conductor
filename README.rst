HaSadna Conductor
-----------------
**WIP**

**NOTE**: I've copied this from a private version, and made adjustments for the public version. Everything needs to be checked to ensure it is usable

**NOTE**: I've removed passwords from users/init.sls, postgresql-server/init.sls, and mysql-server/init.sls

**NOTE**: The mongodb state has not been used, and may have bugs

The current state of the repo is a buch of salt state files for a salt master.

See top.sls for some examples of how to use the states in bootstrapping and maintaining a specific minion.


There are, of course, some conventions:

* The minions are expected to run Debian. We use dotdeb to get up-to-date packages (Redis, Node, etc.)
* The minions are bootstrapped with a user called 'robot'. This username is also used for Postgres
* We serve from /srv and follow a certain pattern for virtual envs and project code (See the state file for directories, and the profile configuration in users/environment_vars)
* The scripts bootstrap and ensure machine state, but do not do anything for specific project settings (except for making services available).
* Configuration that is very project specific goes in 'machines', with the name of the project, and perhaps an additional key for the service if the project uses mutiple machines. See the example of openmuni-db
* The 'Conductor' machine, which is the Salt Master, also manages itself, as you can see in top.sls

Until now, I used Salt for setting up machines as above, but continued to use Fabric for bootstrapping actual project code.

That means the current assumption is that each project makes its own:

* nginx conf
* supervisor confs (for app, queue, whatever else it needs)
* additional deployment settings

We can move all this work under the management of Salt. If it helps, we can also reference my Fabric implementation for that here:

https://github.com/pwalsh/quilt

And specifically, templates for configuring services here:

https://github.com/pwalsh/quilt/tree/master/quilt/contrib/templates
