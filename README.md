## wp-bump-version

USE:

```
wp-bump-version /path/my-new-plugin/ 1.1.1
```
Change the version in README.txt, plugin-slug.php and public/class-plugin-slug.php

Download the script, move in /usr/local/bin and set the permission 
```
wget -O /usr/local/bin/wp-bump-version https://raw.githubusercontent.com/WPBP/tools/master/wp-bump-version.sh | chmod +x /usr/local/bin/wp-bump-version
```

## wp-readme-last-wp-tested

USE:

```
wp-readme-last-wp-tested /path/my-new-plugin/readme.txt
```

Automatically will change the version in `Tested up` field to the last WordPress version avalaible.

## Localization Tools

The WordPress Plugin Boilerplate uses a variable to store the text domain used when internationalizing strings throughout the Boilerplate. To take advantage of this method, there are tools that are recommended for providing correct, translatable files:

* [Poedit](http://www.poedit.net/)
* [makepot](http://i18n.svn.wordpress.org/tools/trunk/)
* [wp-cli/i18n](https://github.com/wp-cli/i18n-command)
* [grunt-wp-i18n](https://github.com/blazersix/grunt-wp-i18n)

Any of the above tools should provide you with the proper tooling to localize the plugin.

## External resources

On [https://github.com/sudar/wp-plugin-in-github](https://github.com/sudar/wp-plugin-in-github) there is many useful snippet for the deploy.  

    clone-from-svn-to-git.sh - Use this script to clone your WordPress Plugins from SVN into git/github
    deploy-plugin.sh - Use this script to push your WordPress Plugin updates to SVN from git/github
    readme-converter.sh - Use this script to convert readme files between Github markdown and WordPress repo markdown format
    create-archive.sh - Use this script to create a zip archive of the Plugin
    update-version.sh - Use this script to update version string in all the files of the Plugin
 
