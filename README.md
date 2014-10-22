Lab 6
====

In this lab, you will extend the base app you saw in lecture. It looks long, but each question
can be finished in under 10 lines of code! Ask plenty of questions during class to the TAs and on
Piazza.

Start with ```git clone https://github.com/rails-decal/lab6.git```

1. Recreate the steps we saw in lecture. For reference, the steps
   we went through in lecture are located at https://github.com/rails-decal/lecture6

   You should, at this point have an app where the Pokemon index page shows the User names
   and the User index page shows each user's pokemon (the same app as finished in lecture).

2. Notice that the users that don't have pokemon (at ```/users```) still have the
   "Pokemons:" list heading. Modify the html in ```app/views/users/index.html.erb``` so
   that if a user has no pokemon, the text says "No pokemon!". You should be able to do
   this with 4 extra lines of code total in the index view.
3. You'll notice that we'll often query for pokemon that match a certain user_id - 
   every time we write ```@user.pokemon```, the database needs to search through
   all the pokemon in the table to grab all the ones that have that user's ID.
   Discuss the runtime of rendering the users index action with your neighbor in
   terms of ```n```, where ```n``` is the number of users and pokemon in the database.

   We can cut down this runtime by using a _database index_ (see
   [here](http://rakeroutes.com/blog/increase-rails-performance-with-database-indexes/)).
   Generate a new migration to add an index to the ```:user_id``` column of pokemons,
   and discuss the new runtime of rendering the users index action with your neighbor,
   assuming adding an index allows queries using that index to run in O(1) time.
   
   Try to figure out how to do the migration yourself! [Reference the docs.](http://guides.rubyonrails.org/migrations.html)
   
   [After you migrate, Rails should make your schema should look exactly like the one here.](https://gist.github.com/SamLau95/cfa73a531fc3c14c7151) ***Do not modify ```schema.rb```.***

4. Add an ```edit.html.erb``` page that allows you to edit all the attributes of a Pokemon, and add the
   relevant ```edit``` action to the ```pokemons_controller.rb``` that initializes ```@pokemon``` to the
   pokemon specified in ```params[:id]```. Since we already have the ```simple_form``` gem installed the form
   should be very simple, the form should basically look like the
   [first example on their readme](https://github.com/plataformatec/simple_form#usage). The form
   itself can be done in 7 lines of code total.

   Add links to edit in the pokemons index page. Every pokemon should have a link to its edit
   page, so place it right before the ```</h4>``` tag using
   ```<%= link_to 'Edit', edit_pokemon_path(pokemon) %>```. This is the only thing you should add to
   the users ```index.html.erb```.
   
   What do you notice about the User field on the page? Why do you suppose this is the case?
   Discuss with your neighbors. What is a possible alternative?

5. Now we need the ```update``` action so the form actually does something. Write this method
   in the ```pokemons_controller.rb``` that redirects to the pokemons_path once it's done. Be sure to include and use
   this method at the bottom of the controller so that the params get sanitized before calling ```@pokemon.update(...)```:

   ```ruby
   def pokemon_params
      params.require(:pokemon).permit(:name, :description, :level, :user_id)
   end
   ```

   The ```update``` action should be written in three lines of code since we don't have validations on Pokemon!

   Now you can change the owners of Pokemon.

Congrats, you are done with the lab!
[Submit your written answers to 3 and 4 here](http://goo.gl/forms/eFUdOzDJwF) to receive the check-in code for today.
