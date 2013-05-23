This is the Actual README for this application.

INSTRUCTIONS
=======================================================================================================================
This project was developed in chrome and using a 1920x1080 display.


How to run:
You will need two open command prompts.
	1 is for the rails server
	The other is for the sunspot search engine

Change the root directory of both terminals to the root directory of the application with the ->cd example
Firstly run bundle install to ensure that all the current gems are correctly installed

'->' indicates the start of the command follows this statement


In one terminal run ->rails s
In the other run ->rake sunspot:solr:run

If there is problems with the sunspot command try running ->bundle exec rake:sunspot:solr:run
If this does not work refer to https://github.com/sunspot/sunspot

Now in the latest chrome browser type localhost:3000 in the url

This should dispay the application

Any problems with this please contact me on 0273284307, i seriously dont mind. I want an A

========================================================================================================================


Api documentation can be found in the application in doc/app/index.html

Found problems with the rake doc:app command where not all elements that I had commented would be displayed. Sorry for this inconvinience. I have commented the CRUD elements, the controllers and the models. Views are not commented as it is fairly trivial 

=========================================================================================================================
Would like to reference several sites and gems that helped me through this project


Devise 2.0 -> https://github.com/plataformatec/devise
	Tutorial -> http://railscasts.com/episodes/209-introducing-devise

Sunspot -> https://github.com/sunspot/sunspot
	Tutorial -> http://railscasts.com/episodes/278-search-with-sunspot

Browser -> https://github.com/fnando/browser

Other helpful tutorials
	+ http://railscasts.com/episodes/163-self-referential-association

Image link -> http://saradhamlanna.minus.com/lTl0SmalmJCOp