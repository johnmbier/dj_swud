
class DjSwudController < ApplicationController
  def index
  end

  def random_word
    response = HTTParty.get 'http://randomword.setgetgo.com/get.php' # this makes the request to the API
    word = response.parsed_response #this grabs just the word from the response from the API
  end

  def show
    @dj = "#{person} #{random_word}"
  end
  
   

  def person
    random_number = rand(1..86) #this makes a random number between 1 and 86
    person = Swapi.get_person random_number
    person = JSON.parse person
    person["name"].split.first #gives "Luke" if person_one["name"] is "Luke Skywalker"
  end
  	#boba = Swapi.get_person 22     #returns the following STRING:
  	# "{\"name\":\"Boba Fett\",\"height\":\"183\",\"mass\":\"78.2\",\"hair_color\":\"black\",
   #  \"skin_color\":\"fair\",\"eye_color\":\"brown\",\"birth_year\":\"31.5BBY\",\"gender\":\"male\",
   #  \"homeworld\":\"http://swapi.co/api/planets/10/\",\"films\":[\"http://swapi.co/api/films/5/\",
   #  \"http://swapi.co/api/films/3/\",\"http://swapi.co/api/films/2/\"],\"species\":[\"http://swapi.co/api/species/1/\"],
   #  \"vehicles\":[],\"starships\":[\"http://swapi.co/api/starships/21/\"],\"created\":\"2014-12-15T12:49:32.457000Z\",
   #  \"edited\":\"2014-12-20T21:17:50.349000Z\",\"url\":\"http://swapi.co/api/people/22/\"}" 


  	#boba = JSON.parse boba     #returns the following HASH:
  	#  {"name":"Luke Skywalker","height":"172","mass":"77","hair_color":"blond","skin_color":"fair",
  	#  "eye_color":"blue","birth_year":"19BBY","gender":"male","homeworld":"http://swapi.co/api/planets/1/",
  	#  "films":["http://swapi.co/api/films/7/","http://swapi.co/api/films/6/","http://swapi.co/api/films/3/",
  	#  "http://swapi.co/api/films/2/","http://swapi.co/api/films/1/"],"species":["http://swapi.co/api/species/1/"],
  	#  "vehicles":["http://swapi.co/api/vehicles/14/","http://swapi.co/api/vehicles/30/"],"starships":["http://swapi.co/api/starships/12/",
  	#  "http://swapi.co/api/starships/22/"],"created":"2014-12-09T13:50:51.644000Z","edited":"2014-12-20T21:17:56.891000Z",
  	#  "url":"http://swapi.co/api/people/1/"} 

  	#boba["name"] #returns the following:
  	#"Boba Fett"
     

     #http http://swapi.co/api/people/schema/
     #person = JSON.parse person

  	# word = open('http://randomword.setgetgo.com/get.php') 
    
   #  puts word
  	

  # def name
  # 	name = JSON.parse people
  #   response["results"][0]["name"]
  # end

end
