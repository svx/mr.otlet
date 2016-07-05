========
Spelling
========

Please make use of spell and grammar checks as often as possible. This will help to improve the quality and helps to eliminate rework later.

mr.otlet uses `CircleCI <https://circleci.com/>`_ to do that for you on every push to the master branch.

In order to avoid unnecessary waiting time, you can also execute this tests locally first.

Tests
=====

All local tests must be executed from the *root* directory of the repository.

Spell-check
-----------

In order to run spell-check locally against the docs you can run:

.. code-block:: bash

    make spellcheck

Sometimes we use *special* words, meaning words which are for well known but are not included into a dictionary. You can add these words to the file called *spelling_wordlist.txt*, this will tell
Sphinx to ignore these ones during spell-checking.

Link-check
----------

In order to run link-check:

.. code-block:: bash

    make linkcheck
