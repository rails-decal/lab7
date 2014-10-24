# Lab 7

You can find [commands referenced in Lecture 7 here](https://docs.google.com/document/d/1SBjTup9o5XPnMngorulqlz-CfMLm1BBdmPFY45JnHrI).

In this lab, you will extend the Pokemon app you created in [Lab 6](https://github.com/rails-decal/lab6).

Start with ```git clone https://github.com/rails-decal/lab7.git```

1. Start by creating some fixtures. Fill in users.yml with 3 users, one with fixture name ```ash```, another ```misty```, and another ```brock```. The names should be ```Ash```, ```Misty```, ```Brock```. Set ```ash```'s number of badges to be 8. Set the other two to have 5 badges each. Set their ids to 1, 2, and 3 respectively.

   Next fill in pokemons.yml with 50 pokemon using embedded ruby. Each pokemon's fixture name should be ```pokemon_1```, ```pokemon_2```, etc. while the respective names should be ```Pokemon 1```, ```Pokemon 2```, etc. Each pokemon should have a random level between 1 and 5 inclusive. The id of the n-th pokemon should be n+1 and its user_id should be n % 3 + 1 (since we have 3 users that are 1-indexed, not 0-indexed). You don't need a description for the pokemon.

2. Now run ```rake test:controllers```. You should be seeing two failures. Open up the test file where those failures occur. Understand what the tests are testing for, and then fix the controller methods in the controller file that is erroring.

3. Now let's move on to validations. In ```test/models/user_test.rb```, validate that every User must have a name and the name must be unique. In ```pokemon_test.rb```, validate that every Pokemon must have a name, level, and user_id and also that the name is unique. Now run ```rake test:models```.

   Are your tests failing? Good! Figure out why and fix them!

4. Another type of test to define in your model tests are tests on your model methods. Let's take a stab at this. In ```app/models/user.rb```, write a method defined ```league_qualified?``` that returns True if the user is qualified for the Pokemon League - aka the user has 8 badges or more - and False if not. Then, in ```user_test.rb```, write a test to check that this method works correctly. Take a look at your fixtures to see who you can use to test this function's True return and False return. Run your model tests to make sure this works.

5. For this step, you will implement the ability to make new Pokemon so that you can test it in the next step. First, in ```app/views/pokemons/index.html.erb```, add this line at the top:

   ```<%= button_to "Make a new Pokemon", new_pokemon_path, :class => "button", :method => :get %>```

   Now, make the ```new``` method in your pokemons_controller and create the ```new.html.erb``` template so that there is a form to create new Pokemon. The form should essentially be the same as the edit form. Remember that after submitting the new form, Rails will call the method ```create``` in the pokemons controller, so make that method.

   Inside the ```create``` method, you want to instantiate the ```@pokemon``` variable to have the pokemon params that you made in the "new" form. Then, if you can successfully save the pokemon object, that means the validations passed and you should redirect back to the main Pokemons view page (remember use ```rake routes``` if you forget the path name). If you cannot successfully save the pokemon object, that means the validations failed, so flash an error by using the following line:

   ```flash[:error] = @pokemon.errors.full_messages.to_sentence```

   And then add the line ```render 'new'```. This tells the method to render the view ```new.html.erb``` again if the new pokemon fails to save, instead of trying to render ```create.html.erb```, which doesn't exist.

   In your localhost, go to "http://localhost:3000/pokemons" to test your new Pokemon creation form!

6. Okay now that you can create new Pokemon, right a test to verify that this controller method and request works! So in your ```pokemons_controller_test.rb```, add a test at the end that is called "should get new". First, reassign ```@pokemon``` so it is a new Pokemon, not one of the fixtures you created. Then, simulate the GET request for ```new``` and assert that this request was successful. You can run ```rake test:controllers``` to make sure this works.

   Lastly, create another test at the bottom of this file that is titled "should redirect to new if invalid". This test should look exactly like the one you just created, except instead of asserting that this request was successful, assert that it renders the template "new". Take a look at the [Rails specific assertions here](http://guides.rubyonrails.org/testing.html) for a hint on how to check for this!

   Run ```rake test:controllers``` again to make sure all tests pass. And ```rake test``` just for the hell of it too.

Congrats, you are done with the lab! Now you should work on [Project 1](https://github.com/rails-decal/proj1/) until the end of the lecture block.

