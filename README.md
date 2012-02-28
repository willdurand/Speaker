Speaker
=======

Convert a text file in an `mp3` audio file. Yeah! I know, it's probably useless for you, but I found
the idea pretty fun, and it's enough for me ;) I would like to thank Zach Holman for all his crazy ideas.
He gave me inspiration to write this tiny shell script.

See a real use case on my blog: [www.williamdurand.fr](http://www.williamdurand.fr).


Dependencies
------------

You need the `say` command which is bundled with Mac OSX, and `ffmpeg` you can install by running:

    brew install --use-clang --HEAD ffmpe


Usage
-----

    USAGE:
      ./speaker [-h] [-d <output directory>] <filename>


Use It With Jekyll
------------------

The aim of this script is to convert `markdown` files to `mp3` files in a [Jekyll](https://github.com/mojombo/jekyll)
environment. To provide an audio access to your readers, you'll have to add an HTML5 `<audio>` tag. To be
compatible with the most part of browsers, you should include [html5media](http://html5media.info/):

``` html
// _layouts/default.html
<script src="http://api.html5media.info/1.1.5/html5media.min.js"></script>
```

``` html
// _layouts/post.html
<audio src="/mp3/{{ page.id | remove_first:'/' | replace:'/','-' }}.mp3" controls preload></audio>
```

Then, add the provided `pre-commit` hook (`hooks/pre-commit`) to your local repository, and configure Git:

    git config hooks.speaker.bin=/path/to/speaker

You're done. Next time you'll commit a `_posts/*.markdown` file, you'll get a fresh `mp3` audio file.


Credits
-------

* William Durand <william.durand1@gmail.com>


License
-------

Speaker is released under the MIT License. See the bundled `LICENSE` file for details.
