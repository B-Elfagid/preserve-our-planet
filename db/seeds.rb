
betty = User.create(username: "betty", email: "betty@gmail.com", password: "password")
martha = User.create(username: "martha", email: "martha@yahoo.com", password: "password!")
melat = User.create(username: "melat", email: "melat@email.com", password: "password!!")

recy = Action.create(title: "Recycling", description: "recycled boxes", fact: "Recycling not only keeps rubbish away from our parks and beaches but also prevents dangerous materials from contaminating the environment.", image: climate_change2.jpg)
       

plan = Action.create(title: "tree planting", description: "planting two trees per day", fact: "An average size tree produces enough oxygen in one year to keep a family of four breathing.", image: climate-change.jpg)
      

walk = Action.create(title: "Walking", description: "walking to work instead of using a car", fact: "walking over other modes of transportation (such as a car), we reduce the number of harmful emissions created and released into the atmosphere.", image: climate.jpg)
      
    

       SavedAction.create(user: betty, action: recy)  
       SavedAction.create(user: martha, action: plan)  
       SavedAction.create(user: melat, action: walk)  
       


