# Brie

Brie is a lightweight keychain designed to keep track of up to ten commands of your choosing, and execute them for you.

How it works:

First, you add a key to the Brie Keychain. This is done in the form of a shell script; or a series thereof.

This script can be anything. Here’s an example that would transpire a CoffeeScript file to JavaScript, and commit it to Git:

Coffee —compile /src

Git add src/

Git commit -m ‘Brie Really Is Easy!’

Here is how you add this to the keychain, assuming this is saved as ‘brieScript.sh’:

Brie coagulate brieScript.sh first

Two notes here: 1. The numbering system: you can use either version (but no integers): eighth/eight; fifth/five. 2. The numbering is implicit for the first key, so if you want to save your most important script to the first key, it’s a bit easier. Therefore, this would work just fine:

Brie coagulate brieScript.sh

Also, you can setup a directory of multiple standalone shell scripts, point Brie towards that, and pull them together into one script. To do this, simply point Brie towards a directory. That’s it; no need to change the command or use flags.

Example:

Imagine this is your directory (someDirectory):
aShellFile.sh
anotherShellFile.sh
soManyShellFiles.sh

Brie coagulate someDirectory

Every script in that directory will be added into one script file, stored under a key (in this case, the first key).
However, this feature has not yet been implemented.


Now, just tell Brie to run it —assuming this is the first key:

Brie lick

The numbering is also implicit for the lick command; you could also use this version:

Brie lick first / brie lick one


If you forget what door a key is for — what script belongs to a key— you can check all keys and their scripts:

Brie terroir

Or, you can check a specific key, using the same numbering system as lick:

Brie monger first

Another example:

Brie monger eight

There is no deleting a key, however, you can only lock it temporarily —in the sense that it’s manually reversible; it will not be undone through time. If you would like to do this, follow the pattern, but use the ripen command:

Brie ripen fourth

If you go to use a ripened key, you will be met with a notice saying it is ripened, and details on how to unlock it. If you wish to unlock a key, use this:

Brie soften fourth

On the other side of ripening a key is replacing a key; you can’t clear the key, but you can change the script it’s linked to.

Brie salt newScript.sh fourth

This command will request confirmation, and provide a preview of the script to be replaced, and the script you are replacing it with.


Unlike Unagi, Brie is designed to store general purpose scripts that are reusable, and you won’t get all of the baggage associated with Unagi. Not to say Unagi is bloated or unoptimized, but Unagi is meant for servers, and Brie is meant for scripts that do something tedious, but they don’t have a very long life; they run and go away.

An alias solves the problem of matching a longer command to a shorter name, but, you don’t get the visibility like terroir and monger.

In later versions, I may bundle Ipswich into some of the functions to provide version control for your scripts. This would likely be an opt-in feature, however, as it adds a bit of baggage.
