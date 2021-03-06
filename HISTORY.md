## History

### 0.11+ (October 2010) @dirkkelly | sponsored by @frontiergroup

* Products and Categories are now pages
* Orders are shown in the admin system
* Seed data allows you to easily bootstrap
* All actions now utilize the form extension
* Core has remained minimal and been built to be extended, look out for
** radiant-shop_discounts-extension
** radiant-shop_variants-extension
** radiant-shop_packages-extension
* Wiki work is under way, we're ready for the world to start playing

### 0.10+ (September 2010) @dirkkelly | sponsored by @frontiergroup

* Started releasing as a Gem
* Customers are a model that extend users, they have no admin access

### 0.9+ (September 2010) @dirkkelly | sponsored by @frontiergroup

* SPECS! Yes, lots of them.
* Merged shop_products and shop_cart with the eventual goal being a standalone shop solution
* Restructure of lib to make things more obvious
* Working towards making this into a gem

### 0.9 (August 2010) @dirkkelly

* Moved to Images for base image handling
* Started creating specs

### 0.8 (15 Jun 2010) @dirkkelly

* Started pulling apart the database, removing overkill columns and tidying up codebase
* Making it easier to understand, and less feature bloated
* @sbmsuite no longer involved in the project

### 0.7 (11 Mar 2010)

* @dirkkelly and @sbmsuite decide to make this the core for an entire shop extension

### 0.6 (26 Sep 2009)

* Products and Categories can be arbitrarily ordered by the admin

### 0.5.2 (22 Sep 2009)

* Product Images can now be tagged
* Moved repository under the http://www.github.com/aurorasoft user

### 0.5.1 (21 Sep 2009)

* Bugfix with Category and Product links not always selecting correctly
* Cleaned up url code (possibly leading into customizable product root)

### 0.5 (21 Sep 2009)

* Relevant Category:link and Product:link tags now include a "selected" class when used on generated pages
* Product image sizes can be changed, and referenced by <r:product:image type="SIZE" />

### 0.4.2 (18 Sep 2009)

* Added ability to attach multiple images to a product

### 0.4.1 (18 Sep 2009)

* Added custom layouts selected at Category level

### 0.4 (17 Sep 2009)

* Added subcategory support, and subcategory tags
* Added support for public Category and Product pages
* Added custom field support

### 0.3 (26 Aug 2009)

* Added ability to tag Categories

### 0.2 (15 Aug 2009)

* Updated to work with Radiant-0.8.0

### 0.1

* Original version by Jason Stirk - http://griffin.oobleyboo.com/

### Thanks

Thanks to John Reilly, Justin Grammens who did most of the work to get the original extension working under Radiant-0.7.1 and 0.8.0.

Huge thanks to Ingvi Gudmundsson (http://www.ingvithor.net/) for sponsoring and helping test v0.4 to v0.6.

----

Thanks to Jason Stirk for the original code base, it was a great starting point for seeing how an extension like this could be built.