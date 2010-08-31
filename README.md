# Radiant Shop

## Merge shop products extension:

= Shop Products

Allows a store owner to add products and product categories to a store.

== Route Navigation

/shop/:category
/shop/:category/:product

These routes are automatically generated and allow the store owner to simply stick with one
interface to generate the content.

Extending the details of a product involves coding in additional fields and extending the interface

== Page Based Navigation

Alternatively you can create Page Types which align a page to a product/category. This means
you can generate custom navigation (categories with categories as children) and having additional
fields is as easy as creating more parts and updating the layout

*PageFactories will really help out with this*

== Learn From Me

This extension relies on "shop":http://github.com/squaretalent/radiant-shop-extension and has adopted
a few features which were originally a part of core. Check out /lib to see how we extends objects, 
create relations to products and assets and generally do awesome things.

This will really help you in extending things yourself.

## History

### Version 0.9 (August 2010) @dirkkelly

* Moved to Images for base image handling
* Started creating specs

### Version 0.8 (15 Jun 2010) @dirkkelly

* Started pulling apart the database, removing overkill columns and tidying up codebase
* Making it easier to understand, and less feature bloated

### Version 0.7 (11 Mar 2010)

* @dirkkelly and CR decide to make this the core for an entire shop extension

### Version 0.6 (26 Sep 2009)

* Products and Categories can be arbitrarily ordered by the admin

### Version 0.5.2 (22 Sep 2009)

* Product Images can now be tagged
* Moved repository under the http://www.github.com/aurorasoft user

### Version 0.5.1 (21 Sep 2009)

* Bugfix with Category and Product links not always selecting correctly
* Cleaned up url code (possibly leading into customizable product root)

### Version 0.5 (21 Sep 2009)

* Relevant Category:link and Product:link tags now include a "selected" class when used on generated pages
* Product image sizes can be changed, and referenced by <r:product:image type="SIZE" />

### Version 0.4.2 (18 Sep 2009)

* Added ability to attach multiple images to a product

### Version 0.4.1 (18 Sep 2009)

* Added custom layouts selected at Category level

### Version 0.4 (17 Sep 2009)

* Added subcategory support, and subcategory tags
* Added support for public Category and Product pages
* Added custom field support

### Version 0.3 (26 Aug 2009)

* Added ability to tag Categories

### Version 0.2 (15 Aug 2009)

* Updated to work with Radiant-0.8.0

### Version 0.1

* Original version by Jason Stirk - http://griffin.oobleyboo.com/

### Thanks

Thanks to John Reilly, Justin Grammens who did most of the work to get the original extension working under Radiant-0.7.1 and 0.8.0.

Huge thanks to Ingvi Gudmundsson (http://www.ingvithor.net/) for sponsoring and helping test v0.4 to v0.6.

### Licensing

Copyright (C) 2009-2010 Square Talent (http://www.squaretalent.com) released under the MIT license 
Copyright (C) 2008-2009 Aurora Software (http://www.aurorasoft.com.au), released under the MIT license 